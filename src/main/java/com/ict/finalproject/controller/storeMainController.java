package com.ict.finalproject.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class storeMainController {
     @GetMapping("/storeMain")
 public String storeMain() {
     return "store/storeMain";
 }
}
