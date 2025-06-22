package com.kh.soyo.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.common.template.Pagination;
import com.kh.soyo.review.model.service.ReviewService;
import com.kh.soyo.review.model.vo.Review;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/review")
	public String showReviewList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		
		int listCount = reviewService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
	    List<Review> reviewList = reviewService.selectReviewList(pi);
	    List<Review> bestReviewList = reviewService.selectBestReviewList();
	    
	    model.addAttribute("reviewList", reviewList);
	    model.addAttribute("bestReviewList", bestReviewList);
	    model.addAttribute("pi", pi);
	    
	    return "review/review";
	}
	
}