package com.kh.soyo.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.soyo.review.model.vo.Review;

@Repository
public class ReviewDao {

    @Autowired
    private SqlSession sqlSession;

    public List<Review> selectReviewList(int productNo) {
        
        try {
            List<Review> result = sqlSession.selectList("reviewMapper.selectReviewList", productNo);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
}
