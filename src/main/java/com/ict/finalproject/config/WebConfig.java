package com.ict.finalproject.config;

import com.ict.finalproject.JWT.JWTUtil;
import com.ict.finalproject.JWT.JwtIntercepter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    private final JWTUtil jwtUtil;

    public WebConfig(JWTUtil jwtUtil) {
        this.jwtUtil = jwtUtil;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // JwtInterceptor 등록 및 특정 경로에만 적용
        registry.addInterceptor(new JwtIntercepter(jwtUtil))
                .addPathPatterns("/master/**")  // /master/** 경로에만 JWT 인증 인터셉터 적용
                .excludePathPatterns("/login", "/join", "/cmList");  // 인증 예외 경로 설정
    }
}
