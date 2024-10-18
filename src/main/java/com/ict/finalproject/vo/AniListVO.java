package com.ict.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Arrays;
import java.util.List;

@Data
@NoArgsConstructor //매게변수 없는 생성자
@AllArgsConstructor //매게변수 전체 다 있는거
public class AniListVO {

    public String post_img;   // 이미지 URL
    public String title;     // 제목
    public String anitype;   // 장르
    public String director;   // 감독
    public String agetype;    // 나이 관람
    private int idx;
    public String regDT; // 날짜


    /*@@@@@@@@@@@@별점@@@@@@@@@@@@@@@@*/
    public Integer ani_idx;  // 애니메이션 인덱스
    public Integer grade;     // 별점
    public Integer useridx;   // 사용자 ID
    /*@@@@@@@@@줄거라@@@@@@@@@@*/
    public String outline;
    public String token;
    public String userid;

}
