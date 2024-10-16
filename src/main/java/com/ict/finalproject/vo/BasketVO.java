package com.ict.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BasketVO {
    private int idx;
    private int pro_idx;
    private int useridx;
    private int amount;
    private int total;
}
