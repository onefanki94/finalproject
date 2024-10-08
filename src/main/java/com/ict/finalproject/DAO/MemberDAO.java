package com.ict.finalproject.DAO;


import com.ict.finalproject.vo.CommuVO;
import com.ict.finalproject.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
public interface MemberDAO {
        // 회원가입
        public int memberCreate(MemberVO vo);

        // 로그인
        public MemberVO memberLogin(String userid, String userpwd);

        // idx로 해당 아이디 구하기
        Integer getUseridx(String userid);
}
