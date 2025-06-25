package com.kh.soyo.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.common.template.Pagination;
import com.kh.soyo.review.model.service.ReviewService;
import com.kh.soyo.review.model.vo.Review;

import jakarta.servlet.http.HttpSession;

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
	
	@PostMapping("/insert")
	@ResponseBody
	public Map<String, Object> insertReview(@RequestBody Review review, HttpSession session) {
		Map<String, Object> response = new HashMap<>();
		
		try {
			// 세션에서 로그인한 사용자 정보 가져오기
			Object loginUser = session.getAttribute("loginUser");
			if (loginUser == null) {
				response.put("success", false);
				response.put("message", "로그인이 필요합니다.");
				return response;
			}
			
			// 사용자 ID 설정 (Member 객체에서 memberId 가져오기)
			String memberId = null;
			if (loginUser instanceof com.kh.soyo.member.model.vo.Member) {
				memberId = ((com.kh.soyo.member.model.vo.Member) loginUser).getMemberId();
			}
			
			if (memberId == null) {
				response.put("success", false);
				response.put("message", "사용자 정보를 찾을 수 없습니다.");
				return response;
			}
			
			review.setMemberId(memberId);
			review.setStatus("Y"); // 활성 상태로 설정
			
			int result = reviewService.insertReview(review);
			
			if (result > 0) {
				response.put("success", true);
				response.put("message", "리뷰가 성공적으로 등록되었습니다.");
			} else {
				response.put("success", false);
				response.put("message", "리뷰 등록에 실패했습니다.");
			}
			
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "서버 오류가 발생했습니다: " + e.getMessage());
		}
		
		return response;
	}
	
}