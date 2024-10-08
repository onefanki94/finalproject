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

        // Authorization 헤더가 없거나, Bearer 토큰으로 시작하지 않는 경우 필터를 통과
        if (authorizationHeader == null || !authorizationHeader.startsWith("Bearer ")) {
            filterChain.doFilter(request, response);
            return;
        }

        // Authorization 헤더에서 JWT 토큰 추출
        String token = authorizationHeader.substring(7);

        // JWT 토큰이 만료된 경우 필터를 통과
        if (jwtUtil.isExpired(token)) {
            filterChain.doFilter(request, response);
            return;
        }

        // JWT 토큰에서 사용자 ID 추출
        String userid = jwtUtil.getUserIdFromToken(token);

        // Spring Security의 Authentication 객체 생성 (권한 리스트는 빈 리스트로 설정)
        UsernamePasswordAuthenticationToken authentication =
                new UsernamePasswordAuthenticationToken(userid, null, Collections.emptyList());

        // SecurityContextHolder에 인증 정보 설정
        SecurityContextHolder.getContext().setAuthentication(authentication);

        // 로그 출력 (설정된 인증 정보 확인)
        System.out.println("SecurityContextHolder에 설정된 인증 정보: " + SecurityContextHolder.getContext().getAuthentication());

        // 필터 체인을 통해 다음 필터로 요청 전달
        filterChain.doFilter(request, response);
    }
}
