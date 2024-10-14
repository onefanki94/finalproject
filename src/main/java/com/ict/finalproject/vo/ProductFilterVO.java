package com.ict.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductFilterVO {
    private int idx;
    private String title;
    private List<String> ani_title;  // 작품명 목록
    private int stock;
    private String thumImg;
    private int price;
    private List<String> type;  // 카테고리 필터를 위한 type 목록 추가
    private int first_code;   // 첫번째 카테고리 
    private int code;
}
