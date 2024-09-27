package com.ict.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/store")
@Controller
public class storeMainController {
     @GetMapping("/storeMain")
 public String storeMain() {
     return "store/storeMain";
 }
}
