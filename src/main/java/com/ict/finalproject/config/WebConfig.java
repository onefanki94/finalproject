package com.ict.finalproject.config;

import com.ict.finalproject.JWT.JwtIntercepter;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 인터셉터 등록 및 URL 패턴 설정
        registry.addInterceptor(new JwtIntercepter())
                .addPathPatterns("/api/**")  // "/api/**" 패턴에 대해 인터셉터 실행
                .excludePathPatterns("/api/public/**", "/user/login", "/user/join");  // 인증이 필요하지 않은 경로는 제외
    }
}
