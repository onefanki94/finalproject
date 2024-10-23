package com.ict.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor //매게변수 없는 생성자
@AllArgsConstructor //매게변수 전체 다 있는거
public class CommuVO {
    private int idx;
    private int useridx;
    private String userid; // 사용자 ID 추가
    private String title;
    private String content;
    private String regDT;
    private String commtype;
    private int modifyState;
    private Date modifyDT;
    private int delState;
    private Date delDT;
    private int hit;

    private int comm_idx;
//얘도 같은건듯? nowSearchKey 라는 프로퍼티 없음

    private String commDT;


    private String token; // 토큰 필드 추가 (필요에 따라 사용)
}
