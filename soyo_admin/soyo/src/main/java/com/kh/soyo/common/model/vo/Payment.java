package com.kh.soyo.common.model.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("payment")
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
}
