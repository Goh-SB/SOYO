package com.kh.soyo.product.model.service;

import java.util.ArrayList;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.product.model.vo.Product;
import java.util.List;


public interface ProductService {

	ArrayList<Product> selectProductList(PageInfo pi);

	List<Product> selectProductByNo(int productNo);

	List<String> getTagsForProduct(int productNo);

	List<Product> selectProductListByCategory(String string, PageInfo pi);
	
	List<Product> searchProductList(String type, String keyword, PageInfo pi);

	int selectProductListCount();

	int selectProductListCountByCategory(String category);

	int searchProductListCount(String type, String keyword);
	
	List<Product> selectSortedProductList(String category, String sort);
	
	List<Product> selectSortedProductList(String category, String sort, PageInfo pi);

	boolean isInCart(String memberId, int productNo);

	int getProductStock(int productNo, String productSize);

	List<Product> selectProductListByTag(String string, PageInfo pi);

	int selectProductListCountByTag(String string);
}