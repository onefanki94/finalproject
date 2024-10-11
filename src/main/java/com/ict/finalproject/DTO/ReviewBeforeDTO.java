package com.ict.finalproject.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewBeforeDTO {
    private int orderList_idx;
    private String thumImg;
    private String title;
    private int price;
    private int amount;
    private int orderState;
}
