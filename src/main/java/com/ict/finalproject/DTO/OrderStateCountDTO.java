package com.ict.finalproject.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderStateCountDTO {
    private int newOrders; //결제완료
    private int preparingOrders;//상품준비중
    private int inTransitOrders;//배송중
    private int deliveredOrders;//배송완료
    private int confirmedOrders;//구매확정
    private int exchangeRefundOrders;//교환/환불
}
