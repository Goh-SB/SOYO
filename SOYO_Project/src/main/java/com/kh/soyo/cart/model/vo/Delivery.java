package com.kh.soyo.cart.model.vo;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("delivery")
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Delivery {
	private Date deliveryDate;
    private String memberId;
    private String receiverName;
    private String receiverPhone;
    private String addressName;
    private String addressOther;
    private String requestMsg;
    private int totalPrice;
    private String orderImpNo;
    private String addressAlias;
    private String cancelStatus;
    private String memberName;
    private int productNo;
    private String productSize;
    private int cartNo;
    private int productCount;
    private String orderStatus;
    private Date orderDate;
    private List<Integer> selectedProductList; 
    private List<Integer> selectedProductCountList;
    private List<String> selectedProductSizeList;
}