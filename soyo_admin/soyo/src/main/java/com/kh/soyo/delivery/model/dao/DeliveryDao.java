package com.kh.soyo.delivery.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.checkerframework.checker.units.qual.h;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.common.model.vo.Payment;
import com.kh.soyo.delivery.model.vo.Delivery;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.vo.Product;

@Repository
public class DeliveryDao {

	public ArrayList<Delivery> deliveryList(SqlSessionTemplate sqlSession,PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1 ) * limit;
	
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("deliveryMapper.deliveryList", null, rowBounds);
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

	public List<Payment> paymentList(SqlSessionTemplate sqlSession,  PageInfo pi) {
		
		int startRow = ((pi.getCurrentPage() - 1) * pi.getBoardLimit()) + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		 
		return sqlSession.selectList("deliveryMapper.paymentList", hm);
	}

	public List<Payment> searchMember(SqlSessionTemplate sqlSession, String memberName) {
		
		return sqlSession.selectList("deliveryMapper.searchMember",memberName);
	}

	public Delivery memberInfo(SqlSessionTemplate sqlSession, int orderNo) {
		
		return sqlSession.selectOne("deliveryMapper.memberInfo", orderNo);
	}

	public List<Payment> orderInfo(SqlSessionTemplate sqlSession, int orderNo) {
		
	    return sqlSession.selectList("deliveryMapper.orderInfo", orderNo);
	}

	public int deliveryListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("deliveryMapper.deliveryListCount");	
	}

	public int paymentListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("deliveryMapper.paymentListCount");
	}

	public int filterListCount(SqlSessionTemplate sqlSession, String orderStatus) {

		return sqlSession.selectOne("deliveryMapper.filterListCount", orderStatus);
	}

	public ArrayList<Delivery> filterList(SqlSessionTemplate sqlSession, PageInfo pi, String orderStatus) {

		
		int startRow = ((pi.getCurrentPage() - 1) * pi.getBoardLimit()) + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("orderStatus", orderStatus);
		
		
		return (ArrayList)sqlSession.selectList("deliveryMapper.filterList", hm);
	}

	public ArrayList<Delivery> paymentCount(SqlSessionTemplate sqlSession, int orderNo) {

		return (ArrayList)sqlSession.selectList("deliveryMapper.paymentCount", orderNo);
	}

	public Delivery paymentList(SqlSessionTemplate sqlSession, Delivery d2) {

		return sqlSession.selectOne("deliveryMapper.paymentList2", d2);
	}




}











