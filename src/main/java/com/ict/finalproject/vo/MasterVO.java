package com.ict.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MasterVO {

    // 공통으로 들어갈는 것들
    private Integer idx;
    private Integer adminidx;
    private String adminid;
    private String title;
    private String regDT;
    private String content;

    // 상품 테이블에서 사용 하는 것들
    private int price;
    private String detail_img;
    private String ani_title;
    private String relDT;
    private String brand;
    private String pro_detail;
    private int stock;
    private int fee;
    private int category;
}
