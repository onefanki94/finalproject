package com.ict.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class cummunityController {
    @GetMapping("/cmList")

    public String cummunity(){
        return "community/cmList";
    }
}
