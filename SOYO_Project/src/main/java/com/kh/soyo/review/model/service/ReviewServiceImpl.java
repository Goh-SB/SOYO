package com.kh.soyo.review.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.review.model.dao.ReviewDao;
import com.kh.soyo.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewDao reviewDao;
    
    @Autowired
    private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return reviewDao.selectListCount(sqlSession);
	}
	
	@Override
	public List<Review> selectReviewList(PageInfo pi) {
		return reviewDao.selectReviewList(sqlSession, pi);
	}
	
	
	@Override
	public List<Review> selectBestReviewList() {
	    return reviewDao.selectBestReviewList(sqlSession);
	}

	@Override
	public List<Review> selectReviewList(int productNo) {
        List<Review> reviewList = reviewDao.selectReviewList(productNo);

        return reviewList;
	}

	@Override
	public int insertReview(Review review) {
		return reviewDao.insertReview(review);
	}

	@Override
	public int updateReview(Review review) {
		return reviewDao.updateReview(review);
	}

	@Override
	public int deleteReview(Review review) {
		return reviewDao.deleteReview(review);
	}

	@Override
	public Review selectReviewByNo(int reviewNo) {
		return reviewDao.selectReviewByNo(reviewNo);
	}

	@Override
	public int checkExistingLike(java.util.Map<String, Object> likeData) {
		return reviewDao.checkExistingLike(sqlSession, likeData);
	}

	@Override
	public int addLike(java.util.Map<String, Object> likeData) {
		return reviewDao.addLike(sqlSession, likeData);
	}

	@Override
	public int removeLike(java.util.Map<String, Object> likeData) {
		return reviewDao.removeLike(sqlSession, likeData);
	}

	@Override
	public int getLikeCount(int reviewNo) {
		return reviewDao.getLikeCount(sqlSession, reviewNo);
	}

}
