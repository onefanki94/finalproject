package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.MemberDAO;
import com.ict.finalproject.DTO.ReviewBeforeDTO;
import com.ict.finalproject.DTO.ReviewCompletedDTO;
import com.ict.finalproject.vo.MemberVO;
import com.ict.finalproject.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    MemberDAO dao;

    @Override
    public int memberCreate(MemberVO vo) {
        return dao.memberCreate(vo);
    }

    @Override
    public MemberVO memberLogin(String userid, String userpwd) {
        return dao.memberLogin(userid, userpwd);
    }

    @Override
    public Integer getUseridx(String userid) {
        return dao.getUseridx(userid);
    }

    @Override
    public List<MemberVO> getMemberList(MemberVO vo) {
        return dao.getMemberList(vo);
    }

    @Override
    public int getTotalUser() {
        return dao.getTotalUser();
    }

    @Override
    public int getNewUsers() {
        return dao.getNewUsers();
    }

    @Override
    public int getNewSignups() {
        return dao.getNewSignups();
    }

    //리뷰작성전 리스트 SELECT
    @Override
    public List<ReviewBeforeDTO> getReviewBefore(int useridx) {
        return dao.getReviewBefore(useridx);
    }

    @Override
    public int saveReview(ReviewVO review) {
        return dao.saveReview(review);
    }

    @Override
    public List<ReviewCompletedDTO> getReviewCompleted(int useridx) {
        return dao.getReviewCompleted(useridx);
    }

    @Override
    public ReviewVO getReviewEditbefore(int orderList_Idx) {
        return dao.getReviewEditbefore(orderList_Idx);
    }

    @Override
    public int updateReview(ReviewVO reviewEditbefore) {
        return dao.updateReview(reviewEditbefore);
    }

    @Override
    public void reviewDelete(int orderList_idx) {
        dao.reviewDelete(orderList_idx);
    }

    @Override
    public int getReviewBeforeAmount(int useridx) {
        return dao.getReviewBeforeAmount(useridx);
    }

    @Override
    public int getReviewCompletedAmount(int useridx) {
        return dao.getReviewCompletedAmount(useridx);
    }

    @Override
    public MemberVO getUserinfo(int useridx) {
        return dao.getUserinfo(useridx);
    }

    @Override
    public int updateUser(MemberVO member) {
        return dao.updateUser(member);
    }
}
