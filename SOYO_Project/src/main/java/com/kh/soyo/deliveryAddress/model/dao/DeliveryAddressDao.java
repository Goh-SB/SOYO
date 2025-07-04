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

	public ArrayList<DeliveryAddress> selectDeliveryDefault(SqlSessionTemplate sqlSession, String memberId) {
		
		return (ArrayList)sqlSession.selectList("deliveryAddressMapper.selectDeliveryDefault", memberId);
	}

	public ArrayList<DeliveryAddress> selectDeliveryNotDeault(SqlSessionTemplate sqlSession, String memberId) {
		
		return (ArrayList)sqlSession.selectList("deliveryAddressMapper.selectDeliveryNotDefault", memberId);
	}

	public void updateDefault(SqlSessionTemplate sqlSession, DeliveryAddress d) {
		
		sqlSession.update("deliveryAddressMapper.updateDefault",d);
	}

	public void newUpdateDefault(SqlSessionTemplate sqlSession, DeliveryAddress d) {
		
		sqlSession.update("deliveryAddressMapper.newUpdateDefault",d);
	}

	public int updateAddress(SqlSessionTemplate sqlSession, DeliveryAddress d) {
		
		return sqlSession.update("deliveryAddressMapper.updateAddress",d);
	}

	public int deleteAddress(SqlSessionTemplate sqlSession, DeliveryAddress d) {
		
		return sqlSession.delete("deliveryAddressMapper.deleteAddress",d);
	}

	public int enrollDelivery(SqlSessionTemplate sqlSession, DeliveryAddress del) {
		
		return sqlSession.insert("deliveryAddressMapper.enrollDelivery", del);
	}

	
	
}
