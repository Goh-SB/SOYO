package com.kh.soyo.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.vo.Product;

public interface ProductService {

	int productListCount();

	ArrayList<Member> productList(PageInfo pi);

	int enrollForm(Product product);

	int searchCount(String keyword);

	ArrayList<Member> search(String keyword, PageInfo pi);

	int filterCount(String cate);

	ArrayList<Member> filter(String cate, PageInfo pi);

	Product detail(Product p);


}
