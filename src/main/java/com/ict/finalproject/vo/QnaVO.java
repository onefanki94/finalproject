package com.ict.finalproject.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor//매게변수 없는 생성자
@AllArgsConstructor//매게변수 전체 다 있는거
public class QnaVO {
    private int idx;
    private int qnatype;
    private String title;
    private String content;
    private int useridx;
    private String regDT;
    private int handleState;
    private int modifyState;
    private Date modifyDT;
    private int delState;
    private Date delDT;

    //
    private int code;
    private String type;

    //
    private String imgfile1;
    private String imgfile2;

    //
    private String reply;
    private String replyDT;
    private String QnADT;


}
