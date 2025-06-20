package com.kh.soyo.cart.model.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("delivery")
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Delivery {
    private String memberId;
    private String receiverName;
    private String receiverPhone;
    private String addressName;
    private String addressOther;
    private String requestMsg;
    private int totalPrice;
    private String orderImpno;
}
