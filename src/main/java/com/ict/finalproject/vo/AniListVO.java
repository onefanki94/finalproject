package com.ict.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //매게변수 없는 생성자
@AllArgsConstructor //매게변수 전체 다 있는거
public class AniListVO {

    public String post_img;   // 이미지 URL
    public String title;     // 제목
    public int anitype;   // 장르
    public String director;   // 감독
    public int agetype;    // 나이 관람
}
