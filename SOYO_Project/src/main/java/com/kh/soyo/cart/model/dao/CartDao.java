package com.kh.soyo.cart.model.dao;

import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.soyo.cart.model.vo.Cart;

public class CartDao {
	public int addCart(SqlSessionTemplate sqlSession, Cart c) {
		// insert문
		return sqlSession.insert("cartMapper.addCart", c);
	}

	public ArrayList<Cart> cartList(SqlSessionTemplate sqlSession, String memberId) {
		// select문
		return (ArrayList)sqlSession.selectList("cartMapper.cartList", memberId);
	}
}