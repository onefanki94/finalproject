package com.ict.finalproject.controller;

import com.ict.finalproject.Service.StoreService;
import com.ict.finalproject.vo.ProductFilterVO;
import com.ict.finalproject.vo.StoreVO;
import jakarta.servlet.ServletContext;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.util.*;

@Slf4j
@Controller
public class storeMainController {

    @Autowired
    StoreService storeService;
    @Autowired
    ServletContext context;

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

        String imageDirPath = context.getRealPath("/img/store/origin");
        File folder = new File(imageDirPath);
        File[] listOfFiles = folder.listFiles();

        // 이미지 파일명과 확장자를 제거한 이름을 저장할 리스트
        List<Map<String, String>> imageInfoList = new ArrayList<>();
        if (listOfFiles != null) {
            for (File file : listOfFiles) {
                if (file.isFile()) {
                    String imageNameWithExt = file.getName();  // 확장자가 포함된 파일 이름
                    String imageName = imageNameWithExt;

                    // 확장자를 제거한 이름만 추출
                    if (imageNameWithExt.contains(".")) {
                        imageName = imageNameWithExt.substring(0, imageNameWithExt.lastIndexOf("."));  // 확장자 제거
                    }

                    // 이미지 경로와 이미지 이름을 함께 저장
                    Map<String, String> imageInfo = new HashMap<>();
                    imageInfo.put("imageNameWithExt", imageNameWithExt);  // 확장자 포함된 경로
                    imageInfo.put("imageName", imageName);  // 확장자 제거된 이름
                    imageInfoList.add(imageInfo);
                }
            }
        }

        ModelAndView mav = new ModelAndView("store/storeMain");  // storeMain.jsp로 이동
        mav.addObject("recentProducts", recentProducts);  // recentProducts 데이터를 JSP로 전달
        mav.addObject("imageInfoList", imageInfoList);  // 이미지 경로와 이름 정보를 JSP로 전달
        return mav;
    }







    @GetMapping("/storeList")
    public ModelAndView getStoreListAndView(
            @RequestParam(defaultValue = "1") int pageNum,
            @RequestParam(defaultValue = "10") int pageSize,
            @RequestParam(required = false) Integer category,
            @RequestParam(required = false) Integer second_category,
            @RequestParam(required = false) String filterType) {

        // offset 계산
        int offset = (pageNum - 1) * pageSize;

        // 페이징 처리된 상품 목록을 가져옴 (카테고리와 필터 타입을 처리)
        List<StoreVO> pagedProducts;

        // 1. 카테고리 필터링이 있는 경우
        if (category != null) {
            pagedProducts = storeService.getProductsByCategory(pageSize, offset, category);
        }
        // 2. 필터 타입(최신순, 인기순, 가격순 등) 필터링이 있는 경우
        else if (filterType != null) {
            pagedProducts = storeService.getStoreListByFilter(filterType);
        }
        // 3. 필터링 조건이 없는 경우 전체 상품을 가져옴
        else {
            pagedProducts = storeService.getPagedProducts(pageSize, offset, null,null);
        }

        // 총 상품 개수를 가져옴
        int totalProducts = storeService.getTotalProductCount();
        // 총 페이지 수 계산
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
        // 카테고리 목록을 가져옴
        List<ProductFilterVO> firstCategoryList = storeService.getFirstCategoryList();




        // ModelAndView 설정
        ModelAndView mav = new ModelAndView("store/storeList");
        mav.addObject("pagedProducts", pagedProducts); // 페이지별 상품 목록 전달
        mav.addObject("firstCategoryList", firstCategoryList); // 카테고리 필터 전달
        mav.addObject("currentPage", pageNum); // 현재 페이지 전달
        mav.addObject("totalPages", totalPages); // 총 페이지 수 전달
        mav.addObject("selectedCategory", category); // 선택된 카테고리 전달 (null일 수 있음)
        mav.addObject("selectedFilterType", filterType); // 선택된 필터 타입 전달 (null일 수 있음)

        return mav;
    }

    //API구현
    @GetMapping("/pagedProducts")
    @ResponseBody  // JSON으로 데이터를 반환하기 위해 추가
    public List<StoreVO> getPagedProducts(
            @RequestParam int pageNum,
            @RequestParam int pageSize,
            @RequestParam(required = false) Integer category,
            @RequestParam(required = false) Integer second_category) {

        int offset = (pageNum - 1) * pageSize;

//        // category와 secondCategory가 null일 경우 기본값을 설정합니다.
//        int categoryInt = (category != null) ? category : 0;
//        int secondCategoryInt = (second_category != null) ? second_category : 0; // 기본값 0 설정

        // 두 번째 카테고리를 포함한 상품 목록을 가져옵니다.
        List<StoreVO> pagedProducts = storeService.getPagedProducts(pageSize, offset, category, second_category);

        // 상품 목록을 콘솔에 출력합니다.
        System.out.println("페이지 번호: " + pageNum + ", 페이지 크기: " + pageSize);
        System.out.println("상품 목록: " + pagedProducts);

        return pagedProducts; // JSON으로 반환
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
    public ModelAndView getStoreDetail(@PathVariable int storeId) {
        ModelAndView mav = new ModelAndView("store/storeDetail");

        // 1. 기본 상품 정보 가져오기
        StoreVO storeDetail = storeService.getStoreDetail(storeId);

        // 2. 숨겨진 이미지 리스트 가져오기
        List<String> hiddenImages = storeService.getImagesByProductId(storeId);

        // 3. 기본 상품 정보와 숨겨진 이미지 리스트 설정
        storeDetail.setDetailImages(hiddenImages);

        // 카테고리 코드로 해당 타입을 조회
        String categoryType = storeService.getCategoryType(storeDetail.getCategory());

        mav.addObject("storeDetail", storeDetail);
        mav.addObject("categoryType", categoryType);
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
        // 서버에서 categoryCode 로그 출력
        System.out.println("Received category code: " + categoryCode);

        // StoreService를 통해 하위 카테고리 목록을 가져옴
        List<String> subcategories = storeService.getSubcategoriesByFirstCategory(categoryCode);

        // 하위 카테고리 목록을 로그로 출력하여 확인
        System.out.println("Subcategories: " + subcategories);

        // JSON 형식으로 클라이언트에 반환
        return subcategories;
    }
}

