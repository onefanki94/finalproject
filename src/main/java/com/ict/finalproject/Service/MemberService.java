package com.ict.finalproject.Service;

import com.ict.finalproject.DTO.ReviewBeforeDTO;
import com.ict.finalproject.DTO.ReviewCompletedDTO;
import com.ict.finalproject.DTO.UserDelReasonDTO;
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
    //작성 할 수 있는 리뷰갯수
    int getReviewBeforeAmount(int useridx);
    //작성완료한 리뷰갯수
    int getReviewCompletedAmount(int useridx);
    //회원 수정을 위해 정보 select
    MemberVO getUserinfo(int useridx);
    //회원 수정
    int updateUser(MemberVO member);
    //회원 탈퇴
    int userDelOk(int useridx);
    void userDelInsert(UserDelReasonDTO userDelReasonDTO);
}
