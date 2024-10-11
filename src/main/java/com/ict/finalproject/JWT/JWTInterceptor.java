package com.ict.finalproject.JWT;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class JWTInterceptor implements HandlerInterceptor {
    private  JWTUtil jwtUtil;

    // JwtInterceptor 생성자
    public JWTInterceptor(JWTUtil jwtUtil) {
        this.jwtUtil = jwtUtil;
    }

    // preHandle 메서드: 요청이 컨트롤러로 전달되기 전에 호출되며, JWT 유효성 검사를 수행
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

        // JWT 토큰 유효성 검사 및 인증 처리
        if (!jwtUtil.validateToken(token)) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);  // 401 Unauthorized 상태 코드 반환
            response.getWriter().write("유효하지 않은 JWT 토큰입니다.");
            return false;
        }

        // JWT 토큰에서 사용자 ID 추출
        String userId = jwtUtil.getUserIdFromToken(token);
        if (userId == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);  // 401 Unauthorized 상태 코드 반환
            response.getWriter().write("JWT 토큰에서 사용자 정보를 추출할 수 없습니다.");
            return false;
        }

        // Spring Security의 Authentication 객체 생성 및 설정 (권한은 빈 리스트로 설정)
        UsernamePasswordAuthenticationToken authentication =
                new UsernamePasswordAuthenticationToken(userId, null, null);

        // SecurityContextHolder에 설정하여 SecurityContext에 인증 정보 저장
        SecurityContextHolder.getContext().setAuthentication(authentication);

        // 요청이 성공적으로 통과되어야 함을 나타내기 위해 true 반환
        return true;
    }

    // postHandle 메서드: 컨트롤러의 메서드가 실행된 후에 호출
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        // 뷰 렌더링 전에 데이터 가공 및 추가 작업을 할 때 사용
    }

    // afterCompletion 메서드: 뷰 렌더링이 완료된 후 호출
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // 리소스 정리나 로깅 작업을 할 때 사용
    }
}
