package com.ict.finalproject;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class HomeController {
 @GetMapping("/")
    public String Home() {
        // 홈
        return "home";
    }
    @GetMapping("/api/protected-endpoint")
    public ResponseEntity<String> protectedEndpoint(HttpServletRequest request) {
        String authorizationHeader = request.getHeader("Authorization");
        System.out.println("Authorization 헤더 값: " + authorizationHeader);

        if (authorizationHeader == null || !authorizationHeader.startsWith("Bearer ")) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Authorization 헤더가 없습니다.");
        }

        return ResponseEntity.ok("Authorization 헤더가 정상적으로 전달되었습니다.");
    }
}
