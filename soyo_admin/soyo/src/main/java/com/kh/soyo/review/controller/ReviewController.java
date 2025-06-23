package com.kh.soyo.review.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.common.template.Pagination;
import com.kh.soyo.review.model.service.ReviewService;
import com.kh.soyo.review.model.vo.Review;

@RestController
@CrossOrigin(origins="http://192.168.40.32:5173")
@RequestMapping("review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("list")
	public HashMap<String, Object> reviewList(@RequestParam("cpage") int currentPage) {
		
		int listCount = reviewService.reviewListCount();
		int pageLimit = 12;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Review> list = reviewService.reivewList(pi);
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("pi", pi);
		// System.out.println(list);
		
		return hm;
	}
	
	@GetMapping("detail")
	public void reviewDetail(@PathVariable int index) {
		
		
		
	}
	
	@GetMapping("delete")
	public String deleteBtn(Review review) {
		
		int result = reviewService.deleteBtn(review);
		
		return (result > 0) ? "삭제성공" : "삭제실패";
	}
	
	@GetMapping("repair")
	public String repairBtn(Review review) {
		
		int result = reviewService.repairBtn(review);
		
		return (result > 0) ? "복구성공" : "복구실패";
	}
	
	

}
