package com.ict.finalproject.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PayCancelDTO {
    private int order_idx;
    private int pro_idx;
    private String paymentkey;
    private int cancelAmount;//취소금액
    private int cancelCount;//취소수량
    private String cancelReason;//취소이유
    private int cancelState;//취소상태 ??필요한가?
}
