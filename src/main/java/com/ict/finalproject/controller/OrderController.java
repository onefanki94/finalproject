package com.ict.finalproject.controller;

import com.ict.finalproject.DTO.OrderRequest;
import com.ict.finalproject.DTO.PayCancelDTO;
import com.ict.finalproject.DTO.PaymentApprovalDTO;
import com.ict.finalproject.DTO.PaymentReqDTO;
import com.ict.finalproject.JWT.JWTUtil;
import com.ict.finalproject.Service.MemberService;
import com.ict.finalproject.Service.OrderService;
import com.ict.finalproject.vo.OrderListVO;
import com.ict.finalproject.vo.OrderVO;
import com.ict.finalproject.vo.PaymentVO;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.net.URI;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/order")
@Slf4j
public class OrderController {
    @Autowired
    MemberService memberService;

    @Autowired
    JWTUtil jwtUtil;

    @Autowired
    OrderService service;

    ModelAndView mav = null;

    // 헤더에서 토큰을 추출하고, 토큰의 유효성을 검증한 후 사용자 ID와 useridx를 반환 함수(코드가 너무 중복돼서 따로 뺌)
    private ResponseEntity<Map<String, Object>> extractUserIdFromToken(String Headertoken) {
        Map<String, Object> response = new HashMap<>();
        HttpHeaders headers = new HttpHeaders();

        // Authorization 헤더 확인
        if (Headertoken == null || !Headertoken.startsWith("Bearer ")) {
            response.put("error", "Authorization 헤더가 없거나 잘못되었습니다.");
            headers.setLocation(URI.create("/user/login"));
            return new ResponseEntity<>(response, headers, HttpStatus.SEE_OTHER);
        }

        // 토큰 값에서 'Bearer ' 문자열 제거
        String token = Headertoken.substring(7);
        if (token.isEmpty()) {
            response.put("error", "JWT 토큰이 비어 있습니다.");
            headers.setLocation(URI.create("/user/login"));
            return new ResponseEntity<>(response, headers, HttpStatus.SEE_OTHER);
        }

        String userid;
        try {
            userid = jwtUtil.getUserIdFromToken(token);  // 토큰에서 사용자 ID 추출
        } catch (Exception e) {
            e.printStackTrace();
            response.put("error", "JWT 토큰 파싱 중 오류가 발생했습니다: " + e.getMessage());
            headers.setLocation(URI.create("/user/login"));
            return new ResponseEntity<>(response, headers, HttpStatus.SEE_OTHER);
        }

        if (userid == null || userid.isEmpty()) {
            response.put("error", "유효하지 않은 JWT 토큰입니다.");
            headers.setLocation(URI.create("/user/login"));
            return new ResponseEntity<>(response, headers, HttpStatus.SEE_OTHER);
        }

        // userid로 useridx 구하기
        Integer useridx = memberService.getUseridx(userid);
        if (useridx == null) {
            response.put("error", "사용자 ID에 해당하는 인덱스를 찾을 수 없습니다.");
            headers.setLocation(URI.create("/user/login"));
            return new ResponseEntity<>(response, headers, HttpStatus.SEE_OTHER);
        }

        // 정상 처리된 경우 사용자 ID와 useridx를 반환
        response.put("userid", userid);
        response.put("useridx", useridx);
        return ResponseEntity.ok(response);
    }

    // 주문하기 버튼 클릭 후 T_order, T_orderlist에 데이터 삽입해주는 부분
    @PostMapping("/submit")
    public ResponseEntity<Object> submitOrder(@RequestBody OrderRequest orderRequest, @RequestHeader("Authorization") String Headertoken) {

        // JWT 토큰 검증 및 useridx 추출
        ResponseEntity<Map<String, Object>> tokenResponse = extractUserIdFromToken(Headertoken);
        if (!tokenResponse.getStatusCode().is2xxSuccessful()) {
            return new ResponseEntity<>(tokenResponse.getHeaders(), tokenResponse.getStatusCode());
        }

        // useridx 가져오기
        Map<String, Object> responseBody = tokenResponse.getBody();
        Integer useridx = (Integer) responseBody.get("useridx");

        Map<String, Object> response = new HashMap<>();

        // T_order 테이블에 주문 데이터 삽입
        int order_idx = service.createOrder(useridx, orderRequest.getTotal_price());

        // T_orderlist에 선택된 상품 목록 및 수량 삽입
        List<Integer> products = orderRequest.getProducts();
        List<Integer> productsCounts = orderRequest.getProductsCounts();

        for (int i = 0; i < products.size(); i++) {
            int pro_idx = products.get(i);
            int amount = productsCounts.get(i);
            service.addProductToOrderList(order_idx, pro_idx, amount);
        }

        // 주문 완료 후 order_idx를 응답에 포함
        response.put("order_idx", order_idx);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @GetMapping("/orderpage/{order_idx}")
    public ModelAndView showOrderPage(@PathVariable("order_idx") int order_idx) {
        mav = new ModelAndView();

        // 주문 정보와 상품 목록을 조회
        OrderVO order = service.getOrderById(order_idx);
        List<OrderListVO> orderList = service.getOrderListByOrderIdx(order_idx);

        log.info(order.toString());
        log.info(orderList.toString());

        // 주문 정보와 상품 목록을 ModelAndView에 추가
        mav.addObject("order", order);
        mav.addObject("orderList", orderList);

        mav.setViewName("store/orderpage");
        return mav;
    }

    //로그인 여부
    @ResponseBody
    @GetMapping("/getuserid")
    public String getuserid(@RequestParam("Authorization") String token){
        log.info("getuserid 메서드 호출됨");
        String userid = jwtUtil.getUserIdFromToken(token); //토큰에서 사용자 아이디 추출
        log.info("userid : " + userid);
        return userid;
    }
    
    // 결제요청정보 DB에 저장
    @PostMapping("/request")
    public ResponseEntity<?> requestPayment(@RequestBody PaymentReqDTO paymentRequest,@RequestHeader("Authorization") String Headertoken) {
        // JWT 토큰 검증
        ResponseEntity<Map<String, Object>> tokenResponse = extractUserIdFromToken(Headertoken);
        if (!tokenResponse.getStatusCode().is2xxSuccessful()) {
            return new ResponseEntity<>(tokenResponse.getHeaders(), tokenResponse.getStatusCode());
        }

        // useridx 가져오기
        Map<String, Object> responseBody = tokenResponse.getBody();
        Integer useridx = (Integer) responseBody.get("useridx");
        paymentRequest.setUseridx(useridx);

        service.savePaymentRequest(paymentRequest); // 결제 요청 정보 DB에 저장
        service.saveOrderRequest(paymentRequest);
        return ResponseEntity.ok("Payment requested");
    }

    @GetMapping("/success")
    public ModelAndView paymentSuccess(@RequestParam String paymentKey, @RequestParam String orderId, @RequestParam int amount) {
        PaymentApprovalDTO approvalDTO = new PaymentApprovalDTO();
        approvalDTO.setPaymentKey(paymentKey);
        approvalDTO.setOrderId(orderId);
        approvalDTO.setAmount(amount);

        // Toss 결제 승인 처리
        int order_idx = service.approvePayment(approvalDTO);

        // 화면에 뿌릴 데이터
        // 1. T_order : regDT(주문접수일시), 배송정보(수령인, 전화번호, 주소, 요청사항), 총 금액, 적립금 사용액
        OrderVO orderData = service.orderSuccessData(order_idx);
        log.info("***********orderData : {}",orderData.toString());
        // 2. T_orderList : 애니명, 굿즈명, 굿즈가격, amount
        List<OrderListVO> orderListData = service.orderListSuccessData(order_idx);
        // 3. T_payment : paytype, 결제완료일시, (영수증 출력시 필요한 데이터? -> 생각)
        PaymentVO paymentData = service.paymentSuccessData(order_idx);

        mav = new ModelAndView();
        mav.addObject("orderData",orderData);
        mav.addObject("orderListData",orderListData);
        mav.addObject("paymentData",paymentData);

        mav.setViewName("store/orderOk");

        return mav;
    }

    @GetMapping("/fail")
    public String paymentFail(@RequestParam String orderId, @RequestParam String code, @RequestParam String message) {
        // 실패 처리 로직
        service.handleFailure(orderId, code, message);
        return "결제가 실패했습니다. 다시 시도해주세요.";
    }

    // 결제 취소 구현
    // 결제 취소 페이지로 이동할거임
    @PostMapping("/cancel_basicInfo")
    public ResponseEntity<String> cancelBasicInfo(@RequestBody PayCancelDTO payCancelDTO,
                                               @RequestHeader("Authorization") String Headertoken,
                                               HttpSession session){
        // JWT 토큰 검증 및 useridx 추출
        ResponseEntity<Map<String, Object>> tokenResponse = extractUserIdFromToken(Headertoken);
        if (!tokenResponse.getStatusCode().is2xxSuccessful()) {
            return new ResponseEntity<>(tokenResponse.getHeaders(), tokenResponse.getStatusCode());
        }

        // useridx 가져오기
        Map<String, Object> responseBody = tokenResponse.getBody();
        Integer useridx = (Integer) responseBody.get("useridx");

        // 프론트에서 가져온 order_idx와 pro_idx를 PayCancelDTO에 담았음
        int order_idx = payCancelDTO.getOrder_idx();
        // paymentkey값 알아와서 저장하기
        String paymentkey = service.getPaymentKey(order_idx);
        log.info("paymentkey:{}",paymentkey);
        payCancelDTO.setPaymentkey(paymentkey);
        session.setAttribute("PayCancelDTO", payCancelDTO);
        return ResponseEntity.ok("PayCancelDTO에 기본정보 저장 완료");
    }
    //결제 취소 step 1 view
    @GetMapping("/mypage_cancel1")
    public ModelAndView mypageCancel1(@RequestParam("order_idx") int order_idx,
                                      @RequestParam("pro_idx") int pro_idx) {
        // 화면에 데이터 뿌려주기
        OrderListVO cancelProduct = service.getCancelProduct(order_idx,pro_idx);
        mav = new ModelAndView();
        mav.addObject("cancelProduct",cancelProduct);
        mav.setViewName("mypage/mypage_cancel1");

        return mav;
    }

    //결제 취소 step 2 view
    @GetMapping("/mypage_cancel2")
    public ModelAndView mypageCancel2() {
        mav = new ModelAndView();
        mav.setViewName("mypage/mypage_cancel2");

        return mav;
    }

    //결제 취소 step 3 view
    @GetMapping("/mypage_cancel3")
    public ModelAndView mypageCancel3() {
        mav = new ModelAndView();
        mav.setViewName("mypage/mypage_cancel3");

        return mav;
    }

}
