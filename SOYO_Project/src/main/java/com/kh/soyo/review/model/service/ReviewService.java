package com.kh.soyo.review.model.service;

import java.util.List;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.review.model.vo.Review;

public interface ReviewService {
    
    int selectListCount();
    
    // 메서드 오버로딩!
    List<Review> selectReviewList(PageInfo pi);

	List<Review> selectBestReviewList();

	List<Review> selectReviewList(int productNo);
	
	int insertReview(Review review);
	
	int updateReview(Review review);
	
	int deleteReview(Review review);
	
	Review selectReviewByNo(int reviewNo);
	
	// 좋아요 관련 메서드들
	int checkExistingLike(java.util.Map<String, Object> likeData);
	
	int addLike(java.util.Map<String, Object> likeData);
	
	int removeLike(java.util.Map<String, Object> likeData);
	
	int getLikeCount(int reviewNo);
	
}