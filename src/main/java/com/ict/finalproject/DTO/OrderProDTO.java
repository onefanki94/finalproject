package com.ict.finalproject.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderProDTO {
    private int pro_idx;//ㅇㅇ
    private String pro_image;//ㅇㅇ
    private String pro_title;//ㅇㅇ
    private String pro_anititle;//ㅇㅇ
    private int pro_price;//ㅇㅇ
    private int order_pro_amount;//ㅇㅇ
    private int orderState;//ㅇㅇ
}
