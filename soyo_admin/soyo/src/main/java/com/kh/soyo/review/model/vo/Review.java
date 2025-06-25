package com.kh.soyo.review.model.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
@Alias("review")
public class Review {

	private int reviewNo; // REVIEW_NO	NUMBER
	private String reviewTitle; //REVIEW_TITLE	VARCHAR2(200 BYTE)
	private String reviewContent; // REVIEW_CONTENT	VARCHAR2(4000 BYTE)
	private int rating; // RATING	NUMBER
	private String reviewThumbnailOrigin; //REVIEW_THUMBNAIL_ORIGIN	VARCHAR2(200 BYTE)
	private String reviewThumbnailChange; // REVIEW_THUMBNAIL_CHANGE	VARCHAR2(200 BYTE)
	private Date reviewDate; // REVIEW_DATE	DATE
	private String status; // STATUS	CHAR(1 BYTE)
	private int productNo; // PRODUCT_NO	NUMBER
	private int memberNo; // MEMBER_ID	VARCHAR2(20 BYTE)
	
	private String memberId;
	private String memberName;
	private String productName;
	private String productChange;
	
}
