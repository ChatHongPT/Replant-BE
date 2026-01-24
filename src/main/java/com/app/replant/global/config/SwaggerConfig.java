package com.app.replant.global.config;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springdoc.core.customizers.OpenApiCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {

    @Bean
    public OpenAPI openAPI() {
        String jwtSchemeName = "JWT Token";
        
        // JWT 인증 스키마 설정
        SecurityRequirement securityRequirement = new SecurityRequirement().addList(jwtSchemeName);
        
        Components components = new Components()
                .addSecuritySchemes(jwtSchemeName, new SecurityScheme()
                        .name(jwtSchemeName)
                        .type(SecurityScheme.Type.HTTP)
                        .scheme("bearer")
                        .bearerFormat("JWT")
                        .description("JWT 토큰을 입력하세요 (Bearer 제외)")
                );
        
        OpenAPI openAPI = new OpenAPI()
                .info(new Info()
                        .title("Replant API")
                        .description("Replant 백엔드 REST API 문서")
                        .version("v1.0.0")
                        .contact(new Contact()
                                .name("Replant Team")
                                .url("https://github.com/Replant")
                        )
                )
                .addSecurityItem(securityRequirement)
                .components(components);
        
        // OpenAPI 버전 명시적 설정
        openAPI.setOpenapi("3.0.3");
        
        return openAPI;
    }

    @Bean
    public OpenApiCustomizer openApiCustomizer() {
        return openApi -> {
            // OpenAPI 버전을 3.0.3으로 강제 설정 (Swagger UI 호환성을 위해)
            // SpringDoc이 자동으로 3.1.0을 설정하는 것을 방지하고 항상 덮어쓰기
            openApi.setOpenapi("3.0.3");
        };
    }
}

