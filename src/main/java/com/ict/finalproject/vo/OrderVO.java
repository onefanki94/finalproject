package com.ict.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderVO {
    private int idx;
    private int useridx;
    private int total_price;
    private String regDT;
    private int cancelState;
    private String cancelDT;
    private int payState;
    private String recipient;
    private String zipcode;
    private String addr;
    private String addrdetail;
    private String tel;
    private String request_memo;
    private int use_point;
    private String token;
    private int user_point;//사용자의 현재 가진 포인트->주문서 페이지에서 사용

    // 매개변수가 있는 생성자
    public OrderVO(int useridx, int total_price) {
        this.useridx = useridx;
        this.total_price= total_price;
    }
}
