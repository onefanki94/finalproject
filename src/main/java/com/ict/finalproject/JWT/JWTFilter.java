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
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

public class JWTFilter extends OncePerRequestFilter {

    private final JWTUtil jwtUtil;

    public JWTFilter(JWTUtil jwtUtil) {
        this.jwtUtil = jwtUtil;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        String authorizationHeader = request.getHeader("Authorization");

        // Authorization 헤더가 없거나 잘못된 형식일 경우
        if (authorizationHeader == null || !authorizationHeader.startsWith("Bearer ")) {
            filterChain.doFilter(request, response);
            return; // 필터 체인 통과
        }

        String token = authorizationHeader.substring(7);

        // 토큰의 유효성 검증
        if (jwtUtil.isExpired(token)) {
            filterChain.doFilter(request, response);
            return; // 필터 체인 통과
        }

        // 사용자 ID 및 idx 추출
        String userid = jwtUtil.getUserid(token); // Get the user ID from the token
        int idx = jwtUtil.getIdx(token); // Get the idx from the token

// Create a new MemberVO instance using the constructor
        MemberVO memberVO = new MemberVO(idx, userid, "temppassword", null, null, null, null, null, null); // Fill the other parameters with null or appropriate values

// Create CustomUserDetails with the MemberVO instance
        CustomUserDetails customUserDetails = new CustomUserDetails(memberVO);

        // Spring Security의 Authentication 객체 생성
        UsernamePasswordAuthenticationToken authentication =
                new UsernamePasswordAuthenticationToken(customUserDetails, null, customUserDetails.getAuthorities());

        // 인증 정보 설정
        SecurityContextHolder.getContext().setAuthentication(authentication);

        // 로그 출력 (설정된 인증 정보 확인)
        System.out.println("SecurityContextHolder에 설정된 인증 정보: " + SecurityContextHolder.getContext().getAuthentication());

        filterChain.doFilter(request, response);
    }
}
