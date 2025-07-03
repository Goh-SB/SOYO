package com.kh.soyo.product.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	@Transactional
	public int enrollForm(Product product, List<String> productSubTag) {

		int result1 = productDao.enrollForm(sqlSession, product);
		// 상품 정보를 PRODUCT 테이블에 insert
		int result2 = 0;
		int result3 = 1;
		if(result1 > 0) {
			for(int i = 0; i < productSubTag.size(); i++ ) {
				product.setProductSubTag(productSubTag.get(i));
				result3 *= productDao.enrollFormTag(sqlSession, product);
				// PRODUCT_TAG 테이블에 상품번호별 태그를 insert
				// 상품에 달린 태그 갯수만큼 반복
			}
		
			 result2 = productDao.enrollFormSize(sqlSession, product);
			 // PRODUCT 테이블에 데이터삽입 성공 시
			 // PRODUCT_SIZE 테이블에 상품번호에 해당하는 사이즈별 재고수량 insert
			 }
		return result1 * result2 * result3;
	}

	@Override
	public int searchCount(String keyword) {

		return productDao.searchCount(sqlSession,keyword);
	}

	@Override
	public ArrayList<Member> search(String keyword, PageInfo pi) {

		return productDao.search(sqlSession, keyword, pi);
	}

	@Override
	public int filterCount(String cate) {

		return productDao.filterCount(sqlSession, cate);
	}

	@Override
	public ArrayList<Member> filter(String cate, PageInfo pi) {

		return productDao.filter(sqlSession, cate, pi);
	}


	@Override
	public Product detail(Product p) {

		return productDao.detail(sqlSession, p);
	}

	@Override
	public Product detailSize(Product p) {

		return productDao.datailSize(sqlSession, p);
	}

	@Override
	@Transactional
	public int updateInsert(Product p) {

		return productDao.updateInsert(sqlSession, p);
		
	}

	@Override
	public int updateThumbnail(Product p) {

		return productDao.updateThumbnailProduct(sqlSession, p);
		
	}
	
	@Override
	public int updateThumbnailNoSub(Product p) {

		return productDao.updateThumbnailNoSub(sqlSession, p);
		
	}
	
	@Override
	public int updateSubTumbnail(Product p) {

		return productDao.updateSubThumbnail(sqlSession, p);
	}


	@Override
	public int updateProduct(Product p) {

		return productDao.updateProduct(sqlSession, p);
		
	}
	
	@Override
	public int updateSize(Product p) {
		
		return productDao.updateSize(sqlSession, p);
	}
	
	@Override
	public int updateSubTag(Product p,  List<String> productSubTag) {
		
		return productDao.updateSubTag(sqlSession, p, productSubTag);
	}

	@Override
	public int productStock(Product p) {

		return productDao.productStock(sqlSession, p);
	}

	@Override
	public List<String> detailSubTag(Product p) {
		
		return productDao.detailSubTag(sqlSession, p);
	}

	@Override
	public int chartData() {

		return productDao.chartData(sqlSession);
	}

	@Override
	public int cashData() {

		return productDao.cashData(sqlSession);
	}

	@Override
	public int orderData() {

		return productDao.orderData(sqlSession);
	}





	
}
