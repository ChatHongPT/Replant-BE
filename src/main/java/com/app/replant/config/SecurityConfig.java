package com.app.replant.config;


import com.app.replant.handler.JwtAccessDeniedHandler;
import com.app.replant.jwt.JwtAuthenticationEntryPoint;
import com.app.replant.jwt.TokenProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;
import java.util.Collections;

@EnableWebSecurity
@Configuration
@RequiredArgsConstructor
public class SecurityConfig {
    private final TokenProvider tokenProvider;
    private final JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint;
    private final JwtAccessDeniedHandler jwtAccessDeniedHandler;

    @Value("${FRONTEND_URL}")
    private String frontendUrl;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        
        // 허용할 오리진 설정 (프론트엔드 주소)
        // 개발 환경: localhost, 프로덕션 환경: 실제 도메인
        configuration.setAllowedOriginPatterns(Arrays.asList(
            frontendUrl,
            "http://localhost:*",
            "http://127.0.0.1:*",
            "http://10.0.2.2:*", // Android Emulator
            "http://192.168.*.*:*" // 로컬 네트워크
        ));
        
        // 허용할 HTTP 메서드
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS"));
        
        // 허용할 헤더
        configuration.setAllowedHeaders(Arrays.asList("*"));
        
        // 인증 정보 포함 허용 (쿠키, Authorization 헤더 등)
        configuration.setAllowCredentials(true);
        
        // preflight 요청 캐시 시간
        configuration.setMaxAge(3600L);
        
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                // CSRF 설정 Disable
                .csrf(AbstractHttpConfigurer::disable)
                
                // CORS 설정 활성화
                .cors(cors -> cors.configurationSource(corsConfigurationSource()))
                
                // Exception handling 설정
                .exceptionHandling(exception -> exception
                        .authenticationEntryPoint(jwtAuthenticationEntryPoint)
                        .accessDeniedHandler(jwtAccessDeniedHandler)
                )
                
                // H2 콘솔을 위한 설정 (필요시)
                .headers(headers -> headers
                        .frameOptions(HeadersConfigurer.FrameOptionsConfig::sameOrigin)
                )
                
                // 세션을 사용하지 않기 때문에 STATELESS로 설정
                .sessionManagement(session -> session
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                )
                
                // 권한별 URL 접근 설정
                .authorizeHttpRequests(auth -> auth
                        // 공개 API (인증 불필요)
                        .requestMatchers("/api/auth/**").permitAll() // 인증 관련 (OAuth 포함)
                        .requestMatchers("/auth/**").permitAll() // 기존 인증 경로
                        .requestMatchers("/api/missions/**").permitAll() // 미션 목록 조회 (공개)
                        .requestMatchers("/api/custom-missions/**").permitAll() // 커스텀 미션 목록 (공개)
                        .requestMatchers("/api/verifications").permitAll() // 인증 게시판 목록 (공개)
                        .requestMatchers("/api/posts").permitAll() // 게시글 목록 (공개)
                        .requestMatchers("/ws/**").permitAll() // WebSocket
                        .requestMatchers("/files/**").permitAll() // 파일 업로드/다운로드
                        .requestMatchers("/actuator/**").permitAll() // Actuator
                        .requestMatchers("/swagger-ui.html", "/swagger-ui/**", "/v3/api-docs/**", "/swagger-resources/**").permitAll() // Swagger
                        .requestMatchers("/h2-console/**").permitAll() // H2 Console (개발용)

                        // 인증 필요 API
                        .requestMatchers("/api/users/**").authenticated()
                        .requestMatchers("/api/reant/**").authenticated()
                        .requestMatchers("/api/user-missions/**").authenticated()
                        .requestMatchers("/api/badges/**").authenticated()
                        .requestMatchers("/api/recommendations/**").authenticated()
                        .requestMatchers("/api/chat/**").authenticated()
                        .requestMatchers("/api/notifications/**").authenticated()
                        .requestMatchers("/sse/**").authenticated() // SSE

                        // 관리자 API
                        .requestMatchers("/api/admin/**").hasRole("ADMIN")
                        .requestMatchers("/admin/**").hasRole("ADMIN")

                        // 나머지는 인증 필요
                        .anyRequest().authenticated()
                )
                
                // JWT 필터 적용
                .with(new JwtSecurityConfig(tokenProvider), customizer -> {});

        return http.build();
    }
}