package com.kh.soyo.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.vo.Product;

public interface ProductService {

	int productListCount();

	ArrayList<Member> productList(PageInfo pi);

	int enrollForm(Product product, List<String> productSubTag);

	int searchCount(String keyword);

	ArrayList<Member> search(String keyword, PageInfo pi);

	int filterCount(String cate);

	ArrayList<Member> filter(String cate, PageInfo pi);

	Product detail(Product p);

	Product detailSize(Product p);

	int updateInsert(Product p);

	int updateProduct(Product p);

	int updateThumbnail(Product p);

	int productStock(Product p);

	List<String> detailSubTag(Product p);

	int updateThumbnailNoSub(Product p);

	int updateSubTumbnail(Product p);

	int updateSize(Product p);

	int updateSubTag(Product p, List<String> productSubTag);

	int chartData();



}
