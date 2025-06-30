package com.kh.soyo.delivery.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.common.model.vo.Payment;
import com.kh.soyo.delivery.model.dao.DeliveryDao;
import com.kh.soyo.delivery.model.vo.Delivery;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.vo.Product;

@Service
public class DeliveryServiceImpl implements DeliveryService{

	@Autowired
	private DeliveryDao deliveryDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Delivery> deliveryList(PageInfo pi) {
		return deliveryDao.deliveryList(sqlSession, pi);
	}
	
	@Override
	public Delivery deliveryDetail(int orderNo) {
		return deliveryDao.deliveryDetail(sqlSession,orderNo);
	}

	@Override
	public List<Product> deliveryProduct(int orderNo) {
		return deliveryDao.deliveryProduct(sqlSession,orderNo);
	}

	@Transactional
	@Override
	public int changeStatus(int orderNo, String status) {
		return deliveryDao.changeStatus(sqlSession,orderNo,status);
	}

	@Override
	public List<Payment> paymentList(PageInfo pi) {
		
		return deliveryDao.paymentList(sqlSession, pi);
	}

	@Override
	public List<Payment> searchMember(String memberName) {

		return deliveryDao.searchMember(sqlSession,memberName);
	}

	@Override
	public Delivery memberInfo(int orderNo) {
		return deliveryDao.memberInfo(sqlSession, orderNo);
	}

	@Override
	public List<Payment> orderInfo(int orderNo) {

	    return deliveryDao.orderInfo(sqlSession, orderNo);
	}

	@Override
	public int deliveryListCount() {
		
		return deliveryDao.deliveryListCount(sqlSession);
	}

	@Override
	public int paymentListCount() {

		return deliveryDao.paymentListCount(sqlSession);
	}


}
