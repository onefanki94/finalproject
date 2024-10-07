package com.ict.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreVO {
    private String title;
    private int price;
    private String detail_img;
    private String ani_title;
    private String relDT;
    private String brand;
    private String fee;
    private int stock;
    private String pro_detail;
    private int category;

}
