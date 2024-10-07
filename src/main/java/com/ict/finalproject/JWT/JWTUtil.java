package com.ict.finalproject.JWT;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
public class JWTUtil {
    private SecretKey secretKey;

    public JWTUtil(@Value("${spring.jwt.secret}") String secret) {
        System.out.println("JWT Secret: " + secret); // secret 값 출력
        this.secretKey = Keys.hmacShaKeyFor(secret.getBytes(StandardCharsets.UTF_8));
    }

    // JWT 토큰에서 Claims를 추출하는 메서드
    public Jws<Claims> getClaims(String token) {
        return Jwts.parser()
                .setSigningKey(secretKey)
                .build()
                .parseClaimsJws(token);
    }

    public String getUserid(String token) {
        return getClaims(token).getBody().get("userid", String.class);
    }

    public int getIdx(String token) {
        return getClaims(token).getBody().get("idx", Integer.class); // idx 추출
    }

    public Boolean isExpired(String token) {
        return getClaims(token).getBody().getExpiration().before(new Date());
    }

    // JWT 생성 메서드 (idx 포함)
    public String createJwt(String userid, int idx, Long expiredMs) {
        return Jwts.builder()
                .claim("userid", userid) // 사용자 ID 설정
                .claim("idx", idx) // idx 정보 설정
                .setIssuedAt(new Date(System.currentTimeMillis())) // 발행 시간 설정
                .setExpiration(new Date(System.currentTimeMillis() + expiredMs)) // 만료 시간 설정
                .signWith(secretKey) // 서명 설정
                .compact();
    }

    // JWT 유효성 검사 메서드
    public boolean validateToken(String token) {
        try {
            getClaims(token); // 유효성을 검사하기 위해 Claims를 가져옴
            return true; // 유효한 경우 true 반환
        } catch (JwtException e) {
            return false; // 유효하지 않은 경우 false 반환
        }
    }

    // JWT 토큰에서 권한 정보를 추출하여 Spring Security의 Authentication 객체에 설정
    public void authenticateWithJwt(String token) {
        String userid = getUserid(token); // JWT 토큰에서 사용자 ID 추출
        int idx = getIdx(token); // JWT 토큰에서 idx 추출

        // Spring Security의 Authentication 객체 생성
        UsernamePasswordAuthenticationToken authentication =
                new UsernamePasswordAuthenticationToken(userid, null, new ArrayList<>()); // 비어 있는 권한 리스트

        // SecurityContextHolder에 설정
        SecurityContextHolder.getContext().setAuthentication(authentication);
    }
}
