package com.ict.finalproject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class HomeController {
 @GetMapping("/")
    public String Home() {
        // 홈
        return "home";

    }
}
