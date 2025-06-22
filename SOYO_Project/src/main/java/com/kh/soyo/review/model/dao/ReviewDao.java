package com.kh.soyo.review.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.review.model.vo.Review;

@Repository
public class ReviewDao {
    
	@Autowired
    private SqlSessionTemplate sqlSession;
	
    public int selectListCount(SqlSessionTemplate sqlSession) {
    	return sqlSession.selectOne("reviewMapper.selectReviewListCount");
    }
    
    public List<Review> selectReviewList(SqlSessionTemplate sqlSession, PageInfo pi) {
    	return (List)sqlSession.selectList("reviewMapper.selectAllReviewList", pi);
    }

	public List<Review> selectBestReviewList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("reviewMapper.selectBestReviewList");
	}

	public List<Review> selectReviewList(int productNo) {
		List<Review> result = sqlSession.selectList("reviewMapper.selectReviewList", productNo);
        return result;
	}
    
}
