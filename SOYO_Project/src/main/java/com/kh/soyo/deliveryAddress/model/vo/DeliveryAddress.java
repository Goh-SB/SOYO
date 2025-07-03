package com.kh.soyo.deliveryAddress.model.vo;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("deliveryAddress")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class DeliveryAddress {

	//	ADDRESS_NO	NUMBER
	//	ADDRESS_NAME	VARCHAR2(30 BYTE)
	//	ADDRESS_OTHER	VARCHAR2(200 BYTE)
	//	IS_DEFAULT	CHAR(1 BYTE)
	//	RECEIVER_NAME	VARCHAR2(10 BYTE)
	//	RECEIVER_PHONE	VARCHAR2(30 BYTE)
	//	MEMBER_ID	VARCHAR2(20 BYTE)
	
	private int addressNo;
	private String addressName;
	private String addressOther;
	private String isDefault;
	private String receiverName;
	private String receiverPhone;
	private String memberId;
}
