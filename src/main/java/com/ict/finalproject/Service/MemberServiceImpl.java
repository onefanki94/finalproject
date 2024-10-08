package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.MemberDAO;
import com.ict.finalproject.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class MemberServiceImpl implements MemberService {
    @Inject
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
}
