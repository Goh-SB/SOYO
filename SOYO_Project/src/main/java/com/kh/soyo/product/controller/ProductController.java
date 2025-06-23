package com.kh.soyo.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.common.template.Pagination;
import com.kh.soyo.product.model.service.ProductService;
import com.kh.soyo.product.model.vo.Product;
import com.kh.soyo.review.model.service.ReviewService;
import com.kh.soyo.review.model.vo.Review;


@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ReviewService reviewService;

	@ResponseBody
	@GetMapping("/sort")
	public List<Product> ajaxSortedList(@RequestParam String category,
	                                    @RequestParam(name = "sort", required = false, defaultValue = "popular") String sort) {
		
	    // category 파라미터를 DB에 맞게 한글로 변환
	    switch (category) {
	        case "womens":
	            category = "여성";
	            break;
	        case "mens":
	            category = "남성";
	            break;
	        case "kids":
	            category = "아동";
	            break;
	        case "accessory":
	            category = "악세사리";
	            break;
	        default:
	            category = null; // SQL WHERE 조건에서 null이면 매칭 안 됨
	    }

	    return productService.selectSortedProductList(category, sort);
	}

	

	@GetMapping("/productDetail")
	public String showProductDetail(@RequestParam("no") int productNo, Model model) {
	    // 상품 상세 정보 조회
	    Product product = productService.selectProductByNo(productNo);

	    // 해당 상품에 연결된 태그 목록 조회
	    List<String> tagList = productService.getTagsForProduct(productNo);

	    // 해당 상품 리뷰 목록 조회
	    List<Review> reviewList = reviewService.selectReviewList(productNo);
	    
	    // 모델에 담아서 JSP로 전달
	    model.addAttribute("product", product);
	    model.addAttribute("tagList", tagList);
	    model.addAttribute("reviewList", reviewList);

	    return "product/productDetail";
	}


	
	@GetMapping("/productList")
	public String showProductList(@RequestParam(value = "type", required = false, defaultValue = "all") String type,
	                              @RequestParam(value = "search", required = false) String search,
								  @RequestParam(value="cpage", defaultValue="1") int currentPage,
	                              Model model) {

		int listCount;

	    if (search != null && !search.trim().isEmpty()) {
			listCount = productService.searchProductListCount(type, search);
	    } else {
	        switch (type) {
	            case "mens":
					listCount = productService.selectProductListCountByCategory("남성");
	                break;
	            case "womens":
					listCount = productService.selectProductListCountByCategory("여성");
	                break;
	            case "kids":
					listCount = productService.selectProductListCountByCategory("아동");
	                break;
	            case "accessory":
					listCount = productService.selectProductListCountByCategory("악세사리");
	                break;
	            default:
					listCount = productService.selectProductListCount();
	        }
	    }
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 8);

		List<Product> productList;

		if (search != null && !search.trim().isEmpty()) {
			productList = productService.searchProductList(type, search, pi);
		} else {
			switch (type) {
				case "mens":
					productList = productService.selectProductListByCategory("남성", pi);
					break;
				case "womens":
					productList = productService.selectProductListByCategory("여성", pi);
					break;
				case "kids":
					productList = productService.selectProductListByCategory("아동", pi);
					break;
				case "accessory":
					productList = productService.selectProductListByCategory("악세사리", pi);
					break;
				default:
					productList = productService.selectProductList(pi);
			}
		}


	    model.addAttribute("productList", productList);
	    model.addAttribute("type", type);
	    model.addAttribute("search", search); 
		model.addAttribute("pi", pi);

	    return "product/productList";
	}


	
}