package com.ict.finalproject.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewCompletedDTO {
    private int idx;
    private int useridx;
    private int orderList_idx;
    private String content;
    private int grade;
    private String imgfile1;
    private String imgfile2;
    private String regDT;
    private int modifyState;
    private String modifyDT;
    private int delState;
    private String delDT;
    private String pro_title;
    private int pro_idx;
    private String pro_thumImg;
    private int pro_price;
    private int order_amount;
    private String formatted_regDT;
}
