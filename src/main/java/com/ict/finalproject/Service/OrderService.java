package com.ict.finalproject.Service;

import com.ict.finalproject.vo.OrderListVO;
import com.ict.finalproject.vo.OrderVO;

import java.util.List;

public interface OrderService {
    int createOrder(int useridx, int total_price);
    void addProductToOrderList(int order_idx, int pro_idx);

    OrderVO getOrderById(int order_idx);
    List<OrderListVO> getOrderListByOrderIdx(int order_idx);
}
