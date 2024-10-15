package com.ict.finalproject.DAO;

import com.ict.finalproject.DTO.PaymentReqDTO;
import com.ict.finalproject.vo.OrderListVO;
import com.ict.finalproject.vo.OrderVO;
import com.ict.finalproject.vo.PaymentVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface OrderDAO {
    void insertOrder(OrderVO order);
    void insertOrderList(OrderListVO orderList);

    OrderVO selectOrderById(int order_idx);
    List<OrderListVO> selectOrderListByOrderIdx(int order_idx);

    void insertPaymentRequest(PaymentReqDTO paymentRequest);
    void updateOrderRequest(PaymentReqDTO paymentRequest);

    // orderId로 결제 정보 조회
    PaymentVO getPaymentByOrderId(String orderId);

    // 결제 성공 업데이트
    void updatePaymentSuccess(PaymentVO payment);

    // 결제 실패
    void updatePaymentFailure(PaymentVO payment);
}
