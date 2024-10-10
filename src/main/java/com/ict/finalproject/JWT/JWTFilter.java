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
        String token = jwtUtil.resolveToken(request);

        // JWT 토큰 검증을 임시로 생략
        if (token != null) {
            // 모든 사용자에게 인증 정보 설정
            UsernamePasswordAuthenticationToken authentication =
                    new UsernamePasswordAuthenticationToken("temporaryUser", null, Collections.emptyList());
            SecurityContextHolder.getContext().setAuthentication(authentication);
            System.out.println("임시로 모든 사용자에게 접근 허용");
        }

        // 다음 필터로 요청 전달
        filterChain.doFilter(request, response);
    }

    // 관리자 페이지 접근을 허용할 사용자 ID 확인 로직
    private boolean isAdminUser(String userid) {
        // 여기에 관리자 페이지 접근을 허용할 사용자 ID를 확인하는 로직을 구현
        // 예: 특정 ID가 존재하는지 확인하거나 t_admin 테이블에서 조회
        return "adminUser".equals(userid);  // 예: "adminUser"만 관리자 페이지 접근 가능
    }
}