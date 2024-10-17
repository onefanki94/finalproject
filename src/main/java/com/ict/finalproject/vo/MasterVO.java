package com.ict.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

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
    private String modifyDT;
    private String delDT;
    private String inDate;
    private String delReasonDetail;
    private String adminpwd;

    // 상품 테이블에서 사용 하는 것들
    private int price;
    private String thumimg;
    private String ani_title;
    private String relDT;
    private String brand;
    private String pro_detail;
    private int stock;
    private int fee;
    private String category;
    private String type;
    private int code;
    private String second_category;

    // 커뮤니티 테이블에서 사용 하는 것들
    private String commtype;
    private int hit;

    // 관리자 페이지에서 애니 테이블 관리
    private MultipartFile post_img;
    private int anitype;
    private String director;
    private int agetype;
    private String outline;
    private String anitype_type;
    private String age_type;
    private String post_img_filename;
    private int modifyState;
    private int pro_idx;
    private String detailImg;

    // 관리자페이지에서 공지사항 사용하는것들
    private String admin_name;

    // 관리자페이지에서 자주묻는 질문 사용하는 것들
    private String question;
    private String answer;
    private String faqtype;

    // 관리자페이지에서 신고 기능 사용하는 것들
    private String reason;
    private String stopDT;
    private String endDT;

    // 관리자 페이지에서 모든 리뷰
    private int comm_idx;
    private int parentidx;

    // 관리자페이지에서 사용하는 신고 기능 사용하는것들
    private int commment_idx;
    private int review_idx;
    private int report_type;
    private String reportDT;
    private String handleState;
    private String handleDT;
    private int comunity_idx;
    private int totalUserReport;

    // 관리자페이지에서 사용하는 리뷰 기능 사용하는 것들
    private int grade;
    private int orderList_idx;
    private String imgfile1;
    private String imgfile2;
    
    // 관리자 페이지에서 문의 기능 사용하는 것들
    private String qnatype;
    private int qna_idx;
    private String reply;
}
