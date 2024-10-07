package com.ict.finalproject.DAO;


import com.ict.finalproject.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
public interface MemberDAO {
        // 회원가입
        public int memberCreate(MemberVO vo);

        // 로그인
        public MemberVO memberLogin(String userid, String userpwd);

        public MemberVO findByUserid(String userid);

        MemberVO adminLogin(@Param("userid") String userid);
}
