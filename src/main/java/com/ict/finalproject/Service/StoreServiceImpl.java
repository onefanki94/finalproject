package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.StoreDAO;
import com.ict.finalproject.vo.ProductFilterVO;
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
        return  dao.getStoreList();
    }
    public List<StoreVO> getStoreListByFilter(String filterType){
        return dao.getStoreListByFilter(filterType);
    }

    public List<StoreVO> searchStoreList(String keyword){
        return dao.searchStoreList(keyword);
    }

    public List<ProductFilterVO> getStoreListByFilterCriteria(ProductFilterVO filterCriteria) {
        return dao.getStoreListByFilterCriteria(filterCriteria);
    }

}
