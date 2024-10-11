package com.ict.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentVO {
    private int payment_id;
    private String paytype;
    private int amount;
    private String ordername;
    private String orderId;
    private int successYN;
    private String customerName;
    private String paymentKey;
    private String createDT;
    private String cancelDT;
    private String cancelReason;
    private String failReason;
    private int order_idx;
}
