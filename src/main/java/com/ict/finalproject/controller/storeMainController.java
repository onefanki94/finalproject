package com.ict.finalproject.controller;

import com.ict.finalproject.Service.StoreService;
import com.ict.finalproject.vo.ProductFilterVO;
import com.ict.finalproject.vo.StoreVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class storeMainController {

    @Autowired
    StoreService storeService;

    // 메인 페이지 이동
    @GetMapping("/storeMain")
    public String storeMain() {
        return "store/storeMain";
    }

    // 상품 목록 및 카테고리 가져오기
    @GetMapping("/storeList")
    public ModelAndView getStoreListAndView() {
        List<StoreVO> storeList = storeService.getStoreList();
        List<ProductFilterVO> firstCategoryList = storeService.getFirstCategoryList();  // 카테고리 목록 추가
        System.out.println("First Category List: " + firstCategoryList);
        ModelAndView mav = new ModelAndView();
        mav.addObject("storeList", storeList);
        mav.addObject("firstCategoryList", firstCategoryList);  // 카테고리 필터 전달
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

    // 필터링된 상품 목록 가져오기 (AJAX 요청 처리)
    @PostMapping("/filterStoreList")
    @ResponseBody
    public List<ProductFilterVO> filterStoreList(@RequestBody ProductFilterVO filterCriteria) {
        // 필터 로그 출력
        System.out.println("Received type: " + filterCriteria.getType());
        System.out.println("Received stock: " + filterCriteria.getStock());

        // 필터링된 상품 리스트 가져오기
        List<ProductFilterVO> filteredStoreList = storeService.getFirstCategoryList();

        return filteredStoreList;
    }

    // 상품 상세 정보 가져오기
    @GetMapping("/storeDetail/{storeId}")
    public ModelAndView getStoreDetail(@PathVariable("storeId") int storeId) {
        StoreVO storeDetail = storeService.getStoreDetail(storeId);  // 상품 상세 조회
        ModelAndView mav = new ModelAndView();
        mav.addObject("storeDetail", storeDetail);
        mav.setViewName("store/storeDetail");

        return mav;
    }

    // 쇼핑백 페이지 이동
    @GetMapping("/shoppingBag")
    public ModelAndView joinPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("store/shopping_bag");
        return mav;
    }

    @GetMapping("/subcategories")
    @ResponseBody
    //public List<ProductFilterVO> getSubcategories(@RequestParam("category") int category) {
    public List<String> getSubcategories(@RequestParam("category") int category) {
        List<String> hi =  storeService.getSubcategoriesByFirstCategory1(category);
        List<ProductFilterVO> hi2 =  storeService.getSubcategoriesByFirstCategory(category);
        System.out.println("hi : "+ hi);
        System.out.println("hi2 : " + hi2);
        return storeService.getSubcategoriesByFirstCategory1(category);
    }
}
