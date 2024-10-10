package com.ict.finalproject.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentApprovalDTO {
    private String paymentKey;    // 결제 키
    private String orderId;       // 주문 번호
    private int amount;          // 결제 금액
}
