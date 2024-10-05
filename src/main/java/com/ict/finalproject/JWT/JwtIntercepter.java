package com.ict.finalproject.JWT;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;

public class JwtIntercepter implements HandlerInterceptor {

    private final JWTUtil jwtUtil;

    public JwtIntercepter(JWTUtil jwtUtil) {
        this.jwtUtil = jwtUtil;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String authorizationHeader = request.getHeader("Authorization");

        // Authorization 헤더가 없는 경우 요청을 차단
        if (authorizationHeader == null || !authorizationHeader.startsWith("Bearer ")) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);  // 401 Unauthorized 상태 코드 반환
            response.getWriter().write("Authorization 헤더가 없습니다.");
            return false;  // 요청을 중단하고 컨트롤러로 전달하지 않음
        }

        // Authorization 헤더에서 JWT 토큰을 추출
        String token = authorizationHeader.substring(7);

        // TODO: JWT 토큰 유효성 검사 및 인증 처리 로직 추가
        // 예: JWTUtil 클래스의 메서드를 사용하여 토큰을 검증하고 사용자 정보를 추출

        String role = jwtUtil.getRoleFromToken(token);
        if (!"ROLE_admin".equals(role)) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);  // 403 Forbidden 상태 코드 반환
            response.getWriter().write("권한이 없습니다.");
            return false;
        }

        System.out.println("JWT 토큰: " + token);
        System.out.println("요청 URL: " + request.getRequestURI() + ", JWT 토큰: " + token);

        return true;  // true를 반환하면 요청을 컨트롤러로 전달
    }
}
