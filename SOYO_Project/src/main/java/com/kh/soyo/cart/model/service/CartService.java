package com.kh.soyo.cart.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.soyo.cart.model.vo.Cart;

public interface CartService {

	// 장바구니 목록 조회용 서비스
	ArrayList<Cart> cartList(String memberId);

	int updateCartCount(String memberId, int productNo, int count);

	Cart updateCart(String memberId, int productNo, int productCount);

	int deleteSelected(String memberId, List<Integer> productNoList);

	int getTotalPrice(String memberId, List<Integer> productId);

	List<Cart> selectedProducts(String memberId, List<Integer> productNoList);



}