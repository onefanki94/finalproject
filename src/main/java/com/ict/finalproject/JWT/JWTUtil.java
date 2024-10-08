package com.ict.finalproject.JWT;

import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
public class JWTUtil {

    private SecretKey secretKey;

    // 생성자에서 JWT SecretKey를 초기화
    public JWTUtil(@Value("${spring.jwt.secret}") String secret) {
        System.out.println("JWT Secret: " + secret); // secret 값 출력
        this.secretKey = Keys.hmacShaKeyFor(secret.getBytes(StandardCharsets.UTF_8));
    }

    // JWT 토큰에서 사용자 ID를 추출하는 메서드
    public String getUserIdFromToken(String token) {
        Jws<Claims> claims = getClaims(token);  // JWT 토큰에서 Claims 추출
        return claims != null ? claims.getBody().get("userid", String.class) : null;  // Claims에서 "userid" 키 값 추출
    }

    // JWT 토큰에서 Claims를 추출하는 메서드
    public Jws<Claims> getClaims(String token) {
        try {
            return Jwts.parser()
                    .setSigningKey(secretKey)
                    .build()
                    .parseClaimsJws(token);
        } catch (JwtException | IllegalArgumentException e) {
            System.out.println("JWT 토큰 파싱 오류: " + e.getMessage());
            return null;
        }
    }

    // JWT 토큰이 만료되었는지 확인하는 메서드
    public Boolean isExpired(String token) {
        Date expiration = getClaims(token).getBody().getExpiration();
        return expiration.before(new Date());
    }

    // JWT 토큰 생성 메서드 예시
    public String createJwt(String userid, Long expiredMs) {
        return Jwts.builder()
                .claim("userid", userid)  // 사용자 ID 정보를 Claim으로 추가
                .setIssuedAt(new Date(System.currentTimeMillis()))  // 발행 시간 설정
                .setExpiration(new Date(System.currentTimeMillis() + expiredMs))  // 만료 시간 설정
                .signWith(secretKey)  // 서명 설정
                .compact();
    }

    // JWT 토큰으로부터 사용자 ID를 추출하여 Spring Security의 Authentication 객체에 설정하는 메서드
    public void authenticateWithJwt(String token) {
        String userid = getUserIdFromToken(token);  // JWT 토큰에서 사용자 ID 추출

        // Spring Security의 Authentication 객체 생성 (권한은 비워둠)
        UsernamePasswordAuthenticationToken authentication =
                new UsernamePasswordAuthenticationToken(userid, null, new ArrayList<>());

        // SecurityContextHolder에 설정하여 SecurityContext에 인증 정보 저장
        SecurityContextHolder.getContext().setAuthentication(authentication);
    }

    // HTTP 요청 헤더에서 JWT 토큰을 추출하는 메서드
    public String resolveToken(HttpServletRequest request) {
        return request.getHeader("Authorization");
    }

    // JWT 토큰의 유효성을 검사하는 메서드
    public boolean validateToken(String token) {
        try {
            // 토큰을 파싱하여 서명 확인 및 유효성 검증
            Jws<Claims> claims = getClaims(token);
            return claims != null && !isExpired(token);  // 유효한 토큰이며 만료되지 않았는지 확인
        } catch (JwtException | IllegalArgumentException e) {
            System.out.println("JWT 유효성 검증 실패: " + e.getMessage());
            return false;
        }
    }
}