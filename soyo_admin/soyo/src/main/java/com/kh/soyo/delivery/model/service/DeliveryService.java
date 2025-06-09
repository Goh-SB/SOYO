package com.kh.soyo.delivery.model.service;

import java.util.List;

import com.kh.soyo.delivery.model.vo.Delivery;

public interface DeliveryService {

	 List<Delivery> deliveryList();

	 Delivery deliveryDetail(int orderNo);
}
