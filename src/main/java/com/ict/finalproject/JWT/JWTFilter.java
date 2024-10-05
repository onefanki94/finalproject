package com.ict.finalproject.JWT;


import com.ict.finalproject.DTO.CustomUserDetails;
import com.ict.finalproject.vo.MemberVO;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
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
        String authorization = request.getHeader("Authorization");
        if (authorization == null || !authorization.startsWith("Bearer ")) {
            filterChain.doFilter(request, response);
            return;
        }

        // JWT 토큰 파싱 및 검증
        String token = authorization.substring(7);

        if (!jwtUtil.isExpired(token)) {
            // JWT 토큰을 사용하여 사용자 인증 정보 설정
            authenticateWithJwt(token);
        }

        // 사용자 정보 및 권한 설정
        String userid = jwtUtil.getUserid(token);
        List<GrantedAuthority> authorities = jwtUtil.getAuthorities(token);  // 권한 정보 가져오기

        // SecurityContext에 인증 정보 설정
        UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(userid, null, authorities);
        SecurityContextHolder.getContext().setAuthentication(authToken);
        System.out.println("SecurityContext 권한 정보: " + SecurityContextHolder.getContext().getAuthentication().getAuthorities());

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
}
