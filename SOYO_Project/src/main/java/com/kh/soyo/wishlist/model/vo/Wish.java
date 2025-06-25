package com.kh.soyo.wishlist.model.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("wish")
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Wish {
    private String memberId;
    private int productNo;
    
    // join 용
    private String productName;
    private int productPrice;
    private String productCategory;
    private String productOrigin;
    private String productChange;
    private String productSize;
    private String stockCount;
}
