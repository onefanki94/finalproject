package com.ict.finalproject.controller;

import com.ict.finalproject.Service.StoreService;
import com.ict.finalproject.vo.StoreVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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

    // 필터링된 상품 목록 가져오기
    @GetMapping("/filterStoreList")
    public ModelAndView filterStoreList(@RequestParam("filterType") String filterType) {
        List<StoreVO> filteredStoreList = storeService.getStoreListByFilter(filterType);
        ModelAndView mav = new ModelAndView();
        mav.addObject("storeList", filteredStoreList);
        mav.setViewName("store/storeList");
        return mav;
    }

    // 검색된 상품 목록 가져오기
    @GetMapping("/searchStoreList")
    public ModelAndView searchStoreList(@RequestParam("keyword") String keyword) {
        List<StoreVO> searchResults = storeService.searchStoreList(keyword);
        ModelAndView mav = new ModelAndView();
        mav.addObject("storeList", searchResults);
        mav.setViewName("store/storeList");
        return mav;
    }

    @GetMapping("/filterStoreList")
    public ModelAndView filterStoreList(
            @RequestParam(value = "ani_title", required = false) String ani_title,
            @RequestParam(value = "brand", required = false) String brand,
            @RequestParam(value = "stock", required = false, defaultValue = "0") int stock) {
        
        StoreVO Filter = new StoreVO();
        Filter.setAni_title(ani_title);
        Filter.setBrand(brand);
        Filter.setStock(stock);

        List<StoreVO> filteredStoreList = storeService.getStoreListByFilterCriteria(ani_title, brand);

        ModelAndView mav = new ModelAndView();
        mav.addObject("storeList", filteredStoreList);
        mav.setViewName("store/storeList");
        return mav;
    }


    @GetMapping("/storeDetail")
   public String storDetail() {
       return "store/storeDetail";
   }
   
}