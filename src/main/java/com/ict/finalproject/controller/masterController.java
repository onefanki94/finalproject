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

        //Dashboard - 회원관리 - 회원 목록 리스트
        @GetMapping("/userMasterList")
        public ModelAndView masterUserList(){
            mav = new ModelAndView();
            mav.setViewName("master/userMasterList");
            return mav;
        }

        // Dashboard - 애니관리 -  애니목록 리스트
        @GetMapping("/aniMasterList")
        public ModelAndView masterAniList(){
            mav = new ModelAndView();
            mav.setViewName("master/aniMasterList");
            return mav;
        }

        // Dashboard - 회원관리 - 신고계정목록 리스트
        @GetMapping("/reporinguserMasterList")
        public ModelAndView masterReportList(){
            mav = new ModelAndView();
            mav.setViewName("master/reportinguserMasterList");
            return mav;
        }

        // Dashboard - 애니관리 - 애니 목록 - 애니 추가
        @GetMapping("/aniAddMaster")
        public ModelAndView aniAddMaster(){
            mav = new ModelAndView();
            mav.setViewName("master/aniAddMaster");
            return mav;
        }

        // Dashboard - 굿즈관리 - 굿즈목록 리스트
        @GetMapping("/storeMasterList")
        public ModelAndView storeMasterList(){
            mav = new ModelAndView();
            mav.setViewName("master/storeMasterList");
            return mav;
        }

        // Dashboard - 주문관리 - 주문내역 리스트
        @GetMapping("/orderMasterList")
        public ModelAndView orderMasterList(){
            mav = new ModelAndView();
            mav.setViewName("master/orderMasterList");
            return mav;
        }
}
