package com.kh.soyo.delivery.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.common.model.vo.Payment;
import com.kh.soyo.delivery.model.vo.Delivery;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.vo.Product;

public interface DeliveryService {

	ArrayList<Delivery> deliveryList(PageInfo pi);
	 
	 Delivery deliveryDetail(int orderNo);

	List<Product> deliveryProduct(int orderNo);

	int changeStatus(int orderNo, String orderStatus);

	List<Payment> paymentList(PageInfo pi);

	List<Payment> searchMember(String memberName);

	Delivery memberInfo(int orderNo);
	
	int deliveryListCount();

	List<Payment> orderInfo(int orderNo);

	int paymentListCount();

	int filterListCount(String orderStatus);

	ArrayList<Delivery> filterList(PageInfo pi, String orderStatus);

	ArrayList<Delivery> paymentCount(int orderNo);

	Delivery paymentList(Delivery d2);


}
