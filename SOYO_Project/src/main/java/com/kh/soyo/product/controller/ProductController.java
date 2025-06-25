package com.kh.soyo.product.controller;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.common.template.Pagination;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.service.ProductService;
import com.kh.soyo.product.model.vo.Product;
import com.kh.soyo.review.model.service.ReviewService;
import com.kh.soyo.review.model.vo.Review;
import com.kh.soyo.wishlist.model.service.WishListService;
import com.kh.soyo.wishlist.model.vo.Wish;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ReviewService reviewService;

	@Autowired
	private WishListService wishListService;

	
	@GetMapping("/stock")
	@ResponseBody
	public Map<String, Object> getProductStock(@RequestParam("productNo") int productNo,
	                                           @RequestParam("size") String productSize) {
		
	    int stock = productService.getProductStock(productNo, productSize);
	    Map<String, Object> result = new HashMap<>();
	    result.put("stock", stock);
	    return result;
	}

	
	@ResponseBody
	@GetMapping("/sort")
	public Map<String, Object> ajaxSortedList(@RequestParam String category,
	                                    @RequestParam(name = "sort", required = false, defaultValue = "popular") String sort,
	                                    @RequestParam(value = "page", defaultValue = "1") int currentPage) {
		
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

	    int listCount = productService.selectProductListCountByCategory(category);
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 8);
	    
	    List<Product> products = productService.selectSortedProductList(category, sort, pi);
	    
	    Map<String, Object> response = new HashMap<>();
	    response.put("products", products);
	    response.put("pi", pi);
	    
	    return response;
	}

	

	@GetMapping("/productDetail")
	public String showProductDetail(@RequestParam("no") int productNo, Model model, HttpSession session) {
	    // 상품 상세 정보 리스트 조회
	    List<Product> productList = productService.selectProductByNo(productNo);

	    if (productList == null || productList.isEmpty()) {
	        // 예외 처리: 상품이 존재하지 않을 때
	        return "common/errorPage"; // 에러 페이지로 리턴하거나 메시지 전달
	    }

	    // 첫 번째 상품 정보 사용 (대표 정보)
	    Product product = productList.get(0);

	    // 로그인한 회원 정보 가져오기
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    boolean isWished = false;
	    if (loginUser != null) {
	        String memberId = loginUser.getMemberId();

	        // 장바구니 담긴 상태 조회
	        boolean inCart = productService.isInCart(memberId, productNo);
	        product.setInCart(inCart);

	        // 찜 여부 조회
	        Wish wish = new Wish();
	        wish.setMemberId(memberId);
	        wish.setProductNo(productNo);
	        isWished = wishListService.isWishAlreadyExists(wish);
	    }
	    model.addAttribute("isWished", isWished);

	    // 태그 및 리뷰 조회
	    List<String> tagList = productService.getTagsForProduct(productNo);
	    List<Review> reviewList = reviewService.selectReviewList(productNo);

	    // 모델에 담아서 전달
	    model.addAttribute("product", product);           // 단일 상품 정보
	    model.addAttribute("productList", productList);   // 사이즈별 상품 리스트
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