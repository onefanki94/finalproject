package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.StoreDAO;
import com.ict.finalproject.vo.StoreVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StoreServiceImpl implements StoreService {

    @Autowired
    StoreDAO dao;

    @Override
    public List<StoreVO> getStoreList(){
        System.out.println(dao);
        return  dao.getStoreList();
    }

}
