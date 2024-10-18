package com.ict.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PointVO {
    private int idx;
    private int useridx;
    private int point;
    private int type;
    private String formatted_regDT;
}
