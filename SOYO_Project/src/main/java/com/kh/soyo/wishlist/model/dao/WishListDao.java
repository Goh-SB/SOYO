package com.kh.soyo.wishlist.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.soyo.wishlist.model.vo.Wish;

@Repository
public class WishListDao {

    @Autowired
    private SqlSession sqlSession;

    public int insertWish(Wish wish) {
        return sqlSession.insert("wishListMapper.insertWish", wish);
    }

    public int isWishAlreadyExists(Wish wish) {
        return sqlSession.selectOne("wishListMapper.checkWishDuplicate", wish);
    }
}
