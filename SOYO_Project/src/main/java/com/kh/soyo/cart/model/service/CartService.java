package com.kh.soyo.cart.model.service;

import java.util.ArrayList;
import com.kh.soyo.cart.model.vo.Cart;

public interface CartService {
	// 장바구니 추가용 서비스
	int addCart(Cart c);

	// 장바구니 목록 조회용 서비스
	ArrayList<Cart> cartList(String memberId);

	// 장바구니 총액 계산용 서비스
	int sumMoney(String memberId);

	// 장바구니 상품 개별 삭제용 서비스
	int deleteCart(int cartNo);

	// 장바구니 비우기용 서비스
	int deleteAllCart(String memberId);

	// 장바구니 갱신용 서비스
	int modifyCart(Cart c);
}