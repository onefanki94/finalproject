package com.ict.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MasterVO {

    // 공통으로 들어갈는 것들
    private Integer idx;
    private Integer adminidx;
    private String adminid;
    private String title;
    private String regDT;
    private String content;
    private int useridx;
    private String author;
    private String userid;
    private String token;

    // 상품 테이블에서 사용 하는 것들
    private int price;
    private String detail_img;
    private String ani_title;
    private String relDT;
    private String brand;
    private String pro_detail;
    private int stock;
    private int fee;
    private String category;
    private String type;
    private int code;

    // 커뮤니티 테이블에서 사용 하는 것들
    private String commtype;
    private int hit;

    // 관리자 페이지에서 애니 테이블 관리
    private String post_img;
    private int anitype;
    private String director;
    private int agetype;
    private String outline;
    private String anitype_type;
    private String age_type;

    // 관리자페이지에서 공지사항 사용하는것들
}
