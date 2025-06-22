package com.kh.soyo.cart.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.cart.model.vo.Cart;
import com.kh.soyo.cart.model.vo.Delivery;

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

	public int deleteSelected(SqlSessionTemplate sqlSession, String memberId, List<Integer> productNoList) {
		
		Map<String, Object> param = new HashMap<>();
	    param.put("memberId", memberId);
	    param.put("productNoList", productNoList);
	    
	    return sqlSession.delete("cartMapper.deleteSelected",param);
	}



	public int getTotalPrice(SqlSessionTemplate sqlSession, String memberId, List<Integer> productId) {
		
		Map<String, Object> param = new HashMap<>();
	    param.put("memberId", memberId);
	    param.put("productNoList", productId);
	    
		return sqlSession.selectOne("cartMapper.getTotalPrice",param);
	}

	public List<Cart> selectedProducts(SqlSessionTemplate sqlSession, String memberId, List<Integer> productNoList) {
		
		Map<String, Object> param = new HashMap<>();
	    param.put("memberId", memberId);
	    param.put("productNoList", productNoList);
	    
		return sqlSession.selectList("cartMapper.selectedProducts",param);
	}

	public int insertOrder(SqlSessionTemplate sqlSession, Delivery delivery) {
		
		return sqlSession.insert("cartMapper.insertOrder",delivery);
	}

	public int insertAddress(SqlSessionTemplate sqlSession, Delivery delivery) {
		
		return sqlSession.insert("cartMapper.insertAddress",delivery);
	}

	public int deleteCartProduct(SqlSessionTemplate sqlSession, Delivery delivery) {
		
		return sqlSession.delete("cartMapper.deleteCartProduct",delivery);
	}

	public int insertCart(SqlSessionTemplate sqlSession, Cart cart) {
		return sqlSession.insert("cartMapper.insertCart", cart);
	}


}