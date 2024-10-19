package com.ict.finalproject.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BasketDTO {
    private int idx;
    private int pro_idx;
    private int useridx;
    private int amount;
    private int total;
    private String ani_title;
    private String title;
    private String thumImg;
    private int price;
    private int fee;
}
