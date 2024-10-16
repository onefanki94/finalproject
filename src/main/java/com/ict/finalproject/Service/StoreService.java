package com.ict.finalproject.Service;

import com.ict.finalproject.DTO.BasketDTO;
import com.ict.finalproject.vo.BasketVO;
import com.ict.finalproject.vo.ProductFilterVO;
import com.ict.finalproject.vo.StoreVO;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
public interface StoreService {
    public List<StoreVO> getRecentProducts();

    public List<StoreVO> getStoreList();

    public List<StoreVO> searchStoreList(String keyword);

    public StoreVO getStoreDetail(int storeId);

    public List<ProductFilterVO> getFirstCategoryList();

   // public List<ProductFilterVO> getSubcategoriesByFirstCategory(int category);
    public List<String> getSubcategoriesByFirstCategory1(@Param("category") int category);
    //채원
    //장바구니에 상품 있는지 체크
    int checkProductInBasket(BasketVO basketvo);
    //장바구니 테이블에 상품데이터 저장
    int basketInput(BasketVO basketvo);
    //장바구니 리스트
    List<BasketDTO> basketList(int useridx);
    //장바구니 상품 삭제(x버튼)
    int basketDelete(int idx,int useridx);
    //장바구니 상품 삭제(선택,전체상품삭제)
    void basketChoiceAndAllDelOk(int idx, int useridx);
    //장바구니 상품갯수 +
    int basketPlusAmount(int idx,int useridx);
    //장바구니 상품갯수 -
    int basketMinusAmount(int idx,int useridx);

}
