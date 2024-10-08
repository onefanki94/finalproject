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
                boolean isAdmin = tAdminDAO.existsById(userId);

                if (!isAdmin) {
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "관리자 권한 필요");
                    return;
                }
            } else {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "유효하지 않은 토큰");
                return;
            }
        }

        filterChain.doFilter(request, response);
    }
}