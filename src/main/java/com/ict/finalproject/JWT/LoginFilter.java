package com.ict.finalproject.JWT;

import com.ict.finalproject.DTO.CustomUserDetails;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

public class LoginFilter extends UsernamePasswordAuthenticationFilter {

    private final AuthenticationManager authenticationManager;
    private final JWTUtil jwtUtil;

    public LoginFilter(AuthenticationManager authenticationManager, JWTUtil jwtUtil) {
        this.authenticationManager = authenticationManager;
        this.jwtUtil = jwtUtil;
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        // 로그인 요청에서 username과 password 파라미터를 명확하게 추출
        String userid = request.getParameter("userid");
        String password = request.getParameter("userpwd");

        if (userid == null || password == null) {
            throw new IllegalArgumentException("잘못된 정보.");
        }

        // 로그인을 위한 인증 토큰 생성
        UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(userid, password);

        // AuthenticationManager를 사용하여 인증 시도
        return authenticationManager.authenticate(authToken);
    }

    @Override
    protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authentication) throws IOException, ServletException {
        // 인증된 사용자 정보 가져오기
        CustomUserDetails customUserDetails = (CustomUserDetails) authentication.getPrincipal();
        String userid = customUserDetails.getUsername();
        int idx = customUserDetails.getIdx(); // idx 값 가져오기

        // JWT 토큰 생성 (역할은 사용하지 않음)
        String token = jwtUtil.createJwt(userid, idx, 3600000L); // 1시간 만료 시간

        // JSON 형식으로 JWT 토큰 반환
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Map<String, Object> responseBody = new HashMap<>();
        responseBody.put("userid", userid);
        responseBody.put("idx", idx);
        responseBody.put("token", "Bearer " + token);

        // 응답으로 JSON 반환
        PrintWriter out = response.getWriter();
        out.print(responseBody);
        out.flush();
    }

    @Override
    protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response, AuthenticationException failed) {
        response.setStatus(401);
    }
}
