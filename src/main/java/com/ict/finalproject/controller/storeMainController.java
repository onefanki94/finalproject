package com.ict.finalproject.controller;

import com.ict.finalproject.Service.StoreService;
import com.ict.finalproject.vo.ProductFilterVO;
import com.ict.finalproject.vo.StoreVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Collections;
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
//    @GetMapping("/subcategories")
//    @ResponseBody
//    public List<String> getSubcategories(@RequestParam("category") String category) {
//        try {
//            // category가 String으로 처리되는지 확인
//            System.out.println("Received category: " + category);
//
//            // 카테고리에 해당하는 하위 카테고리 가져오기
//            return storeService.getSubcategoriesByFirstCategory(category);
//        } catch (Exception e) {
//            // 서버 오류 발생 시 로그로 출력
//            e.printStackTrace();
//            return Collections.emptyList();  // 빈 리스트 반환
//        }
//    }

    @GetMapping("/subcategories1")
    @ResponseBody
    public List<String> subcategoriesByFirstCategory(@RequestParam(value = "code", required = false) Integer code) {
        System.out.println("Received code: " + code);  // 코드 값을 출력
        if (code == null) {
            return Collections.emptyList();
        }
        List<String> subcategories = storeService.getSubcategoriesByFirstCategory1(code);
        System.out.println("Subcategories: " + subcategories);  // 하위 카테고리 출력
        return subcategories;
    }
}