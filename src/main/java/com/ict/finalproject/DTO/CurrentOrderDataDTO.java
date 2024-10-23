package com.ict.finalproject.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CurrentOrderDataDTO {
    private int order_idx;
    private String order_date;
    private int pro_idx;
    private String pro_image;
    private int amount;
    private String orderName;
    private String orderId;
    private String customerName;
}
