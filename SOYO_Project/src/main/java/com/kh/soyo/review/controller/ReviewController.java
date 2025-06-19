package com.kh.soyo.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@GetMapping("/review")
	public String showReviewList() {
		return "review/review";
	}
	
}