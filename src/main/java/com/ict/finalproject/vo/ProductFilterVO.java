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
}
