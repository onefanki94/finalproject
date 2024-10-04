package com.ict.finalproject.controller;

import com.ict.finalproject.JWT.JWTUtil;
import com.ict.finalproject.Service.MemberService;
import com.ict.finalproject.vo.MemberVO;
import io.jsonwebtoken.ExpiredJwtException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/user")
@Slf4j
public class UserController {
    @Inject
    MemberService service;
    ModelAndView mav = null;
    @Autowired
    JWTUtil jwtUtil;

    //로그인 페이지 view
    @GetMapping("/login")
    public ModelAndView loginPage(){
        mav = new ModelAndView();
        mav.setViewName("join/login");
        return mav;
    }


    @PostMapping("/loginOk")
    @ResponseBody
    public ModelAndView loginOk(@RequestParam String userid, @RequestParam String userpwd) {
        ModelAndView mav = new ModelAndView();

        // 사용자 인증 (회원 검증)
        MemberVO member = service.memberLogin(userid, userpwd);

        if (member == null) {
            // 로그인 실패 시 로그인 페이지로 리다이렉트
            mav.setViewName("redirect:/user/login");
            mav.addObject("errorMessage", "Invalid credentials. Please try again.");  // 에러 메시지 전달
            return mav;
        }

        // JWT 토큰 생성
        String token = jwtUtil.createJwt(userid, "ROLE_USER", 3600000L);  // 토큰 만료 시간: 1시간

        // 로그인 성공 시 메인 페이지로 이동
        mav.setViewName("redirect:/");  //

        // 뷰에 사용자 정보와 토큰 전달
        mav.addObject("username", userid);  // 로그인 사용자 정보 전달
        mav.addObject("token", token);       // JWT 토큰 전달

        return mav;
    }



    //회원가입 페이지 view
    @GetMapping("/join")
    public ModelAndView joinPage(){
        mav = new ModelAndView();
        mav.setViewName("join/join");
        return mav;
    }

    // 회원가입 완료 폼
    @PostMapping("/joinformOk")
    public ModelAndView joinFormOk(MemberVO vo){
        int resultMember = 0;
        String Tag = "";
        log.info(vo.toString());
        mav = new ModelAndView();
        try{
            resultMember= service.memberCreate(vo);
            Tag += "<script>";
            Tag += "alert('회원가입 성공하였습니다.');";
            Tag += "location.href='/user/login';";
            Tag += "</script>";
        }catch (Exception e){
            Tag += "<script>";
            Tag += "alert('회원가입 실패하였습니다.');";
            Tag += "history.back();";
            Tag += "</script>";
        }
        mav.setViewName("redirect:/");
        return mav;
    }

    //마이페이지 view
    @GetMapping("/mypage")
    public ModelAndView mypage(){
        mav = new ModelAndView();
        mav.setViewName("mypage/mypage_main");

        return mav;
    }

    //마이페이지-좋아요 view
    @GetMapping("/mypage_heart")
    public ModelAndView mypageHeart(){
        mav = new ModelAndView();
        mav.setViewName("mypage/mypage_heart");

        return mav;
    }

    //마이페이지-주문리스트 view
    @GetMapping("/mypage_order")
    public ModelAndView mypageOrder(){
        mav = new ModelAndView();
        mav.setViewName("mypage/mypage_order");

        return mav;
    }

    //마이페이지-주문상세 view
    @GetMapping("/mypage_order_detail")
    public ModelAndView mypageOrderDetail(){
        mav = new ModelAndView();
        mav.setViewName("mypage/mypage_order_detail");

        return mav;
    }

    //마이페이지-적립금리스트 view
    @GetMapping("/mypage_point")
    public ModelAndView mypagePoint(){
        mav = new ModelAndView();
        mav.setViewName("mypage/mypage_point");

        return mav;
    }

    //마이페이지-리뷰리스트 view
    @GetMapping("/mypage_review")
    public ModelAndView mypageReview(){
        mav = new ModelAndView();
        mav.setViewName("mypage/mypage_review");

        return mav;
    }
}
