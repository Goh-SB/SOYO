package com.kh.soyo.cart.model.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("delivery")
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Delivery {
    private String memberId;
    private String receiverName;
    private String receiverPhone;
    private String addressName;
    private String addressOther;
    private String requestMsg;
    private int totalPrice;
    private String orderImpNo;

    private List<Integer> selectedProductList; 
    private List<Integer> selectedProductCountList;
}