package com.kh.soyo.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.soyo.review.model.service.ReviewService;
import com.kh.soyo.review.model.vo.Review;

import java.util.List;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/review")
	public String showReviewList() {
		return "review/review";
	}

    @RequestMapping("/review/list")
    public String selectReviewList(@RequestParam("productNo") int productNo,
                                   HttpServletRequest request) {

        List<Review> reviewList = reviewService.selectReviewList(productNo);
        request.setAttribute("reviewList", reviewList);

        return "product/reviewList";
    }
	
}