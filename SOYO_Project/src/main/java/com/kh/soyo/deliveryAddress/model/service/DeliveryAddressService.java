package com.kh.soyo.deliveryAddress.model.service;

import java.util.ArrayList;

import com.kh.soyo.deliveryAddress.model.vo.DeliveryAddress;

public interface DeliveryAddressService {

	ArrayList<DeliveryAddress> selectDelivery(String memberId);

	int newDeliveryAddress(DeliveryAddress da);

	ArrayList<DeliveryAddress> selectDeliveryDefault(String memberId);

	ArrayList<DeliveryAddress> selectDeliveryNotDefault(String memberId);

	void updateDefault(DeliveryAddress d);

	int updateAddress(DeliveryAddress d);

	int deleteAddress(DeliveryAddress d);

}
