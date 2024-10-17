package com.ict.finalproject.vo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor//매게변수 없는 생성자
@AllArgsConstructor //매게변수 전체 다 있는거
public class NoticeVO {

    private int idx;
    private String title;
    private String content;
    private String regDT;
    private Integer modifyState;
    private Date modifyDT;
    private int delState;
    private Date delDT;
    private int adminidx;


    private String question;  // 자주 묻는 질문 제목
    private String answer;    // 자주 묻는 질문 답변
    private String faqType;   // faqtype의 문자열 형태
    private int faqtype;      // t_faq의 faqtype 컬럼




}
