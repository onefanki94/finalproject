package com.ict.finalproject.config;

import com.ict.finalproject.DAO.TAdminDAO;

import com.ict.finalproject.JWT.JWTFilter;
import com.ict.finalproject.JWT.JWTUtil;
import com.ict.finalproject.JWT.LoginFilter;
import com.ict.finalproject.Service.TAdminService;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;

import java.util.Arrays;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final TAdminService tAdminService;  // TAdminDAO 주입
    private final JWTUtil jwtUtil;

    public SecurityConfig(TAdminService tAdminService, JWTUtil jwtUtil) {
        this.tAdminService = tAdminService;
        this.jwtUtil = jwtUtil;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf(csrf -> csrf.disable());  // CSRF 비활성화
        http.formLogin(form -> form.disable());
        http.httpBasic(httpBasic -> httpBasic.disable());

        // 모든 요청에 대해 인증 없이 접근 허용
        http.authorizeHttpRequests(auth -> auth
                .anyRequest().permitAll());

        // JWT 필터와 Admin 필터를 임시로 비활성화 (필터에 인증 검증 로직이 있을 경우)
        // http.addFilterBefore(new JWTFilter(jwtUtil), UsernamePasswordAuthenticationFilter.class)
        //         .addFilterAfter(new AdminFilter(tAdminService, jwtUtil), JWTFilter.class);

        // 세션 관리 설정
        http.sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS));

        // 예외 처리: 예외가 발생해도 페이지가 정상적으로 로드되도록 임시 설정
        http.exceptionHandling(handling -> handling
                .authenticationEntryPoint((request, response, authException) -> {
                    System.out.println("접근 거부됨: " + authException.getMessage());
                    response.sendError(HttpServletResponse.SC_OK, "권한 없음");  // UNAUTHORIZED 대신 OK로 설정
                })
        );

        return http.build();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }
}