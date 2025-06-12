package com.kh.soyo.product.model.service;

import java.util.ArrayList;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.vo.Product;

public interface ProductService {

	int productListCount();

	ArrayList<Member> productList(PageInfo pi);

	int enrollForm(Product product);

}
