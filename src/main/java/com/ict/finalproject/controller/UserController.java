package com.ict.finalproject.controller;

import com.ict.finalproject.DTO.LoginRequestDTO;
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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
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

    @GetMapping("/checkAuthentication")
    public ResponseEntity<String> checkAuthentication() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated() || "anonymousUser".equals(authentication.getName())) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("인증되지 않은 사용자입니다.");
        } else {
            return ResponseEntity.ok("인증된 사용자 ID: " + authentication.getName());
        }
    }

    @GetMapping("/userinfo")
    public String getUserInfo(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication == null || !authentication.isAuthenticated()) {
            System.out.println("인증되지 않은 사용자.");
            return null;
        }

        String userid = authentication.getName();
        System.out.println("인증된 사용자 ID: " + userid);

        if ("anonymousUser".equals(userid)) {
            System.out.println("등록된 사용자 없음");
            return null;
        } else {
            System.out.println("사용자 ID: " + userid);
            return userid;
        }
    }


    @PostMapping("/loginOk")
    public ModelAndView loginOk(@ModelAttribute LoginRequestDTO loginRequest, HttpServletRequest request, HttpServletResponse response) {
        // ModelAndView 객체 초기화
        ModelAndView mav = new ModelAndView();

        // 클라이언트에서 전달받은 로그인 정보
        String userid = loginRequest.getUserid();
        String userpwd = loginRequest.getUserpwd();

        // 회원 정보 검증: 데이터베이스에서 사용자 정보 조회
        MemberVO member = service.memberLogin(userid, userpwd);
        if (member == null) {
            // 사용자 정보가 없으면 로그인 실패로 간주하고 로그인 페이지로 리다이렉트
            mav.setViewName("redirect:/user/login");
            return mav;
        }

        // 비밀번호 검증
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        if (!passwordEncoder.matches(userpwd, member.getUserpwd())) {
            // 비밀번호가 일치하지 않을 경우 로그인 페이지로 리다이렉트
            mav.setViewName("redirect:/user/login");
            return mav;
        }

        // JWT 토큰 생성 (7일 동안 유효)
        String token = jwtUtil.createJwt(userid, 604800000L);  // role 대신 userid만 사용하여 토큰 생성

        // JWT 토큰을 HTTP 응답 헤더에 추가
        response.setHeader("Authorization", "Bearer " + token);

        // 로그 출력
        log.info("로그인 성공: " + userid);
        log.info("응답 헤더에 설정된 토큰 값: " + response.getHeader("Authorization"));

        // JWT 토큰을 ModelAndView 객체에 추가
        mav.addObject("token", token);
        mav.addObject("userid", userid);

        // 메인 페이지로 리다이렉트
        mav.setViewName("redirect:/");
        return mav;
    }


    //회원가입 페이지 view
    @GetMapping("/join")
    public ModelAndView joinPage(){
        mav = new ModelAndView();
        mav.setViewName("join/join");
        return mav;
    }

    @PostMapping("/joinformOk")
    public ModelAndView joinOk(HttpServletRequest request, @RequestParam String userid, @RequestParam String userpwd, @RequestParam String username, @RequestParam String email) {
        // ModelAndView 객체 초기화
        ModelAndView mav = new ModelAndView();

        try {
            // 비밀번호 암호화를 위한 PasswordEncoder 생성
            PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

            // 회원 정보 객체 생성 및 설정
            MemberVO vo = new MemberVO();
            vo.setUserid(userid);
            vo.setUserpwd(passwordEncoder.encode(userpwd));  // 비밀번호 암호화
            vo.setUsername(username);
            vo.setEmail(email);

            // 회원 정보 생성 (데이터베이스에 사용자 추가)
            int resultMember = service.memberCreate(vo);

            if (resultMember == 1) {
                // 회원가입 성공 시 JWT 토큰 생성 (1시간 동안 유효)
                String token = jwtUtil.createJwt(userid, 3600000L);  // role 제거, userid만 사용

                // 세션에 JWT 토큰 저장
                request.getSession().setAttribute("token", token);

                // 로그인 페이지로 리다이렉트
                mav.setViewName("redirect:/user/login");
            } else {
                // 회원가입 실패 시 회원가입 페이지로 리다이렉트
                mav.setViewName("redirect:/user/join");
                mav.addObject("errorMessage", "회원가입에 실패하였습니다. 다시 시도해 주세요.");
            }
        } catch (Exception e) {
            // 오류 발생 시 회원가입 페이지로 리다이렉트 및 오류 메시지 추가
            log.error("회원가입 중 오류 발생: " + e.getMessage());
            mav.setViewName("redirect:/user/join");
            mav.addObject("errorMessage", "회원가입 중 오류가 발생하였습니다.");
        }

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

    //마이페이지-문의리스트 view
    @GetMapping("/mypage_qna")
    public ModelAndView mypageQna(){
        mav = new ModelAndView();
        mav.setViewName("mypage/mypage_qna");

        return mav;
    }

    //마이페이지-회원정보수정 view
    @GetMapping("/mypage_userEdit")
    public ModelAndView mypageEdit(){
        mav = new ModelAndView();
        mav.setViewName("mypage/mypage_userEdit");

        return mav;
    }

    //마이페이지-회원탈퇴 view
    @GetMapping("/mypage_userDel")
    public ModelAndView mypageDel(){
        mav = new ModelAndView();
        mav.setViewName("mypage/mypage_userDel");

        return mav;
    }
}
