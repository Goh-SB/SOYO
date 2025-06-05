package com.kh.soyo.cart.model.service;

import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.kh.soyo.cart.model.dao.CartDao;
import com.kh.soyo.cart.model.vo.Cart;

@Service
public class CartServiceImpl implements CartService {
	// 의존성 주입
	@Autowired
	private SqlSessionTemplate sqlSession;
		
	@Autowired
	private CartDao cartDao;

	@Override
	public int addCart(Cart c) {
		return cartDao.addCart(sqlSession, c);
	}

	@Override
	public ArrayList<Cart> cartList(String memberId) {
		return cartDao.cartList(sqlSession, memberId);
	}
}