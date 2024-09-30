package com.ict.finalproject.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/user")
public class UserController {
    ModelAndView mav = null;

    @GetMapping("/login")
    public ModelAndView loginPage(){
        mav = new ModelAndView();
        mav.setViewName("join/login");

        return mav;
    }

    @GetMapping("/join")
    public ModelAndView joinPage(){
        mav = new ModelAndView();
        mav.setViewName("join/join");

        return mav;
    }
}
