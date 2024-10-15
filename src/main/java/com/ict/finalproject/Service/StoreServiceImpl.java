package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.StoreDAO;
import com.ict.finalproject.vo.ProductFilterVO;
import com.ict.finalproject.vo.StoreVO;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class StoreServiceImpl implements StoreService {

    @Autowired
    StoreDAO dao;

    @Override
    public List<StoreVO> getStoreList(){
        return  dao.getStoreList();
    }
 
    @Override
    public List<StoreVO> searchStoreList(String keyword){
        return dao.searchStoreList(keyword);
    }

    @Override
    public StoreVO getStoreDetail(int storeId){
        return dao.getStoreDetail(storeId);
    }
    
    @Override
    public List<ProductFilterVO> getFirstCategoryList() {
        return dao.getFirstCategoryList();  // DAO에서 카테고리 필터 리스트 가져오기
    }

    // @Override
    // public List<ProductFilterVO> getSubcategoriesByFirstCategory(int category) {
    //     return dao.getSubcategoriesByFirstCategory(category);
    // }
    @Override
    public List<String> getSubcategoriesByFirstCategory1(@Param("category") int category){
        return dao.getSubcategoriesByFirstCategory1(category);
    }
}
