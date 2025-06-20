package com.kh.soyo.review.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.soyo.review.model.dao.ReviewDao;
import com.kh.soyo.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewDao reviewDao;
    
    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public List<Review> selectReviewList(int productNo) {
        List<Review> reviewList = reviewDao.selectReviewList(productNo);

        return reviewList;
    }

	@Override
	public List<Review> selectReviewList() {
		return reviewDao.selectReviewList(sqlSession);
	}
	
	
	@Override
	public List<Review> selectBestReviewList() {
	    return reviewDao.selectBestReviewList(sqlSession);
	}

	
}
