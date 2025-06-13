package com.kh.soyo.common.model.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("Payment")
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Payment {

	private String memberId;
	private String orderImpNo;
	private int productNo;
	private String cancelStatus;
	private String cancelReason;
	
	private Date orderDate;
	private String memberName;
	private String productName;
	private int productPrice;
	
}
