package com.ict.finalproject.controller;

import com.ict.finalproject.DTO.OrderRequest;
import com.ict.finalproject.DTO.PaymentApprovalDTO;
import com.ict.finalproject.DTO.PaymentReqDTO;
import com.ict.finalproject.JWT.JWTUtil;
import com.ict.finalproject.Service.MemberService;
import com.ict.finalproject.Service.OrderService;
import com.ict.finalproject.vo.OrderListVO;
import com.ict.finalproject.vo.OrderVO;
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

    // 주문하기 버튼 클릭 후 T_order, T_orderlist에 데이터 삽입해주는 부분
    @PostMapping("/submit")
    public ResponseEntity<Object> submitOrder(@RequestBody OrderRequest orderRequest, @RequestHeader("Authorization") String Headertoken) {

        System.out.println(Headertoken);
        Map<String, Object> response = new HashMap<>();
        HttpHeaders headers = new HttpHeaders();

        // Authorization 헤더 확인
        if (Headertoken == null || !Headertoken.startsWith("Bearer ")) {
            response.put("error", "Authorization 헤더가 없거나 잘못되었습니다.");
            headers.setLocation(URI.create("/user/login"));  // 리다이렉션 경로 설정
            return new ResponseEntity<>(headers, HttpStatus.SEE_OTHER);  // 303 또는 302 응답
        }

        // 토큰 값에서 'Bearer ' 문자열 제거
        String token = Headertoken.substring(7);

        if (token.isEmpty()) {
            response.put("error", "JWT 토큰이 비어 있습니다.");
            headers.setLocation(URI.create("/user/login"));
            return new ResponseEntity<>(headers, HttpStatus.SEE_OTHER);
        }

        String userid;
        try {
            userid = jwtUtil.getUserIdFromToken(token);  // 토큰에서 사용자 ID 추출
        } catch (Exception e) {
            e.printStackTrace();
            response.put("error", "JWT 토큰 파싱 중 오류가 발생했습니다: " + e.getMessage());
            headers.setLocation(URI.create("/user/login"));
            return new ResponseEntity<>(headers, HttpStatus.SEE_OTHER);
        }

        if (userid == null || userid.isEmpty()) {
            response.put("error", "유효하지 않은 JWT 토큰입니다.");
            headers.setLocation(URI.create("/user/login"));
            return new ResponseEntity<>(headers, HttpStatus.SEE_OTHER);
        }

        // userid로 useridx 구하기
        Integer useridx = memberService.getUseridx(userid);
        if (useridx == null) {
            response.put("error", "사용자 ID에 해당하는 인덱스를 찾을 수 없습니다.");
            headers.setLocation(URI.create("/user/login"));
            return new ResponseEntity<>(headers, HttpStatus.SEE_OTHER);
        }

        // T_order 테이블에 주문 데이터 삽입
        int order_idx = service.createOrder(useridx, orderRequest.getTotal_price());

        // T_orderlist에 선택된 상품 목록 삽입
        for (int pro_idx : orderRequest.getProducts()) {
            service.addProductToOrderList(order_idx, pro_idx);
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
    public ResponseEntity<?> requestPayment(@RequestBody PaymentReqDTO paymentRequest) {
        service.savePaymentRequest(paymentRequest); // 결제 요청 정보 DB에 저장
        return ResponseEntity.ok("Payment requested");
    }

    @GetMapping("/success")
    public String paymentSuccess(@RequestParam String paymentKey, @RequestParam String orderId, @RequestParam int amount) {
        PaymentApprovalDTO approvalDTO = new PaymentApprovalDTO();
        approvalDTO.setPaymentKey(paymentKey);
        approvalDTO.setOrderId(orderId);
        approvalDTO.setAmount(amount);

        // Toss 결제 승인 처리
        service.approvePayment(approvalDTO);

        return "결제가 성공적으로 완료되었습니다.";
    }

    @GetMapping("/fail")
    public String paymentFail(@RequestParam String orderId, @RequestParam String code, @RequestParam String message) {
        // 실패 처리 로직
        service.handleFailure(orderId, code, message);
        return "결제가 실패했습니다. 다시 시도해주세요.";
    }


}
