package com.ict.finalproject.Service;

import com.ict.finalproject.vo.MemberVO;

public interface MemberService {

    public int memberCreate(MemberVO vo);
    public MemberVO memberLogin(String userid, String userpwd);
    // userid로 index구하기
    public int getUseridx(String userid);

}

