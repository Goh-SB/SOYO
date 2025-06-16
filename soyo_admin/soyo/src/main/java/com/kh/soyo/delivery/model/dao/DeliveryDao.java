package com.kh.soyo.delivery.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.common.model.vo.Payment;
import com.kh.soyo.delivery.model.vo.Delivery;
import com.kh.soyo.member.model.vo.Member;
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

	public int changeStatus(SqlSessionTemplate sqlSession, int orderNo, String orderStatus) {
	    Map<String, Object> param = new HashMap<>();
	    param.put("orderNo", orderNo);
	    param.put("orderStatus", orderStatus);
	    return sqlSession.update("deliveryMapper.changeStatus", param);
	}

	public List<Payment> paymentList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("deliveryMapper.paymentList");
	}

	public List<Payment> searchMember(SqlSessionTemplate sqlSession, String memberName) {
		
		return sqlSession.selectList("deliveryMapper.searchMember",memberName);
	}

	public Member memberInfo(SqlSessionTemplate sqlSession, String memberId) {
		
		return sqlSession.selectOne("deliveryMapper.memberInfo",memberId);
	}

	public List<Payment> orderInfo(SqlSessionTemplate sqlSession, Map<String, Object> param) {
		
	    return sqlSession.selectList("deliveryMapper.orderInfo", param);
	}



}











