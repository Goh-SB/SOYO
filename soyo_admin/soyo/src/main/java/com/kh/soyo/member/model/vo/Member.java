package com.kh.soyo.member.model.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("member")
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Member {

	private String memberId;
	private String memberPwd;
	private String memberName;
	private String gender;
	private Date birthDate;
	private String email;
	private String phone;
	private String address;
	private Date enrollDate;
	private String status;
	
	private String addressOther;
}
