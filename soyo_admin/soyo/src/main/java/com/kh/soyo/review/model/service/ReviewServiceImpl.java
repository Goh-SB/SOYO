package com.kh.soyo.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.review.dao.ReviewDao;
import com.kh.soyo.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int reviewListCount() {

		return reviewDao.reviewListCount(sqlSession);
	}

	@Override
	public ArrayList<Review> reivewList(PageInfo pi) {

		return reviewDao.reviewList(sqlSession, pi);
	}

	@Override
	public int deleteBtn(Review review) {

		return reviewDao.deleteBtn(sqlSession, review);
	}

	@Override
	public int repairBtn(Review review) {

		return reviewDao.repairBtn(sqlSession, review);
	}
	
}
