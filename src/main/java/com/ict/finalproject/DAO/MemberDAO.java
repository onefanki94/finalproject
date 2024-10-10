package com.ict.finalproject.DAO;


import com.ict.finalproject.DTO.ReviewBeforeDTO;
import com.ict.finalproject.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MemberDAO {
        // 회원가입
        public int memberCreate(MemberVO vo);

        // 로그인
        public MemberVO memberLogin(String userid, String userpwd);

        // idx로 해당 아이디 구하기
        Integer getUseridx(String userid);

        // 관리자페이지에서 모든 회원 전체 출력
        public List<MemberVO> getMemberList(MemberVO vo);

        // 총 유저수 구하기
        int getTotalUser();

        // 오늘 가입자 수 구하기
        int getNewUsers();

        // 최근 7일간 가입자 수 구하기
        int getNewSignups();

        //리뷰작성전 리스트 SELECT
        List<ReviewBeforeDTO> getReviewBefore(int useridx);
}
