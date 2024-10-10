package com.ict.finalproject.Service;

import com.ict.finalproject.DTO.ReviewBeforeDTO;
import com.ict.finalproject.vo.MemberVO;

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
}
