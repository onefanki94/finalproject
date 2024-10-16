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
    private Integer modifyState; //안되기만해봐라 뒤졌따 ㅋㅋㅋㅋㅋ ㅡ근데 왜 얘만 안되는것같지? 아 int는 뭐가 다른가 몰겠땅,,
    private Date modifyDT;
    private int delState;
    private Date delDT;
    private int adminidx;

}
