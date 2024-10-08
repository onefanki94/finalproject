package com.ict.finalproject.JWT;

import com.ict.finalproject.DAO.TAdminDAO;
import com.ict.finalproject.Service.TAdminService;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

public class AdminFilter extends OncePerRequestFilter {

    private final TAdminDAO tAdminDAO;
    private final JWTUtil jwtUtil;

    public AdminFilter(TAdminDAO tAdminDAO, JWTUtil jwtUtil) {
        this.tAdminDAO = tAdminDAO;
        this.jwtUtil = jwtUtil;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        String requestURI = request.getRequestURI();

        // /master/** 경로에 대해서만 필터링
        if (requestURI.startsWith("/master/")) {
            String token = jwtUtil.resolveToken(request);

            if (token != null && jwtUtil.validateToken(token)) {
                String userId = jwtUtil.getUserIdFromToken(token);

                // t_admin 테이블의 "admin" 아이디만 접근 허용
                if (!"admin".equals(userId)) {
                    // admin 아이디가 아니면 접근 차단
                    response.sendError(HttpServletResponse.SC_FORBIDDEN, "관리자 권한이 필요합니다.");
                    return;
                }
            } else {
                // 유효하지 않은 토큰 또는 토큰이 없을 경우 접근 차단
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "유효하지 않은 토큰입니다.");
                return;
            }
        }

        // 다음 필터로 요청 전달
        filterChain.doFilter(request, response);
    }
}