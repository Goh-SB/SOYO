package com.kh.soyo.deliveryAddress.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.deliveryAddress.model.vo.DeliveryAddress;

@Repository
public class DeliveryAddressDao {

	public ArrayList<DeliveryAddress> selectDelivery(SqlSessionTemplate sqlSession, String memberId) {
		
		return (ArrayList)sqlSession.selectList("deliveryAddressMapper.selectDelivery", memberId);
	}

	public int newDeliveryAddress(SqlSessionTemplate sqlSession, DeliveryAddress da) {
		
		return sqlSession.insert("deliveryAddressMapper.insertDelivery", da);
	}

	
	
}
