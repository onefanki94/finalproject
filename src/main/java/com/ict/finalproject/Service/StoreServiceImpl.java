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
    public List<StoreVO> getRecentProducts(){
        return dao.getRecentProducts();
    }

    @Override
    public List<StoreVO> getStoreList(){
        return  dao.getStoreList();
    }
    // 기존 페이지네이션 삭제
    public List<StoreVO> getPagedProducts(@Param("pageSize") int pageSize, @Param("offset") int offset){
        return dao.getPagedProducts(pageSize, offset);
    } //페이지네이션

    @Override
    public int getTotalProductCount() {
        // 총 상품 개수를 DAO에서 가져옴
        return dao.getTotalProductCount();
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
    public List<String> getSubcategoriesByFirstCategory1(@Param("code") int code){
        return dao.getSubcategoriesByFirstCategory1(code);
    }


}
