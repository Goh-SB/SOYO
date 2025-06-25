package com.kh.soyo.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.soyo.product.model.vo.Product;
import java.util.List;
import java.util.Map;

@Repository
public class ProductDao {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public ArrayList<Product> selectProductList(RowBounds rowBounds) {
        return (ArrayList)sqlSession.selectList("productMapper.selectProductList", null, rowBounds);
    }

    public List<Product> selectProductByNo(int productNo) {
        return sqlSession.selectList("productMapper.selectProductByNo", productNo);
    }

	public List<String> selectTagsByProductNo(int productNo) {
	    return sqlSession.selectList("productMapper.selectTagsByProductNo", productNo);
	}

	public List<Product> selectProductListByCategory(String category, RowBounds rowBounds) {
		return sqlSession.selectList("productMapper.selectProductListByCategory", category, rowBounds);
	}

    public List<Product> searchProductList(Map<String, String> paramMap, RowBounds rowBounds) {
        return sqlSession.selectList("productMapper.searchProductList", paramMap, rowBounds);
    }

	public int selectProductListCount() {
		return sqlSession.selectOne("productMapper.selectProductListCount");
	}

	public int selectProductListCountByCategory(String category) {
		return sqlSession.selectOne("productMapper.selectProductListCountByCategory", category);
	}

	public int searchProductListCount(Map<String, String> paramMap) {
		return sqlSession.selectOne("productMapper.searchProductListCount", paramMap);
	}
	
    public List<Product> selectSortedProductList(SqlSessionTemplate sqlSession, Map<String, String> param) {
        return sqlSession.selectList("productMapper.selectSortedProductList", param);
    }

    public List<Product> selectSortedProductList(SqlSessionTemplate sqlSession, Map<String, Object> param, RowBounds rowBounds) {
        return sqlSession.selectList("productMapper.selectSortedProductList", param, rowBounds);
    }

	public int selectInCartCount(String memberId, int productNo) {
        Map<String, Object> param = new HashMap<>();
        param.put("memberId", memberId);
        param.put("productNo", productNo);

        return sqlSession.selectOne("productMapper.selectInCartCount", param);
	}

	public int getProductStock(int productNo, String productSize) {

	    Map<String, Object> param = new HashMap<>();
	    param.put("productNo", productNo);
	    param.put("productSize", productSize);
	    
	    return sqlSession.selectOne("productMapper.selectProductStock", param);
	}


}