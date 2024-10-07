package com.ict.finalproject.JWT;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

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
            response.getWriter().write("인증 정보가 없습니다.");  // 한국어 메시지로 변경
            return false;  // 요청을 중단하고 컨트롤러로 전달하지 않음
        }

        // Authorization 헤더에서 JWT 토큰을 추출
        String token = authorizationHeader.substring(7);

        // JWT 토큰의 유효성 검사
        if (!jwtUtil.validateToken(token)) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);  // 401 Unauthorized 상태 코드 반환
            response.getWriter().write("유효하지 않은 JWT 토큰입니다.");  // 한국어 메시지로 변경
            return false;  // 요청을 중단하고 컨트롤러로 전달하지 않음
        }

        // 사용자 ID 및 idx 추출
        String userid = jwtUtil.getUserid(token);
        int idx = jwtUtil.getIdx(token);

        // 로그 추가
        System.out.println("JWT 토큰: " + token);
        System.out.println("요청 URL: " + request.getRequestURI() + ", 사용자 ID: " + jwtUtil.getUserid(token) + ", idx: " + idx);

        return true;  // true를 반환하면 요청을 컨트롤러로 전달
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        // 뷰 렌더링 전에 데이터 가공 및 추가 작업을 할 때 사용
        System.out.println("postHandle: 요청 처리가 완료되었으며, 뷰 렌더링 전에 호출됨");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // 뷰 렌더링 후에 리소스 정리나 로깅 작업을 할 때 사용
        if (ex != null) {
            System.err.println("afterCompletion: 요청 처리 중 예외 발생 - " + ex.getMessage());
        }
        System.out.println("afterCompletion: 요청 처리가 완료되고, 뷰 렌더링 이후에 호출됨");
    }
}
