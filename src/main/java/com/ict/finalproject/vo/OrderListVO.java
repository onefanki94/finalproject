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

}
