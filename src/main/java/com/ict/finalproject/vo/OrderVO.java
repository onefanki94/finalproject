package com.ict.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderVO {
    private int idx;
    private int useridx;
    private int total_price;
    private String regDT;
    private int cancelState;
    private String cancelDT;
    private int paycode;
    private int payState;
    private String recipient;
    private String zipcode;
    private String addr;
    private String tel;
    private String request_memo;
    private int use_point;
    private String token;
}
