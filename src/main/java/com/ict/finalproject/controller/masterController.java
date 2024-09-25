package com.ict.finalproject.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class masterController {

        @GetMapping("/masterMain")
        public String masterMain(){
            return "master/masterMain";
        }
}
