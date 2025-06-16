package com.kh.soyo.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.vo.Product;

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

	public int enrollForm(SqlSessionTemplate sqlSession, Product product) {

		return sqlSession.insert("productMapper.enrollForm", product);
	}

	public int enrollFormSize(SqlSessionTemplate sqlSession, Product product) {

		return sqlSession.insert("productMapper.enrollFormSize", product);
	}

	public int searchCount(SqlSessionTemplate sqlSession, String keyword) {

		return sqlSession.selectOne("productMapper.searchCount", keyword);
	}

	public ArrayList<Member> search(SqlSessionTemplate sqlSession, String keyword, PageInfo pi) {

		
		int startRow = ((pi.getCurrentPage() - 1) * pi.getBoardLimit()) + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("keyword", keyword);
		
		return (ArrayList)sqlSession.selectList("productMapper.search", hm);
	}

	public int filterCount(SqlSessionTemplate sqlSession, String cate) {

		return sqlSession.selectOne("productMapper.filterCount", cate);
	}

	public ArrayList<Member> filter(SqlSessionTemplate sqlSession, String cate, PageInfo pi) {

		int startRow = ((pi.getCurrentPage() - 1) * pi.getBoardLimit()) + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("cate", cate);
		
		return (ArrayList)sqlSession.selectList("productMapper.filter", hm);
	}

	public Product detail(SqlSessionTemplate sqlSession, Product p) {

		return sqlSession.selectOne("productMapper.detail", p);
	}

	public Product datailSize(SqlSessionTemplate sqlSession, Product p) {


		return sqlSession.selectOne("productMapper.detailSize", p);
	}

	public int updateInsert(SqlSessionTemplate sqlSession, Product p) {

		return sqlSession.insert("productMapper.updateInsert", p);
	}

	public int updateThumbnailProduct(SqlSessionTemplate sqlSession, Product p) {
		
		return sqlSession.update("productMapper.updateThumbnailProduct", p);
	}

	public int updateThumbnailSize(SqlSessionTemplate sqlSession, Product p) {

		return sqlSession.update("productMapper.updateThumbnailSize", p);
	}

	public int updateProduct(SqlSessionTemplate sqlSession, Product p) {

		return sqlSession.update("productMapper.updateProduct", p);
	}

	public int updateSize(SqlSessionTemplate sqlSession, Product p) {
		
		return sqlSession.update("productMapper.updateSize", p);
	}

	public int productStock(SqlSessionTemplate sqlSession, Product p) {

		return sqlSession.selectOne("productMapper.productStock", p);
	}




	
}
