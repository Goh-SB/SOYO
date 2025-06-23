package com.kh.soyo.review.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.review.model.vo.Review;

@Repository
public class ReviewDao {

	public int reviewListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reviewMapper.reviewListCount");
	}

	public ArrayList<Review> reviewList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("reviewMapper.reviewList", null, rowBounds);
	}

	public int repairBtn(SqlSessionTemplate sqlSession, Review review) {

		return sqlSession.update("reviewMapper.repairBtn", review);
	}

	public int deleteBtn(SqlSessionTemplate sqlSession, Review review) {

		return sqlSession.update("reviewMapper.deleteBtn", review);
	};

	
	
}
