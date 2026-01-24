package com.app.replant.global.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.http.converter.ByteArrayHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;

@Configuration
@RequiredArgsConstructor
public class WebMvcConfig implements WebMvcConfigurer {

    private final SseInterceptor sseInterceptor;
    private final LoginUserIdArgumentResolver loginUserIdArgumentResolver;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(sseInterceptor)
                .addPathPatterns("/sse/**");
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
        resolvers.add(loginUserIdArgumentResolver);
    }

    /**
     * HTTP 메시지 컨버터 설정 (UTF-8 인코딩 보장, LocalDateTime ISO 형식 직렬화)
     * 중요: ByteArrayHttpMessageConverter는 MappingJackson2HttpMessageConverter 전에 등록해야 함
     */
    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        // StringHttpMessageConverter 설정
        StringHttpMessageConverter stringConverter = new StringHttpMessageConverter(StandardCharsets.UTF_8);
        stringConverter.setWriteAcceptCharset(false);
        stringConverter.setSupportedMediaTypes(Arrays.asList(new MediaType("text", "plain", StandardCharsets.UTF_8)));
        converters.add(stringConverter);
        
        // ByteArrayHttpMessageConverter 추가 (MappingJackson2HttpMessageConverter 전에 등록)
        converters.add(new ByteArrayHttpMessageConverter());
        
        // MappingJackson2HttpMessageConverter 설정
        JavaTimeModule javaTimeModule = new JavaTimeModule();
        javaTimeModule.addSerializer(LocalDateTime.class, 
            new LocalDateTimeSerializer(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
        
        Jackson2ObjectMapperBuilder builder = Jackson2ObjectMapperBuilder.json()
                .defaultViewInclusion(true)
                .failOnUnknownProperties(false)
                .modules(javaTimeModule);
        
        MappingJackson2HttpMessageConverter jsonConverter = new MappingJackson2HttpMessageConverter(builder.build());
        jsonConverter.setDefaultCharset(StandardCharsets.UTF_8);
        converters.add(jsonConverter);
    }

    /**
     * ObjectMapper Bean 설정 (UTF-8 인코딩 보장, LocalDateTime ISO 형식 직렬화)
     */
    @Bean
    public ObjectMapper objectMapper() {
        JavaTimeModule javaTimeModule = new JavaTimeModule();
        javaTimeModule.addSerializer(LocalDateTime.class, 
            new LocalDateTimeSerializer(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
        
        return Jackson2ObjectMapperBuilder.json()
                .defaultViewInclusion(true)
                .failOnUnknownProperties(false)
                .modules(javaTimeModule)
                .build();
    }
}

