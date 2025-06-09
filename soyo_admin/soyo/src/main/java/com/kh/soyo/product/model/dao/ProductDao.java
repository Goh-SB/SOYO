package com.kh.soyo.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.member.model.vo.Member;

@Repository
public class ProductDao {

	public int productListCount(SqlSessionTemplate sqlSession) {
		

		return sqlSession.selectOne("productMapper.productListCount");
	}

	public ArrayList<Member> productList(SqlSessionTemplate sqlSession, PageInfo pi) {
	
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1 ) * limit;
	
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("productMapper.productList", null, rowBounds); 
	}

	
}
