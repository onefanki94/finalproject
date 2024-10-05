package com.ict.finalproject.controller;

import com.ict.finalproject.JWT.JWTUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



//@RequestMapping("/community")
@Controller
public class cummunityController {

    @Autowired
    JWTUtil jwtUtil;

//    ModelAndView mav = null;
    @GetMapping("/cmList")
    public String cmList(){
    //public String cmList(@RequestParam("Authorization")String token){
        System.out.println("hi");
        //String userid = jwtUtil.getUserid("eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyaWQiOiJ0ZXN0dGVzdDEyMzQiLCJyb2xlIjoiUk9MRV9VU0VSIiwiaWF0IjoxNzI4MTEwODQ2LCJleHAiOjE3Mjg3MTU2NDZ9.WacozPBGXKH6DOxMN4ycDbK58EUsqLhhoOywZAeLRhY");
        //String userid = jwtUtil.getUserid(token);
        //System.out.println(userid);
        return "community/cmList";
    }
    @ResponseBody
    @GetMapping("/getuser")
    public String getuser(@RequestParam("Authorization")String token){
        System.out.println("hi2");
        String userid = jwtUtil.getUserid(token);
        System.out.println("userid : " + userid);
        return userid;
    }

    //글등록폼
    @GetMapping("/cmWrite")
    public String cmwrite(){

//        mav = new ModelAndView();
//        mav.setViewName("community/cmWrite");
        return "community/cmWrite";
    }

    //상세페이지
    @GetMapping("/cmView")
    public String cmView(){
        return "community/cmView";
    }

    //커뮤니티-공지사항 이동
    @GetMapping("/allnotice")
    public String allnotice(){
        return "notice/notice2";
    }
}
