package com.ict.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderListVO {
    private int idx;
    private int order_idx;
    private int pro_idx;
    private int amount;
    private int orderState;
    private String title;
    private String ani_title;
    private String thumImg;
    private int price;

    // 매개변수가 있는 생성자
    public OrderListVO(int order_idx, int pro_idx, int amount) {
        this.order_idx = order_idx;
        this.pro_idx= pro_idx;
        this.amount=amount;
    }
}
