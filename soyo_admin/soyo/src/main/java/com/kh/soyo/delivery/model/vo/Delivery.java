package com.kh.soyo.delivery.model.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("Delivery")
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Delivery {

	private int orderNo;
	private String orderImpNo;
	private int totalPrice;
	private String receiverName;
	private String receiverPhone;
	private String requestMsg;
	private Date deliveryDate;
	private Date cancelDate;
	private Date orderDate;
	private String orderStatus;
	private String memberId;
	
	private String addressName;
	private String addressOther;
	
	private String memberName;
	
	private String productName;
	private int productCount;
	private int productPrice;
	
	private String phone;
	
}
