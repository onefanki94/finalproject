package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.OrderDAO;
import com.ict.finalproject.vo.OrderListVO;
import com.ict.finalproject.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{
    @Autowired
    OrderDAO dao;

    @Override
    public int createOrder(int useridx, int total_price) {
        OrderVO order = new OrderVO(useridx, total_price);
        dao.insertOrder(order);
        return order.getIdx();  // 자동 증가된 order_idx 반환
    }

    @Override
    public void addProductToOrderList(int order_idx, int pro_idx) {
        OrderListVO orderList = new OrderListVO(order_idx, pro_idx);
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
}
