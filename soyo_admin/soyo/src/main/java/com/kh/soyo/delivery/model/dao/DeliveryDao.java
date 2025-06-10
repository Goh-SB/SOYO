package com.kh.soyo.delivery.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.delivery.model.vo.Delivery;

@Repository
public class DeliveryDao {

	public List<Delivery> deliveryList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("deliveryMapper.deliveryList");

	}
	public Delivery deliveryDetail(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("deliveryMapper.deliveryDetail",orderNo);
	}



}
