package com.kh.soyo.product.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.soyo.product.model.dao.ProductDao;
import com.kh.soyo.product.model.vo.Product;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductDao productDao;

    @Override
    public ArrayList<Product> selectProductList() {
        return productDao.selectProductList();
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
	public List<Product> selectProductListByCategory(String category) {
		return productDao.selectProductListByCategory(category);
	}
	
    @Override
    public List<Product> searchProductList(String type, String keyword) {
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("type", type);
        paramMap.put("keyword", keyword);

        return productDao.searchProductList(paramMap);
    }

}