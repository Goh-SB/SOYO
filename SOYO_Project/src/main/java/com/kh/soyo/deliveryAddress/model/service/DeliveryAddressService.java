package com.kh.soyo.deliveryAddress.model.service;

import java.util.ArrayList;

import com.kh.soyo.deliveryAddress.model.vo.DeliveryAddress;

public interface DeliveryAddressService {

	ArrayList<DeliveryAddress> selectDelivery(String memberId);

}
