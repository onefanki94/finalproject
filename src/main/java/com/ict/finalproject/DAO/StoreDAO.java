package com.ict.finalproject.DAO;

import com.ict.finalproject.vo.ProductFilterVO;
import com.ict.finalproject.vo.StoreVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Mapper
public interface StoreDAO {

    public List<StoreVO> getRecentProducts();

    public List<StoreVO> getStoreList();

    //public List<StoreVO> getPagedProducts(int pageNum, int pageSize);//페이지네이션

    public int getTotalProductCount();

    public List<StoreVO> getPagedProducts(@Param("pageSize") int pageSize, @Param("offset") int offset); //페이지네이션

    public List<StoreVO> getStoreListByFilter(@Param("filterType")String filterType);

    public List<StoreVO> searchStoreList(@Param("keyword") String keyword);

    public List<ProductFilterVO> getFirstCategoryList();  // 이 부분 추가

    public StoreVO getStoreDetail(int storeId);


    //public List<ProductFilterVO> getSubcategoriesByFirstCategory(@Param("category") int category);
    public List<String> getSubcategoriesByFirstCategory1(@Param("code") int code);


    
  
}
