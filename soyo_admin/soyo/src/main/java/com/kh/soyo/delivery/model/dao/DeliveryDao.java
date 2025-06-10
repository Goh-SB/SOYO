package com.kh.soyo.delivery.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.delivery.model.vo.Delivery;
import com.kh.soyo.product.model.vo.Product;

@Repository
public class DeliveryDao {

	public List<Delivery> deliveryList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("deliveryMapper.deliveryList");

	}
	public Delivery deliveryDetail(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("deliveryMapper.deliveryDetail",orderNo);
	}
	public List<Product> deliveryProduct(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectList("deliveryMapper.deliveryProduct",orderNo);
	}



}
