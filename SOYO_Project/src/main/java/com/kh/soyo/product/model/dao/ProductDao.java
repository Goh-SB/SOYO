package com.kh.soyo.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.soyo.product.model.vo.Product;
import java.util.List;

@Repository
public class ProductDao {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public ArrayList<Product> selectProductList() {
        return (ArrayList)sqlSession.selectList("productMapper.selectProductList");
    }

	public Product selectProductByNo(int productNo) {
		return sqlSession.selectOne("productMapper.selectProductByNo", productNo);
	}

	public List<String> selectTagsByProductNo(int productNo) {
	    return sqlSession.selectList("productMapper.selectTagsByProductNo", productNo);
	}

	public List<Product> selectProductListByCategory(String category) {
		return sqlSession.selectList("productMapper.selectProductListByCategory", category);
	}

}