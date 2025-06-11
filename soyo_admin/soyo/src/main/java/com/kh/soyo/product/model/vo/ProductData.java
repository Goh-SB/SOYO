package com.kh.soyo.product.model.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Alias("productData")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ProductData {

	private String subject;
	private String content;
	private List<String> imgList;
	
}
