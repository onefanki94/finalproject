package com.ict.finalproject.Service;

import com.ict.finalproject.DTO.BasketDTO;
import com.ict.finalproject.vo.BasketVO;
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

    public StoreVO getStoreDetail(int storeId);

    //채원
    //장바구니에 상품 있는지 체크
    int checkProductInBasket(BasketVO basketvo);
    //장바구니 테이블에 상품데이터 저장
    int basketInput(BasketVO basketvo);
    //장바구니 리스트
    List<BasketDTO> basketList(int useridx);
    
}
