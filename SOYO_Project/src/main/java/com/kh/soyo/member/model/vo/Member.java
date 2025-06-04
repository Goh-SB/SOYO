package com.kh.soyo.member.model.vo;

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
public class Member {

	// 필드부 - 컬럼 정보와 유사하게 구성
	private String memberId; 	//	MEMBER_ID	VARCHAR2(20 BYTE)
	private String memberPwd; 	//	MEMBER_PWD	VARCHAR2(20 BYTE)
	private String memberName; 	//	MEMBER_NAME	VARCHAR2(18 BYTE)
	private String gender;		//	GENDER	VARCHAR2(1 BYTE)
	private Date birthDate;	//	BIRTH_DATE	DATE
	private String email;		//	EMAIL	VARCHAR2(30 BYTE)
	private String phone;	    //	PHONE	VARCHAR2(11 BYTE)
	private String address;		//	ADDRESS	VARCHAR2(150 BYTE)
	private Date enrollDate;    //	ENROLL_DATE	DATE
	private String status;		//	STATUS	CHAR(1 BYTE)

}