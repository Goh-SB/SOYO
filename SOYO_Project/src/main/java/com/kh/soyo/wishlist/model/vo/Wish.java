package com.kh.soyo.wishlist.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Wish {
    private String memberId;
    private int productNo;
    private String productSize;
}
