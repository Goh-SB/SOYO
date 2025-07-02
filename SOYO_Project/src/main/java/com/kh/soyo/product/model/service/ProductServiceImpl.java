package com.kh.soyo.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.product.model.dao.ProductDao;
import com.kh.soyo.product.model.vo.Product;


@Repository
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
    public List<Product> selectProductByNo(int productNo) {
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
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("type", type);
        paramMap.put("keyword", keyword);
        
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
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
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("type", type);
		paramMap.put("keyword", keyword);
		return productDao.searchProductListCount(paramMap);
	}
	
	@Override
	public int searchProductListCount(String category, String tag, String keyword) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("category", category);
		paramMap.put("tag", tag);
		paramMap.put("keyword", keyword);
		return productDao.searchProductListCount(paramMap);
	}
	
	@Override
	public List<Product> searchProductList(String category, String tag, String keyword, PageInfo pi) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("category", category);
		paramMap.put("tag", tag);
		paramMap.put("keyword", keyword);
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return productDao.searchProductList(paramMap, rowBounds);
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
    public List<Product> selectSortedProductList(String category, String tagFilter, String sort, PageInfo pi) {
        Map<String, Object> param = new HashMap<>();
        param.put("category", category);
        param.put("tagFilter", tagFilter);
        param.put("sort", sort);
        
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        
        return productDao.selectSortedProductList(sqlSession, param, rowBounds);
    }
    
    
    @Override
    public boolean isInCart(String memberId, int productNo) {
        return productDao.selectInCartCount(memberId, productNo) > 0;
    }

	@Override
	public int getProductStock(int productNo, String productSize) {
		return productDao.getProductStock(productNo, productSize);
	}

	@Override
	public List<Product> selectProductListByTag(String string, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return productDao.selectProductListByTag(string, rowBounds);
	}

	@Override
	public int selectProductListCountByTag(String string) {
		return productDao.selectProductListCountByTag(string);
	}
	
	@Override
	public int selectProductListCountForSort(String category, String tagFilter) {
		Map<String, Object> param = new HashMap<>();
		param.put("category", category);
		param.put("tagFilter", tagFilter);
		return productDao.selectProductListCountForSort(param);
	}

	@Override
	public int cancelStatus(String impUid, String reason) {
		
		HashMap<String,Object> hm = new HashMap<>();
		hm.put("impUid", impUid);
		hm.put("reason", reason);
		return sqlSession.update("productMapper.cancelStatus",hm);
	}

	@Override
	public int cancelDate(String impUid, String reason) {
		
		HashMap<String,Object> hm = new HashMap<>();
		hm.put("impUid", impUid);
		hm.put("reason", reason);
		return sqlSession.update("productMapper.cancelDate",hm);
	}
    
    
    
}