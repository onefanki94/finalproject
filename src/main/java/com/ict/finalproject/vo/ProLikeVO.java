package com.ict.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProLikeVO {
    private int pro_idx;   // 좋아요를 누른 상품 ID
    private int useridx;   // 좋아요를 누른 사용자 ID
    private boolean liked;
}


