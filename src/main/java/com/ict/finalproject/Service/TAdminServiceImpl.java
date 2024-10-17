package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.TAdminDAO;
import com.ict.finalproject.vo.MasterVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TAdminServiceImpl implements TAdminService {

    @Autowired
    private final TAdminDAO dao;

    // 생성자 주입 방식으로 DAO 주입
    public TAdminServiceImpl(TAdminDAO tAdminDAO) {
        this.dao = tAdminDAO;
    }

    @Override
    public boolean existsByAdminId(String adminid) {
        return dao.existsByAdminId(adminid);
    }

    @Override
    public Integer getAdminIdxByAdminId(String adminid) {
        return dao.findIdxByAdminId(adminid);
    }

}