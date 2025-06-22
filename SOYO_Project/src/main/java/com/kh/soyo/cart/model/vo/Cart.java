package com.kh.soyo.cart.model.vo;

import java.sql.Date;
import org.apache.ibatis.type.Alias;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("cart")
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Cart {
	private int cartNo;				// 장바구니 번호
	private int productNo;			// 상품 번호
	private int productCount;		// 상품 수량
	private String memberId;		// 회원 아이디
	private Date cartEnrollDate;	// 장바구니에 담은 날짜
	
	private String productName;       // 상품명
    private int productPrice;         // 상품 가격
    private String productChange;     // 상품 사진
    private String productSize; 	  // 선택한 사이즈

}