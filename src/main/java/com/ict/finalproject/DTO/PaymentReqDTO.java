package com.ict.finalproject.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentReqDTO {
    private String orderId;
    private int amount;
    private String customerName;
    private int order_idx;
    private String recipient;
    private String zipcode;
    private String addr;
    private String addrdetail;
    private String request_memo;
    private int use_point;
    private String tel;
    private int useridx;
}
