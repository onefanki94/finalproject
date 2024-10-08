package com.ict.finalproject.controller;

import com.ict.finalproject.Service.StoreService;
import com.ict.finalproject.vo.ProductFilterVO;
import com.ict.finalproject.vo.StoreVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
public class storeMainController {

    @Autowired
    StoreService storeService;
     @GetMapping("/storeMain")
 public String storeMain() {
     return "store/storeMain";
 }


    @GetMapping("/storeList")
    public ModelAndView getStoreList(){
        System.out.println(11);
        List<StoreVO> storeList = storeService.getStoreList();
        System.out.println(storeList);
        ModelAndView mav = new ModelAndView();
        mav.addObject("storeList", storeList);
        mav.setViewName("store/storeList");
        return mav;
    }

    // // 필터링된 상품 목록 가져오기
    // @GetMapping("/filterStoreList")
    // public ModelAndView filterStoreList(@RequestParam("filterType") String filterType) {
    //     List<StoreVO> filteredStoreList = storeService.getStoreListByFilter(filterType);
    //     ModelAndView mav = new ModelAndView();
    //     mav.addObject("storeList", filteredStoreList);
    //     mav.setViewName("store/storeList");
    //     return mav;
    // }

    // 검색된 상품 목록 가져오기
    @GetMapping("/searchStoreList")
    public ModelAndView searchStoreList(@RequestParam("keyword") String keyword) {
        List<StoreVO> searchResults = storeService.searchStoreList(keyword);
        ModelAndView mav = new ModelAndView();
        mav.addObject("storeList", searchResults);
        mav.setViewName("store/storeList");
        return mav;
    }

    @PostMapping("/filterStoreList")
public ModelAndView filterStoreList(
        @RequestParam(value = "ani_title", required = false) String ani_title,
        @RequestParam(value = "brand", required = false) String brand,
        @RequestParam(value = "stock", required = false, defaultValue = "0") int stock) {

    // 필터 정보를 담는 VO 객체 생성
    ProductFilterVO filterCriteria = new ProductFilterVO();
    filterCriteria.setAni_title(ani_title);
    filterCriteria.setBrand(brand);
    filterCriteria.setStock(stock);

    // 필터링된 상품 리스트 가져오기
    List<ProductFilterVO> filteredStoreList = storeService.getStoreListByFilterCriteria(filterCriteria);

    // 필터링된 상품 리스트를 ModelAndView에 추가
    ModelAndView mav = new ModelAndView();
    mav.addObject("storeList", filteredStoreList);
    mav.setViewName("store/storeList"); // storeList.jsp 파일로 이동
    return mav;
}


    @GetMapping("/storeDetail")
   public String storDetail() {
       return "store/storeDetail";
   }
   
}