package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.StoreDAO;
import com.ict.finalproject.vo.StoreVO;
import org.springframework.stereotype.Service;


import java.util.List;

import javax.inject.Inject;


@Service
public class StoreServiceImpl implements StoreService {
    
    @Inject
    StoreDAO dao;

    // @Override
    // public StoreVO storeContent(StoreVO vo) {
    //     return dao.storeContent(vo);
    // }

    @Override
    public List<StoreVO> getStoreList(){
        System.out.println(dao);
        return  dao.getStoreList();
    }
}
