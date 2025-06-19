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
        System.out.println("ReviewDao에 넘어온 productNo = " + productNo);
        System.out.println("SqlSession 객체: " + sqlSession);
        
        try {
            List<Review> result = sqlSession.selectList("reviewMapper.selectReviewList", productNo);
            System.out.println("쿼리 실행 완료, 결과 개수: " + result.size());
            return result;
        } catch (Exception e) {
            System.out.println("쿼리 실행 중 에러: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
}
