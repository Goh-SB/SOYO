package com.kh.soyo.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {

	@GetMapping("/productDetail")
	public String showProductDetail() {
	    return "product/productDetail";
	}
	
	@GetMapping("productList")
	public String showProductList() {
		return "product/productList";
	}
	
}