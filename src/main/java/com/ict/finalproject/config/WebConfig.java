package com.ict.finalproject.config;

import com.ict.finalproject.JWT.JwtIntercepter;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("http://localhost:9911")  // 클라이언트의 도메인 주소
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("Authorization", "Content-Type")  // 허용할 헤더 추가
                .exposedHeaders("Authorization")  // 클라이언트가 읽을 수 있도록 허용할 응답 헤더 추가
                .allowCredentials(true)
                .maxAge(3600);  // CORS 설정 캐시 시간
    }
}
