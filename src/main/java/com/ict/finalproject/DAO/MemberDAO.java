package com.ict.finalproject.DAO;


import com.ict.finalproject.vo.CommuVO;
import com.ict.finalproject.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
<<<<<<< HEAD
import org.apache.ibatis.annotations.Select;
=======
>>>>>>> ae542fcc19f9739d7f3beded0f26485fad2d85b0
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
public interface MemberDAO {
        // 회원가입
        public int memberCreate(MemberVO vo);

        // 로그인
        public MemberVO memberLogin(String userid, String userpwd);

<<<<<<< HEAD
        // userid로 index구하기
        public int getUseridx(String userid);


=======
        public MemberVO findByUserid(String userid);

        MemberVO adminLogin(@Param("userid") String userid);
>>>>>>> ae542fcc19f9739d7f3beded0f26485fad2d85b0
}
