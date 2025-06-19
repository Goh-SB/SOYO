package com.kh.soyo.product.model.service;

import java.util.ArrayList;

import com.kh.soyo.product.model.vo.Product;
import java.util.List;


public interface ProductService {

	ArrayList<Product> selectProductList();

	Product selectProductByNo(int productNo);

	List<String> getTagsForProduct(int productNo);
	
}