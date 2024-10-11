package com.ict.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
    private int idx;
    private String userid;
    private String userpwd;
    private String username;
    private String tel;
    private String email;
    private String zipcode;
    private String addr;
    private String birth;
    private String point;
    private String regDT;
}
