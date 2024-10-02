package com.ict.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class noticeController {
    @GetMapping("/notice2")

    public String notice() {
        return "notice/notice2";
    }

    //상세페이지
//    @GetMapping("/noticeView")
//    public String cmView(){
//        return "notice/noticeView";
//    }
}
