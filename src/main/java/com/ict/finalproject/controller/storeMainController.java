package com.ict.finalproject.controller;

import com.ict.finalproject.Service.StoreService;
import com.ict.finalproject.vo.ProductFilterVO;
import com.ict.finalproject.vo.StoreVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Slf4j
@Controller
public class storeMainController {

    @Autowired
    StoreService storeService;

    // 메인 페이지 이동
    @GetMapping("/storeMain")
    public ModelAndView storeMain() {
        List<StoreVO> recentProducts = storeService.getRecentProducts();  // 3개월 내의 데이터 호출

        // 데이터가 제대로 가져와졌는지 확인
        if (recentProducts == null || recentProducts.isEmpty()) {
            System.out.println("storeMain에서 데이터가 없습니다.");
        } else {
            System.out.println("storeMain에서 데이터가 있습니다. 총 " + recentProducts.size() + "개의 상품이 있습니다.");
        }

        ModelAndView mav = new ModelAndView("store/storeMain");  // storeMain.jsp로 이동
        mav.addObject("recentProducts", recentProducts);  // recentProducts 데이터를 JSP로 전달
        return mav;
    }

    // 상품 목록 및 카테고리 가져오기
    @GetMapping("/storeList")
    public ModelAndView getStoreListAndView() {
        List<StoreVO> storeList = storeService.getStoreList();
        List<ProductFilterVO> firstCategoryList = storeService.getFirstCategoryList();  // 카테고리 목록 추가
        ModelAndView mav = new ModelAndView();
        mav.addObject("storeList", storeList);
        mav.addObject("firstCategoryList", firstCategoryList);  // 카테고리 필터 전달
        mav.setViewName("store/storeList");

        return mav;
    }

    // 최근 3개월 내의 상품들만 가져와서 JSP로 전달(신규굿즈)
    /*@GetMapping("/recentProducts")
    public ModelAndView getRecentProducts() {
        List<StoreVO> recentProducts = storeService.getRecentProducts();
        log.info("호출 " + recentProducts );
        // 데이터를 출력하여 확인
        if (recentProducts == null || recentProducts.isEmpty()) {
            System.out.println("신규 굿즈 데이터가 없습니다.");
        } else {
            System.out.println("신규 굿즈 데이터가 있습니다. 총 " + recentProducts.size() + "개의 상품이 있습니다.");
            for (StoreVO product : recentProducts) {
                System.out.println("상품 ID: " + product.getIdx() + ", 상품명: " + product.getTitle());
            }
        }

        ModelAndView mav = new ModelAndView("store/storeMain");
        mav.addObject("recentProducts", recentProducts);
        return mav;
    }*/




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
    public List<String> subcategoriesByFirstCategory(@RequestParam("code") int categoryCode) {
        System.out.println("Received category code: " + categoryCode);  // 서버 로그에 코드 값 출력
        List<String> subcategories = storeService.getSubcategoriesByFirstCategory1(categoryCode);
        System.out.println("subcategories: " + subcategories);  // 하위 카테고리 출력
        return subcategories;
    }
}