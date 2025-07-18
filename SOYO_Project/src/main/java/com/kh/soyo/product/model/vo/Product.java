package com.kh.soyo.product.model.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("product")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Product {

    private int productNo;             // 상품 번호
    private String productName;        // 상품 이름
    private int productPrice;          // 상품 가격
    private String productCategory;    // 상품 카테고리 (남자/여자/아동/악세사리)
    private String productCaption;     // 상품 태그 설명
    private String productSubCaption;  // 상품 상세 설명 (HTML 문자열)
    private String productOrigin;      // 원본 이미지명
    private String productChange;      // 저장용 변경 이미지명
    private int productCount;          // 재고 수량
    private Date productRegisteredDate;// 등록일
    private String status;             // 상태 (Y/N)
    private int productSizeNo;         // 사이즈 식별번호 (FK)
    
    private String productSort;		   // 상품 분류
    private String productTag; 		   // 상품 해시태그
    
    private String orderImpNo;
    private Date deliveryDate;
    private String orderStatus;
    private Date orderDate;
    
    private String receiverName;
    private String memberName;
    private String receiverPhone;
    private String addressName;
    private String totalPrice;
    
    private String addressOther;
    
    private String productSubOrigin;   // 상품 상세페이지 이미지 원본명
    private String productSubChange;   // 상품 상세페이지 이미지 저장명
    
    private boolean inCart;
    
    private String productSize;
	
}