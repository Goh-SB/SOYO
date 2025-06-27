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

	
	
}
