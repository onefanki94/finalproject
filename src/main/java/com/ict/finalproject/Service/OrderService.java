package com.ict.finalproject.Service;

import com.ict.finalproject.DTO.PaymentApprovalDTO;
import com.ict.finalproject.DTO.PaymentReqDTO;
import com.ict.finalproject.vo.OrderListVO;
import com.ict.finalproject.vo.OrderVO;
import com.ict.finalproject.vo.PaymentVO;

import java.util.List;

public interface OrderService {
    // 주문정보 저장 service
    int createOrder(int useridx, int total_price);
    void addProductToOrderList(int order_idx, int pro_idx, int amount);

    // 주문정보 뿌려주는 service -> 주문서에서 사용
    OrderVO getOrderById(int order_idx);
    List<OrderListVO> getOrderListByOrderIdx(int order_idx);

    // 결제 요청정보 DB에 저장 service
    void savePaymentRequest(PaymentReqDTO paymentRequest);
    void saveOrderRequest(PaymentReqDTO paymentRequest);

    // 결제 승인요청
    int approvePayment(PaymentApprovalDTO approvalDTO);

    // 성공시 success페이지에 뿌려줄 데이터들
    OrderVO orderSuccessData(int order_idx);
    List<OrderListVO> orderListSuccessData(int order_idx);
    PaymentVO paymentSuccessData(int order_idx);
    
    // 결제 실패
    public void handleFailure(String orderId, String code, String message);

}
