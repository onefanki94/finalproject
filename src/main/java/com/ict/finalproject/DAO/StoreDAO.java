package com.ict.finalproject.DAO;

import com.ict.finalproject.DTO.BasketDTO;
import com.ict.finalproject.vo.BasketVO;
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
}
