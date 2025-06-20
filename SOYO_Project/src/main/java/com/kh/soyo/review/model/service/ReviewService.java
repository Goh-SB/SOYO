package com.kh.soyo.review.model.service;

import java.util.List;
import com.kh.soyo.review.model.vo.Review;

public interface ReviewService {
    List<Review> selectReviewList(int productNo);
    
    // 메서드 오버로딩!
    List<Review> selectReviewList();

	List<Review> selectBestReviewList();
	
}