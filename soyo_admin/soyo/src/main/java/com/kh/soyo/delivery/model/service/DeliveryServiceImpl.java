package com.kh.soyo.delivery.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.soyo.delivery.model.dao.DeliveryDao;
import com.kh.soyo.delivery.model.vo.Delivery;

@Service
public class DeliveryServiceImpl implements DeliveryService{

	@Autowired
	private DeliveryDao deliveryDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Delivery> deliveryList() {
		return deliveryDao.deliveryList(sqlSession);
	}
	
	@Override
	public Delivery deliveryDetail(int orderNo) {
		return deliveryDao.deliveryDetail(sqlSession,orderNo);
	}
	


}
