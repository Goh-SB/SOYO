package com.kh.soyo.delivery.model.service;

import java.util.List;

import com.kh.soyo.common.model.vo.Payment;
import com.kh.soyo.delivery.model.vo.Delivery;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.vo.Product;

public interface DeliveryService {

	 List<Delivery> deliveryList();
	 
	 Delivery deliveryDetail(int orderNo);

	List<Product> deliveryProduct(int orderNo);

	int changeStatus(int orderNo, String orderStatus);

	List<Payment> paymentList();

	List<Payment> searchMember(String memberName);

	Member memberInfo(String memberId);

	List<Payment> orderInfo(String memberId,int productNo);

	

	
}
