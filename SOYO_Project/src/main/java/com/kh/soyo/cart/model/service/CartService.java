package com.kh.soyo.cart.model.service;

import java.util.ArrayList;
import com.kh.soyo.cart.model.vo.Cart;

public interface CartService {
	// 장바구니 추가용 서비스
	int addCart(Cart c);

	// 장바구니 목록 조회용 서비스
	ArrayList<Cart> cartList(String memberId);
}