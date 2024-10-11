package com.ict.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EventController {
	    @GetMapping("/Event")
    public String aniList() {
        // 애니리스트
        return "ani/Event";
    }
}
