package com.kh.soyo.product.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.product.model.dao.ProductDao;
import com.kh.soyo.product.model.vo.Product;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductDao productDao;

    @Autowired
    private SqlSessionTemplate sqlSession;
    
    @Override
    public ArrayList<Product> selectProductList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return productDao.selectProductList(rowBounds);
    }

	@Override
	public Product selectProductByNo(int productNo) {
		return productDao.selectProductByNo(productNo);
	}

	@Override
	public List<String> getTagsForProduct(int productNo) {
		return productDao.selectTagsByProductNo(productNo);
	}

	@Override
	public List<Product> selectProductListByCategory(String category, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return productDao.selectProductListByCategory(category, rowBounds);
	}
	
    @Override
    public List<Product> searchProductList(String type, String keyword, PageInfo pi) {
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("type", type);
        paramMap.put("keyword", keyword);
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return productDao.searchProductList(paramMap, rowBounds);
    }

	@Override
	public int selectProductListCount() {
		return productDao.selectProductListCount();
	}

	@Override
	public int selectProductListCountByCategory(String category) {
		return productDao.selectProductListCountByCategory(category);
	}

	@Override
	public int searchProductListCount(String type, String keyword) {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("type", type);
		paramMap.put("keyword", keyword);
		return productDao.searchProductListCount(paramMap);
	}
	
    @Override
    public List<Product> selectSortedProductList(String category, String sort) {
        Map<String, String> param = new HashMap<>();
        param.put("category", category);
        param.put("sort", sort);
        return productDao.selectSortedProductList(sqlSession, param);
    }

    @Override
    public List<Product> selectSortedProductList(String category, String sort, PageInfo pi) {
        Map<String, Object> param = new HashMap<>();
        param.put("category", category);
        param.put("sort", sort);
        
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        
        return productDao.selectSortedProductList(sqlSession, param, rowBounds);
    }
    
    
    @Override
    public boolean isInCart(String memberId, int productNo) {
        return productDao.selectInCartCount(memberId, productNo) > 0;
    }
    
    
}