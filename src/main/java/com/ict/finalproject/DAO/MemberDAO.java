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

        // userid로 index구하기
        public int getUseridx(String userid);


}
