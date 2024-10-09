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
        String requestURI = request.getRequestURI();

        // /master/** 경로에 대해서만 JWT 인증 필터링 적용
        if (requestURI.startsWith("/master/")) {
            String token = jwtUtil.resolveToken(request);

            if (token != null && jwtUtil.validateToken(token)) {
                // JWT 토큰에서 사용자 ID 및 권한 정보 추출
                String userid = jwtUtil.getUserIdFromToken(token);

                // t_admin 테이블의 특정 ID만 관리자 페이지 접근 가능
                if (isAdminUser(userid)) {
                    List<GrantedAuthority> authorities = jwtUtil.getAuthorities(token);

                    UsernamePasswordAuthenticationToken authentication =
                            new UsernamePasswordAuthenticationToken(userid, null, authorities);
                    authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

                    // SecurityContextHolder에 인증 정보 설정
                    SecurityContextHolder.getContext().setAuthentication(authentication);
                } else {
                    response.sendError(HttpServletResponse.SC_FORBIDDEN, "관리자 권한이 필요합니다.");
                    return;
                }
            } else {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "유효하지 않은 토큰입니다.");
                return;
            }
        }

        // /master/** 경로가 아닌 요청은 필터링하지 않음 (모든 사용자가 접근 가능)
        filterChain.doFilter(request, response);
    }

    // 관리자 페이지 접근을 허용할 사용자 ID 확인 로직
    private boolean isAdminUser(String userid) {
        // 여기에 관리자 페이지 접근을 허용할 사용자 ID를 확인하는 로직을 구현
        // 예: 특정 ID가 존재하는지 확인하거나 t_admin 테이블에서 조회
        return "adminUser".equals(userid);  // 예: "adminUser"만 관리자 페이지 접근 가능
    }
}