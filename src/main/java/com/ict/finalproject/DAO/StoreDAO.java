package com.ict.finalproject.DAO;

import com.ict.finalproject.vo.ProductFilterVO;
import com.ict.finalproject.vo.StoreVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Mapper
public interface StoreDAO {
    public List<StoreVO> getStoreList();

    public List<StoreVO> getStoreListByFilter(@Param("filterType")String filterType);

    public List<StoreVO> searchStoreList(@Param("keyword") String keyword);

    public List<ProductFilterVO> getFirstCategoryList();  // 이 부분 추가

    public StoreVO getStoreDetail(int storeId);

    public List<ProductFilterVO> getSubcategoriesByFirstCategory(@Param("category") int category);
    public List<String> getSubcategoriesByFirstCategory1(@Param("category") int category);

    
    
  
}
