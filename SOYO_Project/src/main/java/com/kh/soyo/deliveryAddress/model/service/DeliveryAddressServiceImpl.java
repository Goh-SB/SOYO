package com.kh.soyo.deliveryAddress.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.soyo.deliveryAddress.model.dao.DeliveryAddressDao;
import com.kh.soyo.deliveryAddress.model.vo.DeliveryAddress;

@Service
public class DeliveryAddressServiceImpl implements DeliveryAddressService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private DeliveryAddressDao deliveryAddress;
	
	@Override
	public ArrayList<DeliveryAddress> selectDelivery(String memberId) {
		
		return deliveryAddress.selectDelivery(sqlSession, memberId);
	}

	@Override
	public int newDeliveryAddress(DeliveryAddress da) {
		
		return deliveryAddress.newDeliveryAddress(sqlSession, da);
	}

	@Override
	public ArrayList<DeliveryAddress> selectDeliveryDefault(String memberId) {
		
		return deliveryAddress.selectDeliveryDefault(sqlSession, memberId);
	}

	@Override
	public ArrayList<DeliveryAddress> selectDeliveryNotDefault(String memberId) {
		
		return deliveryAddress.selectDeliveryNotDeault(sqlSession, memberId);
	}

	@Override
	public void updateDefault(DeliveryAddress d) {
		
		// 기존의 기본배송지 삭제
		deliveryAddress.newUpdateDefault(sqlSession, d);
		
		// 기본 배송지 등록
		deliveryAddress.updateDefault(sqlSession, d);
	}

	@Override
	public int updateAddress(DeliveryAddress d) {
		
		return deliveryAddress.updateAddress(sqlSession, d);
	}

	@Override
	public int deleteAddress(DeliveryAddress d) {
		
		return deliveryAddress.deleteAddress(sqlSession, d);
	}



	
	
}
