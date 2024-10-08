package com.ict.finalproject.config;

import com.ict.finalproject.DAO.TAdminDAO;
import com.ict.finalproject.JWT.AdminFilter;
import com.ict.finalproject.JWT.JWTFilter;
import com.ict.finalproject.JWT.JWTUtil;
import com.ict.finalproject.JWT.LoginFilter;
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

    private final TAdminDAO tAdminDAO;  // TAdminDAO 주입
    private final JWTUtil jwtUtil;

    public SecurityConfig(TAdminDAO tAdminDAO, JWTUtil jwtUtil) {
        this.tAdminDAO = tAdminDAO;
        this.jwtUtil = jwtUtil;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        // CSRF 비활성화
        http.csrf(csrf -> csrf.disable());

        // 폼 로그인 및 Http Basic 비활성화
        http.formLogin(form -> form.disable());
        http.httpBasic(httpBasic -> httpBasic.disable());

        // 권한 및 인증 설정
        http.authorizeHttpRequests(auth -> auth
                .requestMatchers("/master/**").authenticated()  // /master/** 경로는 인증이 필요함
                .anyRequest().permitAll()  // 나머지 모든 요청은 인증 필요 없음
        );

        // JWT 필터 추가
        http.addFilterBefore(new JWTFilter(jwtUtil), UsernamePasswordAuthenticationFilter.class)
                .addFilterAfter(new AdminFilter(tAdminDAO, jwtUtil), JWTFilter.class);

        // 세션 관리 설정
        http.sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS));

        // 예외 처리
        http.exceptionHandling(handling -> handling
                .authenticationEntryPoint((request, response, authException) -> {
                    System.out.println("접근 거부됨: " + authException.getMessage());
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "권한 없음");  // UNAUTHORIZED로 변경
                })
        );

        http.cors(cors -> cors.configurationSource(request -> {
            CorsConfiguration config = new CorsConfiguration();
            config.setAllowedOrigins(Arrays.asList("http://localhost:9911")); // 클라이언트 도메인 설정
            config.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE"));
            config.setAllowedHeaders(Arrays.asList("Authorization", "Content-Type"));
            config.setExposedHeaders(Arrays.asList("Authorization")); // 응답 헤더 노출
            config.setAllowCredentials(true);
            return config;
        }));

        return http.build();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }
}