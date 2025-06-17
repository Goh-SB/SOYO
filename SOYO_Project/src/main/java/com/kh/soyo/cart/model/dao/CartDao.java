package com.kh.soyo.cart.model.dao;

import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.cart.model.vo.Cart;

@Repository
public class CartDao {

	public ArrayList<Cart> cartList(SqlSessionTemplate sqlSession, String memberId) {
		// select문(여러 행 조회)
		return (ArrayList)sqlSession.selectList("cartMapper.cartList", memberId);
	}
}