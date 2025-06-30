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
    
    // JOIN 전용
    private String memberName;
    private String productOrigin;      			// 상품) 원본 이미지명
    private String productChange;      			// 상품) 저장용 변경 이미지명
    private String productName;					// 상품) 제품 이름
    
    // 좋아요 관련 필드
    private boolean liked;                      // 현재 사용자가 좋아요를 눌렀는지 여부
    private int likeCount;                      // 좋아요 개수
}
