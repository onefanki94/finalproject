package com.ict.finalproject.config;

import com.ict.finalproject.JWT.JWTFilter;
import com.ict.finalproject.JWT.JWTUtil;
import com.ict.finalproject.JWT.LoginFilter;
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

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final AuthenticationConfiguration authenticationConfiguration;
    private final JWTUtil jwtUtil;

    public SecurityConfig(AuthenticationConfiguration authenticationConfiguration, JWTUtil jwtUtil) {

        this.authenticationConfiguration = authenticationConfiguration;
        this.jwtUtil = jwtUtil;
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {

        return configuration.getAuthenticationManager();
    }

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {

        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        // 1. CSRF 비활성화
        http
                .csrf((csrf) -> csrf.disable());

        // 2. 기본 Form 로그인 방식 비활성화
        http
                .formLogin((formLogin) -> formLogin.disable());

        // 3. HTTP 기본 인증 방식 비활성화
        http
                .httpBasic((basicAuth) -> basicAuth.disable());

        // 4. 요청 권한 설정
        http
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/login", "/", "/join", "/cmList").permitAll()  // 특정 경로는 인증 없이 접근 가능
                        .requestMatchers("/master/**").hasRole("admin")  // /master/** 경로는 ROLE_admin 권한 필요
                        .anyRequest().permitAll()  // 나머지 모든 요청은 인증 없이 접근 가능
                );

        // 5. JWT 필터 추가: UsernamePasswordAuthenticationFilter 전에 JWTFilter 추가
        http
                .addFilterBefore(new JWTFilter(jwtUtil), UsernamePasswordAuthenticationFilter.class)

                // 6. Login 필터 추가: JWTFilter 이후에 LoginFilter 추가
                .addFilterAfter(new LoginFilter(authenticationManager(authenticationConfiguration), jwtUtil), JWTFilter.class);

        // 7. 세션 설정: 세션을 생성하지 않음 (STATELESS 모드)
        http
                .sessionManagement((session) -> session
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS));

        // 8. SecurityFilterChain 객체 반환
        return http.build();
    }
}
