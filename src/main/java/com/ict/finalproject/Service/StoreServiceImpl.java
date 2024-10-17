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
    public List<StoreVO> getRecentProducts() {
        return dao.getRecentProducts();
    }

    @Override
    public List<StoreVO> getStoreList() {
        return dao.getStoreList();
    }

    @Override
    public List<StoreVO> getPagedProducts(int pageSize, int offset, Integer category,  Integer second_category) {
        return dao.getPagedProducts(pageSize, offset, category, second_category);
    }

    @Override
    public int getTotalProductCount() {
        return dao.getTotalProductCount();
    }

    @Override
    public List<StoreVO> getStoreListByFilter(String filterType) {
        // 필터 타입에 따른 상품 목록을 가져오는 로직 구현
        return dao.getStoreListByFilter(filterType);
    }

    @Override
    public List<StoreVO> searchStoreList(String keyword) {
        return dao.searchStoreList(keyword);
    }

    @Override
    public StoreVO getStoreDetail(int storeId) {
        return dao.getStoreDetail(storeId);
    }

    @Override
    public List<ProductFilterVO> getFirstCategoryList() {
        return dao.getFirstCategoryList();
    }

    @Override
    public List<String> getSubcategoriesByFirstCategory(int code) {
        return dao.getSubcategoriesByFirstCategory(code);
    }

    @Override
    public List<StoreVO> getProductsByCategory(int pageSize, int offset, int category) {
        return dao.getProductsByCategory(pageSize, offset, category);
    }
}


