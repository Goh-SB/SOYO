package com.kh.soyo.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.dao.ProductDao;
import com.kh.soyo.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProductDao productDao;

	@Override
	public int productListCount() {
		return productDao.productListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> productList(PageInfo pi) {
		return productDao.productList(sqlSession, pi);
	}

	@Override
	public int enrollForm(Product product) {

		int result1 = productDao.enrollForm(sqlSession, product);
		int result2 = 0;
		if(result1 > 0) {
			 result2 = productDao.enrollFormSize(sqlSession, product);
		}
		return result1 * result2;
	}
	
}
