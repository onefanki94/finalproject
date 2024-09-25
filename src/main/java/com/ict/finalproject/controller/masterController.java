package com.ict.finalproject.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
@RequestMapping("/master")
public class masterController {

        ModelAndView mav = null;

        // Dashboard 매핑
        @GetMapping("/masterMain")
        public ModelAndView masterMain(){
            mav = new ModelAndView();
            mav.setViewName("master/masterMain");
            return mav;
        }

        //Dashboard - 유저 목록 출력하기
        @GetMapping("/userMasterList")
        public ModelAndView masterUserList(){
            mav = new ModelAndView();
            mav.setViewName("master/userMasterList");
            return mav;
        }

        // Dashboard - aniList목록 출력하기
        @GetMapping("/aniMasterList")
        public ModelAndView masterAniList(){
            mav = new ModelAndView();
            mav.setViewName("master/aniMasterList");
            return mav;
        }
}
