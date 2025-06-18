package com.kh.soyo.cart.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.cart.model.vo.Cart;

@Repository
public class CartDao {

	public ArrayList<Cart> cartList(SqlSessionTemplate sqlSession, String memberId) {
		// select문(여러 행 조회)
		return (ArrayList)sqlSession.selectList("cartMapper.cartList", memberId);
	}

	public int updateCartCount(SqlSessionTemplate sqlSession, String memberId, int productNo, int count) {
		
		 Map<String, Object> param = new HashMap<>();
		    param.put("memberId", memberId);
		    param.put("productNo", productNo);
		    param.put("count", count);

		    return sqlSession.update("cartMapper.updateCartCount", param);
	}

	public Cart updateCart(SqlSessionTemplate sqlSession, String memberId, int productNo, int productCount) {
		
		Map<String, Object> param = new HashMap<>();
	    param.put("memberId", memberId);
	    param.put("productNo", productNo);
	    param.put("productCount", productCount);
	    
	    return sqlSession.selectOne("cartMapper.updateCart",param);
	}


}