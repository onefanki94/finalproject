package com.ict.finalproject.Service;

import com.ict.finalproject.vo.ProductFilterVO;
import com.ict.finalproject.vo.StoreVO;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
public interface StoreService {
    public List<StoreVO> getStoreList();

    public List<StoreVO> searchStoreList(String keyword);

    public StoreVO getStoreDetail(int storeId);

    public List<ProductFilterVO> getFirstCategoryList();
   // public List<ProductFilterVO> getSubcategoriesByFirstCategory(int category);
    public List<String> getSubcategoriesByFirstCategory1(@Param("category") int category);
}
