package com.ict.finalproject.Service;

import com.ict.finalproject.DTO.ReviewBeforeDTO;
import com.ict.finalproject.DTO.ReviewCompletedDTO;
import com.ict.finalproject.vo.MemberVO;
import com.ict.finalproject.vo.ReviewVO;

import java.util.List;

public interface MemberService {

    public int memberCreate(MemberVO vo);
    public MemberVO memberLogin(String userid, String userpwd);
    Integer getUseridx(String userid);
    public List<MemberVO> getMemberList(MemberVO vo);
    int getTotalUser();
    int getNewUsers();
    int getNewSignups();

    //리뷰작성전 리스트 SELECT
    List<ReviewBeforeDTO> getReviewBefore(int useridx);
    //리뷰 등록
    int saveReview(ReviewVO review);
    //리뷰 작성완료 리스트
    List<ReviewCompletedDTO> getReviewCompleted(int useridx);
    //리뷰 원글 저장
    ReviewVO getReviewEditbefore(int orderList_Idx);
    //리뷰 수정
    int updateReview(ReviewVO reviewEditbefore);
    //리뷰 삭제
    void reviewDelete(int orderList_idx);
}
