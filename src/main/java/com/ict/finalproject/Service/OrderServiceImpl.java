package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.OrderDAO;
import com.ict.finalproject.DTO.PaymentApprovalDTO;
import com.ict.finalproject.DTO.PaymentReqDTO;
import com.ict.finalproject.DTO.PaymentResDTO;
import com.ict.finalproject.vo.OrderListVO;
import com.ict.finalproject.vo.OrderVO;
import com.ict.finalproject.vo.PaymentVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService{
    private static final Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);
    @Autowired
    OrderDAO dao;

    @Override
    public int createOrder(int useridx, int total_price) {
        OrderVO order = new OrderVO(useridx, total_price);
        dao.insertOrder(order);
        return order.getIdx();  // 자동 증가된 order_idx 반환
    }

    @Override
    public void addProductToOrderList(int order_idx, int pro_idx, int amount) {
        OrderListVO orderList = new OrderListVO(order_idx, pro_idx,amount);
        dao.insertOrderList(orderList);
    }

    @Override
    public OrderVO getOrderById(int order_idx) {
        return dao.selectOrderById(order_idx);
    }

    @Override
    public List<OrderListVO> getOrderListByOrderIdx(int order_idx) {
        return dao.selectOrderListByOrderIdx(order_idx);
    }

    @Override
    public void savePaymentRequest(PaymentReqDTO paymentRequest) {
        // 결제 요청 정보를 DB에 저장
        dao.insertPaymentRequest(paymentRequest);
    }

    @Value("${toss.secretKey}")  // application.properties의 secretKey 값을 주입
    private String secretKey;

    @Override
    public void approvePayment(PaymentApprovalDTO approvalDTO) {
        // 1. DB에서 저장된 결제 요청 정보 조회 (orderId로 조회)
        PaymentVO payment = dao.getPaymentByOrderId(approvalDTO.getOrderId());
        System.out.println("************* payment : "+payment);

        if (payment == null) {
            throw new RuntimeException("해당 주문 ID의 결제 정보가 존재하지 않습니다.");
        }

        // 2. DB에 저장된 금액과 Toss에서 받은 금액이 일치하는지 확인
        if (payment.getAmount() != approvalDTO.getAmount()) {
            throw new RuntimeException("결제 금액이 일치하지 않습니다.");
        }

        // 3. Toss Payments에 결제 승인 요청
        // 변수선언
        String paymentKey = approvalDTO.getPaymentKey();
        String orderId = approvalDTO.getOrderId();
        int amount = approvalDTO.getAmount();

        // Toss Payments API로 승인 요청
        String apiUrl = "https://api.tosspayments.com/v1/payments/confirm";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        // secretKey + ":" 을 인코딩
        String auth = secretKey + ":";
        String encodedAuth = Base64.getEncoder().encodeToString(auth.getBytes(StandardCharsets.UTF_8));
        headers.set("Authorization", "Basic " + encodedAuth);

        // 승인 요청 데이터
        Map<String, Object> requestData = new HashMap<>();
        requestData.put("paymentKey", paymentKey);
        requestData.put("orderId",orderId);
        requestData.put("amount", amount);

        HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestData, headers);
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<PaymentResDTO> response = restTemplate.postForEntity(apiUrl, requestEntity, PaymentResDTO.class);

        if (response.getStatusCode() == HttpStatus.OK) {
            // Toss API에서 받은 결제 정보
            PaymentResDTO responseData = response.getBody();
            log.info("%%%%%%%%%%%%%%%%%%%%%%%%responseData : {}",responseData);
            payment.setPaytype(responseData.getMethod());
            payment.setOrdername(responseData.getOrderName());
            payment.setPaymentKey(approvalDTO.getPaymentKey());
            // 4. 결제 승인 성공 처리
            dao.updatePaymentSuccess(payment);
        } else {
            throw new RuntimeException("결제 승인 실패: " + response.getBody());
        }
    }

    @Override
    public void handleFailure(String orderId, String errorCode, String errorMessage) {
        PaymentVO payment = dao.getPaymentByOrderId(orderId);
        payment.setFailReason(errorMessage);  // 실패 이유 저장
        payment.setSuccessYN(0);  // 실패로 처리
        dao.updatePaymentFailure(payment);
    }


}
