package com.ict.finalproject.JWT;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.util.Date;

@Component
public class JWTUtil {

    private SecretKey secretKey;

    public JWTUtil(@Value("${spring.jwt.secret}") String secret) {

        System.out.println("JWT Secret: " + secret); // secret 값 출력
        this.secretKey = Keys.hmacShaKeyFor(secret.getBytes());
    }

    public String getUserid(String token) {

        return Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token).getPayload().get("userid", String.class);
    }

    public String getUserRole(String token) {

        return Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token).getPayload().get("role", String.class);
    }

    public Boolean isExpired(String token) {

        return Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token).getPayload().getExpiration().before(new Date());
    }


    // JWT 생성 메서드 (비밀번호 제거, role 추가)
    public String createJwt(String userid, String role, Long expiredMs) {
        return Jwts.builder()
                .claim("userid", userid)
                .claim("role", role)  // 역할(role) 정보 추가
                .setIssuedAt(new Date(System.currentTimeMillis()))  // 토큰 발행 시간 설정
                .setExpiration(new Date(System.currentTimeMillis() + expiredMs))  // 만료 시간 설정
                .signWith(secretKey)  // 서명 방식 설정
                .compact();  // 토큰 생성
    }
}
