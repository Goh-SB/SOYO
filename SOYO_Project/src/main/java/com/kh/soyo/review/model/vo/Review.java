package com.kh.soyo.review.model.vo;

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
public class Review {

    private int reviewNo;                       // REVIEW_NO
    private String reviewTitle;                 // REVIEW_TITLE
    private String reviewContent;               // REVIEW_CONTENT
    private int rating;                         // RATING
    private String reviewThumbnailOrigin;       // REVIEW_THUMBNAIL_ORIGIN
    private String reviewThumbnailChange;       // REVIEW_THUMBNAIL_CHANGE
    private Date reviewDate;                    // REVIEW_DATE
    private String status;                      // STATUS ('Y', 'N')
    private int productNo;                      // PRODUCT_NO
    private String memberId;                    // MEMBER_ID (FK)
	
    private String memberName;
    
}
