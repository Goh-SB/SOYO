package com.kh.soyo.product.model.service;

import java.util.ArrayList;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.member.model.vo.Member;

public interface ProductService {

	int productListCount();

	ArrayList<Member> productList(PageInfo pi);

}
