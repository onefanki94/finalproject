package com.ict.finalproject.controller;

import com.ict.finalproject.JWT.JWTUtil;
import com.ict.finalproject.Service.RefreshTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/token")
public class TokenController {

    private final JWTUtil jwtUtil;
    private final RefreshTokenService refreshTokenService;

    @Autowired
    public TokenController(JWTUtil jwtUtil, RefreshTokenService refreshTokenService) {
        this.jwtUtil = jwtUtil;
        this.refreshTokenService = refreshTokenService;
    }

    // 로그인 시 액세스 토큰 및 리프레시 토큰 발급
    @PostMapping("/login")
    public Map<String, String> login(@RequestParam String userid) {
        // 액세스 토큰 및 리프레시 토큰 생성
        String accessToken = jwtUtil.createAccessToken(userid, 60 * 60 * 1000L);  // 액세스 토큰 1시간 유효
        String refreshToken = jwtUtil.createRefreshToken(userid);  // 리프레시 토큰 30일 유효

        // 리프레시 토큰을 데이터베이스에 저장
        refreshTokenService.saveRefreshToken(userid, refreshToken, new Date(System.currentTimeMillis() + 30L * 24 * 60 * 60 * 1000).toString());

        // 토큰을 JSON 형태로 응답
        Map<String, String> tokens = new HashMap<>();
        tokens.put("accessToken", accessToken);
        tokens.put("refreshToken", refreshToken);

        return tokens;
    }

    // 리프레시 토큰을 사용해 새로운 액세스 토큰 발급
    @PostMapping("/refresh")
    public Map<String, String> refreshAccessToken(@RequestHeader("Authorization") String refreshToken) {
        // Authorization 헤더에서 "Bearer " 제거
        if (refreshToken.startsWith("Bearer ")) {
            refreshToken = refreshToken.substring(7);
        }

        // 리프레시 토큰 유효성 검사 및 사용자 ID 추출
        if (jwtUtil.validateToken(refreshToken)) {
            String userid = jwtUtil.getUserIdFromToken(refreshToken);

            // DB에 저장된 리프레시 토큰과 일치하는지 확인
            String storedRefreshToken = refreshTokenService.getRefreshTokenByUserId(userid);

            if (storedRefreshToken != null && storedRefreshToken.equals(refreshToken)) {
                // 새로운 액세스 토큰 발급
                String newAccessToken = jwtUtil.createAccessToken(userid, 60 * 60 * 1000L);  // 액세스 토큰 1시간 유효

                Map<String, String> tokens = new HashMap<>();
                tokens.put("accessToken", newAccessToken);

                return tokens;
            }
        }

        throw new RuntimeException("리프레시 토큰이 유효하지 않거나 만료되었습니다.");
    }
}
