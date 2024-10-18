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
    private int idx;
    private String post_img;   // 이미지 URL
    private String title;     // 제목
    private int anitype;   // 장르
    private String director;   // 감독
    private int agetype;
    private String regDT// 나이 관람

    /*@@@@@@@@@@@@별점@@@@@@@@@@@@@@@@*/
    private Integer ani_idx;  // 애니메이션 인덱스
    private Integer grade;     // 별점
    private Integer useridx;   // 사용자 ID
    /*@@@@@@@@@줄거라@@@@@@@@@@*/
    private String outline;
    private String token;
    private String userid;
}
