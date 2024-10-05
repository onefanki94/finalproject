package com.ict.finalproject.JWT;


import com.ict.finalproject.DTO.CustomUserDetails;
import com.ict.finalproject.vo.MemberVO;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class JWTFilter extends OncePerRequestFilter {

    private final JWTUtil jwtUtil;

    public JWTFilter(JWTUtil jwtUtil) {

        this.jwtUtil = jwtUtil;
    }


    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        String authorizationHeader = request.getHeader("Authorization");

        if (authorizationHeader == null || !authorizationHeader.startsWith("Bearer ")) {
            filterChain.doFilter(request, response);
            return;
        }

        String token = authorizationHeader.substring(7);

        // 토큰의 유효성 검증
        if (jwtUtil.isExpired(token)) {
            filterChain.doFilter(request, response);
            return;
        }

        // 사용자 ID 및 권한 추출
        String userid = jwtUtil.getUserid(token);
        List<GrantedAuthority> authorities = jwtUtil.getAuthorities(token);

        // Spring Security의 Authentication 객체 생성
        UsernamePasswordAuthenticationToken authentication =
                new UsernamePasswordAuthenticationToken(userid, null, authorities);

        // 인증 정보 설정
        SecurityContextHolder.getContext().setAuthentication(authentication);

        // 로그 출력 (설정된 인증 정보 확인)
        System.out.println("SecurityContextHolder에 설정된 인증 정보: " + SecurityContextHolder.getContext().getAuthentication());

        filterChain.doFilter(request, response);
    }

    private void authenticateWithJwt(String token) {
        String userid = jwtUtil.getUserid(token);  // JWT 토큰에서 사용자 ID 추출
        List<GrantedAuthority> authorities = jwtUtil.getAuthorities(token);  // JWT 토큰에서 권한 추출

        // Spring Security의 Authentication 객체 생성
        UsernamePasswordAuthenticationToken authentication =
                new UsernamePasswordAuthenticationToken(userid, null, authorities);

        // SecurityContextHolder에 설정
        SecurityContextHolder.getContext().setAuthentication(authentication);
    }

    public List<GrantedAuthority> getAuthorities(String token) {
        Jws<Claims> claims = jwtUtil.getClaims(token);
        String role = claims.getBody().get("role", String.class);  // role 정보를 가져옴
        List<GrantedAuthority> authorities = new ArrayList<>();
        if (role != null) {
            authorities.add(new SimpleGrantedAuthority(role));  // 권한 설정
        }
        return authorities;
    }

}
