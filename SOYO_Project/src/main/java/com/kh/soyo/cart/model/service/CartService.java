package com.kh.soyo.cart.model.service;

import java.util.ArrayList;
import com.kh.soyo.cart.model.vo.Cart;

public interface CartService {

	// 장바구니 목록 조회용 서비스
	ArrayList<Cart> cartList(String memberId);

	int updateCartCount(String memberId, int productNo, int count);

	Cart updateCart(String memberId, int productNo, int productCount);



}