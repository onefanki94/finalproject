package com.ict.finalproject.controller;

import com.ict.finalproject.DTO.BasketDTO;
import com.ict.finalproject.JWT.JWTUtil;
import com.ict.finalproject.Service.MemberService;
import com.ict.finalproject.Service.StoreService;
import com.ict.finalproject.vo.BasketVO;
import com.ict.finalproject.vo.ProductFilterVO;
import com.ict.finalproject.vo.StoreVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.Console;
import java.net.URI;
import java.util.*;

@Slf4j
@Controller
public class storeMainController {

    @Autowired
    StoreService storeService;

    // 메인 페이지 이동

    @Autowired
    JWTUtil jwtUtil;

    @Autowired
    MemberService memberService;


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

    @GetMapping("/storeListAndView")
    public ModelAndView getStoreList() {
        // 데이터베이스에서 StoreVO 리스트를 가져오기
        List<StoreVO> storeList = storeService.getStoreList();

        // 중복된 카테고리 제거 (int 타입으로 처리)
        Set<Integer> uniqueCategories = new HashSet<>();
        for (StoreVO store : storeList) {
            uniqueCategories.add(store.getCategory());
        }

        System.out.println("Store List: " + storeList);
        System.out.println("Unique Categories: " + uniqueCategories);

        // ModelAndView 객체 생성
        ModelAndView mav = new ModelAndView();

        // 모델에 데이터를 추가
        mav.addObject("uniqueCategories", uniqueCategories);
        mav.addObject("storeList", storeList);

        // 반환할 JSP 경로 설정
        mav.setViewName("store/storeList");  // JSP 파일 경로

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

    @GetMapping("/subcategories")
    @ResponseBody
    //public List<ProductFilterVO> getSubcategories(@RequestParam("category") int category) {
    public List<String> getSubcategories(@RequestParam(value = "category", required = false) Integer category) {
        if (category == null) {
            category = 0;  // 기본값 설정
        }
        List<String> subcategory = storeService.getSubcategoriesByFirstCategory1(category);

        //List<ProductFilterVO> hi2 =  storeService.getSubcategoriesByFirstCategory(category);
        System.out.println("subcategory : "+ subcategory);

        //System.out.println("hi2 : " + hi2);
        
        return storeService.getSubcategoriesByFirstCategory1(category);
    }

    // 쇼핑백 페이지 이동
    // 채원 시작
    // 헤더에서 토큰을 추출하고, 토큰의 유효성을 검증한 후 사용자 ID와 useridx를 반환 함수(코드가 너무 중복돼서 따로 뺌)
    private ResponseEntity<Map<String, Object>> extractUserIdFromToken(String Headertoken) {
        Map<String, Object> response = new HashMap<>();
        HttpHeaders headers = new HttpHeaders();

        // Authorization 헤더 확인
        if (Headertoken == null || !Headertoken.startsWith("Bearer ")) {
            log.info("1");
            response.put("error", "Authorization 헤더가 없거나 잘못되었습니다.");
            headers.setLocation(URI.create("/user/login"));
            return new ResponseEntity<>(response, headers, HttpStatus.SEE_OTHER);
        }

        // 토큰 값에서 'Bearer ' 문자열 제거
        String token = Headertoken.substring(7);
        if (token.isEmpty()) {
            log.info("2");
            response.put("error", "JWT 토큰이 비어 있습니다.");
            headers.setLocation(URI.create("/user/login"));
            return new ResponseEntity<>(response, headers, HttpStatus.SEE_OTHER);
        }

        String userid;
        try {
            log.info("token :{}",token);
            userid = jwtUtil.getUserIdFromToken(token);  // 토큰에서 사용자 ID 추출
        } catch (Exception e) {
            e.printStackTrace();
            response.put("error", "JWT 토큰 파싱 중 오류가 발생했습니다: " + e.getMessage());
            headers.setLocation(URI.create("/user/login"));
            return new ResponseEntity<>(response, headers, HttpStatus.SEE_OTHER);
        }

        if (userid == null || userid.isEmpty()) {
            log.info("4");
            response.put("error", "유효하지 않은 JWT 토큰입니다.");
            headers.setLocation(URI.create("/user/login"));
            return new ResponseEntity<>(response, headers, HttpStatus.SEE_OTHER);
        }

        // userid로 useridx 구하기
        Integer useridx = memberService.getUseridx(userid);
        if (useridx == null) {
            log.info("5");
            response.put("error", "사용자 ID에 해당하는 인덱스를 찾을 수 없습니다.");
            headers.setLocation(URI.create("/user/login"));
            return new ResponseEntity<>(response, headers, HttpStatus.SEE_OTHER);
        }

        // 정상 처리된 경우 사용자 ID와 useridx를 반환
        response.put("userid", userid);
        response.put("useridx", useridx);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/basketOK")
    public ResponseEntity<String> basketOK(@RequestBody BasketVO basketvo,
                                           @RequestHeader("Authorization") String Headertoken){
        // JWT 토큰 검증 및 useridx 추출
        ResponseEntity<Map<String, Object>> tokenResponse = extractUserIdFromToken(Headertoken);
        if (!tokenResponse.getStatusCode().is2xxSuccessful()) {
            return new ResponseEntity<>(tokenResponse.getHeaders(), tokenResponse.getStatusCode());
        }

        // useridx 가져오기
        Map<String, Object> responseBody = tokenResponse.getBody();
        Integer useridx = (Integer) responseBody.get("useridx");

        basketvo.setUseridx(useridx);
        // 장바구니에 이미 있는지 검증
        int productExists = storeService.checkProductInBasket(basketvo);
        if (productExists > 0) {
            // 이미 장바구니에 있는 경우
            return ResponseEntity.status(HttpStatus.CONFLICT).body("장바구니에 이미 존재하는 상품입니다.");
        }

        // 장바구니에 데이터 저장
        int result = storeService.basketInput(basketvo);
        log.info("**********basket : {}",basketvo.toString());

        if(result>0){
            return ResponseEntity.ok("장바구니에 상품담기 완료");
        }else{
            return new ResponseEntity<>(tokenResponse.getHeaders(), HttpStatus.SEE_OTHER);
        }

    }

    //장바구니 페이지로 이동
    @GetMapping("/shoppingBag")
    public ModelAndView shoppingBag(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("store/shopping_bag");
        return mav;
    }

    //장바구니 데이터 select
    @PostMapping("/basketList")
    public ResponseEntity<Map<String, Object>> basketList(@RequestHeader("Authorization") String Headertoken){
        // JWT 토큰 검증 및 useridx 추출
        ResponseEntity<Map<String, Object>> tokenResponse = extractUserIdFromToken(Headertoken);
        if (!tokenResponse.getStatusCode().is2xxSuccessful()) {
            return new ResponseEntity<>(tokenResponse.getHeaders(), tokenResponse.getStatusCode());
        }

        // useridx 가져오기
        Map<String, Object> responseBody = tokenResponse.getBody();
        Integer useridx = (Integer) responseBody.get("useridx");

        // 장바구니 리스트
        List<BasketDTO> basketList = storeService.basketList(useridx);
        Map<String, Object> response = new HashMap<>();
        response.put("basketList", basketList);  // 장바구니 리스트를 맵에 저장

        return ResponseEntity.ok(response);
    }

    //장바구니 상품 삭제(x버튼)
    @PostMapping("/basketDelOk")
    public ResponseEntity<String> basketDelOk(@RequestParam int idx,
                                           @RequestHeader("Authorization") String Headertoken){
        // JWT 토큰 검증 및 useridx 추출
        ResponseEntity<Map<String, Object>> tokenResponse = extractUserIdFromToken(Headertoken);
        if (!tokenResponse.getStatusCode().is2xxSuccessful()) {
            return new ResponseEntity<>(tokenResponse.getHeaders(), tokenResponse.getStatusCode());
        }

        // useridx 가져오기
        Map<String, Object> responseBody = tokenResponse.getBody();
        Integer useridx = (Integer) responseBody.get("useridx");

        // 장바구니에서 상품 삭제 update
        int result = storeService.basketDelete(idx,useridx);

        if(result>0){
            return ResponseEntity.ok("장바구니 선택 상품 삭제 완료");
        }else{
            return new ResponseEntity<>(tokenResponse.getHeaders(), HttpStatus.SEE_OTHER);
        }
    }

    // 장바구니 상품 선택 삭제
    @PostMapping("/basketChoiceDelOk")
    public ResponseEntity<String> basketChoiceDelOk(@RequestBody Map<String, List<Integer>> request,
                                                    @RequestHeader("Authorization") String Headertoken){
        // JWT 토큰 검증 및 useridx 추출
        ResponseEntity<Map<String, Object>> tokenResponse = extractUserIdFromToken(Headertoken);
        if (!tokenResponse.getStatusCode().is2xxSuccessful()) {
            return new ResponseEntity<>(tokenResponse.getHeaders(), tokenResponse.getStatusCode());
        }

        // useridx 가져오기
        Map<String, Object> responseBody = tokenResponse.getBody();
        Integer useridx = (Integer) responseBody.get("useridx");

        //받아온 값
        List<Integer> idxList = request.get("idxList");

        if (idxList == null || idxList.isEmpty()) {
            return ResponseEntity.badRequest().body("삭제할 상품을 선택해주세요.");
        }

        // 장바구니에서 상품 삭제 update
        for (int idx : idxList) {
            storeService.basketChoiceAndAllDelOk(idx, useridx);
        }

        return ResponseEntity.ok("장바구니 선택 상품 삭제 완료");
    }

    //장바구니 전체삭제
    @PostMapping("/basketAllDelOk")
    public ResponseEntity<String> basketAllDelOk(@RequestBody Map<String, List<Integer>> request,
                                                 @RequestHeader("Authorization") String Headertoken){
        // JWT 토큰 검증 및 useridx 추출
        ResponseEntity<Map<String, Object>> tokenResponse = extractUserIdFromToken(Headertoken);
        if (!tokenResponse.getStatusCode().is2xxSuccessful()) {
            return new ResponseEntity<>(tokenResponse.getHeaders(), tokenResponse.getStatusCode());
        }

        // useridx 가져오기
        Map<String, Object> responseBody = tokenResponse.getBody();
        Integer useridx = (Integer) responseBody.get("useridx");

        //받아온 값
        List<Integer> idxList = request.get("idxList");

        if (idxList == null || idxList.isEmpty()) {
            return ResponseEntity.badRequest().body("삭제할 상품을 선택해주세요.");
        }

        // 장바구니에서 상품 삭제 update
        for (int idx : idxList) {
            storeService.basketChoiceAndAllDelOk(idx, useridx);
        }

        return ResponseEntity.ok("장바구니 전체 상품 삭제 완료");
    }

}


