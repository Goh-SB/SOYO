package com.kh.soyo.cart.model.dao;

import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.cart.model.vo.Cart;

@Repository
public class CartDao {
	public int addCart(SqlSessionTemplate sqlSession, Cart c) {
		// insert문
		return sqlSession.insert("cartMapper.addCart", c);
	}

	public ArrayList<Cart> cartList(SqlSessionTemplate sqlSession, String memberId) {
		// select문(여러 행 조회)
		return (ArrayList)sqlSession.selectList("cartMapper.cartList", memberId);
	}

	public int sumMoney(SqlSessionTemplate sqlSession, String memberId) {
		// select문(단일행 조회)
		return sqlSession.selectOne("cartMapper.sumMoney", memberId);
	}

	public int deleteCart(SqlSessionTemplate sqlSession, int cartNo) {
		// delete문
		return sqlSession.delete("cartMapper.deleteCart", cartNo);
	}

	public int deleteAllCart(SqlSessionTemplate sqlSession, String memberId) {
		// delete문
		return sqlSession.delete("cartMapper.deleteAllCart", memberId);
	}

	public int modifyCart(SqlSessionTemplate sqlSession, Cart c) {
		// update문
		return sqlSession.update("cartMapper.modifyCart", c);
	}
}