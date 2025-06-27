package com.kh.soyo.recent.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Recent {

	private Date viewDate;
	private String memberId;
	private int productNo;
	
	private String productName;
	private int productPrice;
	private String productOrigin;
	private String productChange;
}
