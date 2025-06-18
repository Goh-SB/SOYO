package com.kh.soyo.product.model.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Alias("product")
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Product {

	
	private int productNo; //	PRODUCT_NO
	private String productName;//	PRODUCT_NAME
	private int productPrice;  //	PRODUCT_PRICE
	private String productCategory;  //	PRODUCT_CATEGORY
	private String productCaption;  //	PRODUCT_CATION
	private String productSubCaption;//	PRODUCT_SUB_CAPTION
	private String productOrigin;//	PRODUCT_ORIGIN
	private String productChange;//	PRODUCT_CHANGE
	private int productStock; //	PRODUCT_COUNT
	private Date productRegisteredDate;//	PRODUCT_REGISTERED_DATE
	private String status;//	STATUS
	private String productSubOrigin;
	private String productSubChange;
	
	private String productSize; //	PRODUCT_SIZE_NO
}
