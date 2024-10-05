package com.ict.finalproject.JWT;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

@Component
public class JWTUtil {
    private JWTUtil jwtUtil;
    private SecretKey secretKey;

    public JWTUtil(@Value("${spring.jwt.secret}") String secret) {

        System.out.println("JWT Secret: " + secret); // secret 값 출력
        this.secretKey = Keys.hmacShaKeyFor(secret.getBytes(StandardCharsets.UTF_8));
    }

    public List<GrantedAuthority> getAuthorities(String token) {
        Jws<Claims> claims = getClaims(token);  // JWT 토큰의 Claims 추출

        if (claims == null) {
            return new ArrayList<>();
        }

        String role = claims.getBody().get("role", String.class);
        System.out.println("JWT 토큰의 권한 정보: " + role);  // 권한 정보 로그 출력

        if (role == null) {
            return new ArrayList<>();
        }

        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(role));  // 권한 정보를 GrantedAuthority로 변환하여 반환
        return authorities;
    }

    // JWT 토큰에서 Claims를 추출하는 메서드
    public Jws<Claims> getClaims(String token) {
        return Jwts.parser()
                .setSigningKey(secretKey.getEncoded())
                .build().parseClaimsJws(token);
    }

    public String getUserid(String token) {

        return getClaims(token).getBody().get("userid", String.class);
    }



    public Boolean isExpired(String token) {

        return getClaims(token).getBody().getExpiration().before(new Date());
    }


    // JWT 생성 메서드 예시
    public String createJwt(String userid, String role, Long expiredMs) {
        return Jwts.builder()
                .claim("userid", userid)
                .claim("role", role)  // role 정보 설정
                .setIssuedAt(new Date(System.currentTimeMillis()))  // 발행 시간 설정
                .setExpiration(new Date(System.currentTimeMillis() + expiredMs))  // 만료 시간 설정
                .signWith(secretKey)  // 서명 설정
                .compact();
    }

    // JWT 토큰에서 권한 정보를 추출하여 Spring Security의 Authentication 객체에 설정
    public void authenticateWithJwt(String token) {
        String userid = jwtUtil.getUserid(token);  // JWT 토큰에서 사용자 ID 추출
        List<GrantedAuthority> authorities = jwtUtil.getAuthorities(token);  // JWT 토큰에서 권한 추출

        // Spring Security의 Authentication 객체 생성
        UsernamePasswordAuthenticationToken authentication =
                new UsernamePasswordAuthenticationToken(userid, null, authorities);

        // SecurityContextHolder에 설정
        SecurityContextHolder.getContext().setAuthentication(authentication);
    }

    public String getRoleFromToken(String token) {
        return getClaims(token).getBody().get("role", String.class);
    }
}
