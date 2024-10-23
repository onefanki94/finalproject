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
        String token = request.getHeader("Authorization");
        if (token != null && token.startsWith("Bearer ")) {
            token = token.substring(7);
            if (jwtUtil.validateToken(token)) {
                // 토큰이 유효한 경우 SecurityContext 설정
                Authentication auth = jwtUtil.getAuthentication(token);
                SecurityContextHolder.getContext().setAuthentication(auth);
            }
        }
        filterChain.doFilter(request, response);
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
