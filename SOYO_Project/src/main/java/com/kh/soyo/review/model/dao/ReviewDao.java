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
	
	public int insertReview(Review review) {
		return sqlSession.insert("reviewMapper.insertReview", review);
	}
	
	public int updateReview(Review review) {
		return sqlSession.update("reviewMapper.updateReview", review);
	}
	
	public int deleteReview(Review review) {
		return sqlSession.update("reviewMapper.deleteReview", review);
	}
	
	public Review selectReviewByNo(int reviewNo) {
		return sqlSession.selectOne("reviewMapper.selectReviewByNo", reviewNo);
	}
	
	// 좋아요 관련 메서드들
	public int checkExistingLike(SqlSessionTemplate sqlSession, java.util.Map<String, Object> likeData) {
		return sqlSession.selectOne("reviewMapper.checkExistingLike", likeData);
	}
	
	public int addLike(SqlSessionTemplate sqlSession, java.util.Map<String, Object> likeData) {
		return sqlSession.insert("reviewMapper.addLike", likeData);
	}
	
	public int removeLike(SqlSessionTemplate sqlSession, java.util.Map<String, Object> likeData) {
		return sqlSession.delete("reviewMapper.removeLike", likeData);
	}
	
	public int getLikeCount(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.selectOne("reviewMapper.getLikeCount", reviewNo);
	}
    
}
