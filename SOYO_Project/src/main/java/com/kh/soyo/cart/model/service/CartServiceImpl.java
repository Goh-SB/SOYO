package com.kh.soyo.cart.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.soyo.cart.model.dao.CartDao;
import com.kh.soyo.cart.model.vo.Cart;
import com.kh.soyo.cart.model.vo.Delivery;

@Service
public class CartServiceImpl implements CartService {
	// 의존성 주입
	@Autowired
	private SqlSessionTemplate sqlSession;
		
	@Autowired
	private CartDao cartDao;

	@Override
	public ArrayList<Cart> cartList(String memberId) {
		return cartDao.cartList(sqlSession, memberId);
	}

	@Transactional 
	@Override
	public int updateCartCount(Cart cart) {
		
		return cartDao.updateCartCount(sqlSession, cart);
	}

	@Override
	public Cart updateCart(String memberId, int productNo, int productCount) {
		
		return cartDao.updateCart(sqlSession, memberId, productNo, productCount);
	}

	@Override
	public int deleteSelected(String memberId, List<Integer> productNoList) {
		
		return cartDao.deleteSelected(sqlSession,memberId,productNoList);
	}


	@Override
	public int getTotalPrice(String memberId, List<Integer> productId) {
		
		return cartDao.getTotalPrice(sqlSession,memberId,productId);
	}

	@Override
	public List<Cart> selectedProducts(String memberId, List<Integer> productNoList) {
		
		return cartDao.selectedProducts(sqlSession,memberId,productNoList);
	}

	@Override
	@Transactional
	public int deliveryInfo(Delivery delivery) {
	    int result1 = cartDao.insertOrder(sqlSession, delivery);  

	    return result1;
	}

	@Override
	public int insertCart(Cart cart) {
		return cartDao.insertCart(sqlSession, cart);
	}

	@Override
	public int insertPayment(Delivery delivery) {
	    return cartDao.insertPayment(sqlSession, delivery);
	}

	
	@Override
	public int removeSingleItem(String memberId, int productNo, String productSize) {
		return cartDao.deleteSingleItem(memberId, productNo, productSize);
	}

	@Override
	public int checkCart(Cart cart) {
		
		return cartDao.checkCart(sqlSession, cart);
	}
	
	
	@Override
	public int deleteCartProduct(Delivery delivery) {
		
		
		return cartDao.deleteCartProduct(sqlSession, delivery);
		
		 
	}

	@Override
	public Cart loadInfo(Delivery delivery) {
		
		return cartDao.loadInfo(sqlSession,delivery);
	}

	@Override
	public int changeStock(Delivery delivery) {
		
		return cartDao.changeStock(sqlSession,delivery);
	}



}