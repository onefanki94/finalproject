package com.ict.finalproject.JWT;


import com.ict.finalproject.DTO.CustomUserDetails;
import com.ict.finalproject.vo.MemberVO;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Collections;

public class JWTFilter extends OncePerRequestFilter {

    private final JWTUtil jwtUtil;

    public JWTFilter(JWTUtil jwtUtil) {

        this.jwtUtil = jwtUtil;
    }


    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        // request에서 Authorization 헤더를 찾음
        String authorization = request.getHeader("Authorization");

        // Authorization 헤더 검증
        if (authorization == null || !authorization.startsWith("Bearer ")) {
            System.out.println("Authorization 헤더가 없거나 유효하지 않습니다. 헤더 값: " + authorization);
            filterChain.doFilter(request, response);
            return;
        }

        // 토큰 파싱 (Bearer 접두어 제거)
        String token = authorization.split(" ")[1];

        // 토큰 유효성 검증
        if (jwtUtil.isExpired(token)) {
            System.out.println("만료된 토큰");
            filterChain.doFilter(request, response);
            return;
        }

        // 토큰으로부터 사용자 ID 및 권한 정보 추출
        String userid = jwtUtil.getUserid(token);
        String userRole = jwtUtil.getUserRole(token);

        // 사용자 인증 설정
        UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(userid, null, Collections.singletonList(new SimpleGrantedAuthority(userRole)));
        SecurityContextHolder.getContext().setAuthentication(authToken);

        // 요청 처리 계속 진행
        filterChain.doFilter(request, response);
    }
}
