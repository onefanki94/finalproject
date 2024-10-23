package com.ict.finalproject.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderListDTO {
    private int order_idx;//ㅇㅇ
    private String order_date;//ㅇㅇ
    private String trackingNum;//ㅇㅇ
    private int total_price;//배송비+적립금 할인액까지 합친 금액
    private int use_point;//ㅇㅇ
    private String recipient;//ㅇㅇ
    private String zipcode;//ㅇㅇ
    private String addr;//ㅇㅇ
    private String addrdetail;//ㅇㅇ
    private String tel;//ㅇㅇ
    private String request_memo;//ㅇㅇ
    private String payDT;//ㅇㅇ
    private String paytype;//ㅇㅇ
    private int amount;//ㅇㅇ 실제 결재 금액
    private String orderId;//ㅇㅇ
    private String customerName;
    private List<OrderProDTO> products = new ArrayList<>();
}
