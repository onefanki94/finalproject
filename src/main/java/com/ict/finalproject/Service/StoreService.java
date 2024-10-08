package com.ict.finalproject.Service;

import com.ict.finalproject.vo.ProductFilterVO;
import com.ict.finalproject.vo.StoreVO;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface StoreService {
    public List<StoreVO> getStoreList();

    public List<StoreVO> getStoreListByFilter(String filterType);

    public List<StoreVO> searchStoreList(String keyword);

    public List<ProductFilterVO> getStoreListByFilterCriteria(ProductFilterVO filterCriteria);

    public StoreVO getStoreDetail(int idx);
}
