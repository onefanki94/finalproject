package com.ict.finalproject.DAO;

import com.ict.finalproject.vo.OrderListVO;
import com.ict.finalproject.vo.OrderVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderDAO {
    void insertOrder(OrderVO order);
    void insertOrderList(OrderListVO orderList);

    OrderVO selectOrderById(int order_idx);
    List<OrderListVO> selectOrderListByOrderIdx(int order_idx);
}
