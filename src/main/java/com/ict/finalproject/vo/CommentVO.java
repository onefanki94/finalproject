package com.ict.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor //매게변수 없는 생성자
@AllArgsConstructor //매게변수 전체 다 있는거
public class CommentVO {
    private int idx;
    private int comm_idx;
    private int user_idx;
    private String content;
    private String regDT;
    private int depth;
    private int parentidx;
    private int modifyState;
    private Date modifyDT;
    private int delState;
    private Date delDT;

    private String token; // 토큰 필드 추가 (필요에 따라 사용)
}
