package com.ict.finalproject.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.Map;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PayCancelDTO {
    private int order_idx;
    private String paymentkey;
    private Map<Integer, Integer> cancelProducts = new HashMap<>(); // pro_idx와 cancelCount 저장
    private int cancelAmount;//취소금액
    private String cancelReason;//취소이유
    private int cancelState;//취소상태 ??필요한가?
    private int refundUsePoint;//반환될 적립금
    private String cancelDT;
}
