package com.kh.soyo.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.soyo.review.model.service.ReviewService;
import com.kh.soyo.review.model.vo.Review;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/review")
	public String showReviewList(Model model) {
	    List<Review> reviewList = reviewService.selectReviewList();
	    List<Review> bestReviewList = reviewService.selectBestReviewList();
	    
	    model.addAttribute("reviewList", reviewList);
	    model.addAttribute("bestReviewList", bestReviewList);
	    
	    return "review/review";
	}
	
}