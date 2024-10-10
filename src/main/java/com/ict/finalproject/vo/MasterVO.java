package com.ict.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MasterVO {
    private Integer idx;
    private String title;
    private String content;
    private String regDT;
    private int adminidx;
    private String adminid;
}
