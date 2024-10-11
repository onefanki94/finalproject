package com.ict.finalproject.JWT;

import com.ict.finalproject.DAO.TAdminDAO;
import com.ict.finalproject.Service.TAdminService;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.List;

/*
public class AdminFilter extends OncePerRequestFilter {

    private final TAdminService tAdminService;
    private final JWTUtil jwtUtil;

    public AdminFilter(TAdminService tAdminService, JWTUtil jwtUtil) {
        this.tAdminService = tAdminService;
        this.jwtUtil = jwtUtil;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        String token = getTokenFromRequest(request);

        // JWT 토큰이 유효한 경우에만 처리
        if (token != null && jwtUtil.validateToken(token)) {
            // JWT에서 사용자 ID(adminid) 추출
            String adminid = jwtUtil.getUserIdFromToken(token);
            System.out.println("JWT에서 추출한 adminid: " + adminid);

            // adminid가 t_admin 테이블에 존재하는지 확인
            if (tAdminService.existsByAdminId(adminid)) {
                System.out.println("t_admin 테이블에 존재하는 adminid: " + adminid);

                // JWT 토큰에서 GrantedAuthority 리스트 생성
                List<GrantedAuthority> authorities = jwtUtil.getAuthorities(token);
                System.out.println("GrantedAuthority 리스트: " + authorities);

                // SecurityContextHolder에 인증 정보 설정
                UsernamePasswordAuthenticationToken authentication =
                        new UsernamePasswordAuthenticationToken(adminid, null, authorities);
                SecurityContextHolder.getContext().setAuthentication(authentication);
                System.out.println("SecurityContextHolder에 인증 정보 설정 완료: " + adminid);
            } else {
                System.out.println("t_admin 테이블에 adminid가 존재하지 않습니다: " + adminid);
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "관리자 권한이 필요합니다.");
                return;
            }
        }

        filterChain.doFilter(request, response);  // 다음 필터로 요청 전달
    }

    private String getTokenFromRequest(HttpServletRequest request) {
        String bearerToken = request.getHeader("Authorization");
        if (bearerToken != null && bearerToken.startsWith("Bearer ")) {
            return bearerToken.substring(7);
        }
        return null;
    }
}*/
