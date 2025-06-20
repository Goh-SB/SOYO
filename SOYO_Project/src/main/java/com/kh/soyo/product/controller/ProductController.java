package com.kh.soyo.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.soyo.product.model.service.ProductService;
import com.kh.soyo.product.model.vo.Product;
import com.kh.soyo.review.model.service.ReviewService;
import com.kh.soyo.review.model.vo.Review;

import java.util.List;


@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ReviewService reviewService;

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
	                              Model model) {

	    List<Product> productList;

	    switch (type) {
	        case "mens":
	            productList = productService.selectProductListByCategory("남성");
	            break;
	        case "womens":
	            productList = productService.selectProductListByCategory("여성");
	            break;
	        case "kids":
	            productList = productService.selectProductListByCategory("아동");
	            break;
	        case "accessory":
	            productList = productService.selectProductListByCategory("악세사리");
	            break;
	        default:  // type == "all" 또는 null일 경우
	            productList = productService.selectProductList();
	    }

	    model.addAttribute("productList", productList);
	    model.addAttribute("type", type); // JSP에서 필요할 수 있음
	    return "product/productList";
	}

	
}