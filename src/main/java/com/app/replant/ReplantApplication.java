package com.app.replant;

import io.github.cdimascio.dotenv.Dotenv;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class ReplantApplication {

    public static void main(String[] args) {
        try {
            Dotenv dotenv = Dotenv.configure()
                    .ignoreIfMissing()
                    .load();

            System.out.println("=== .env 파일 로딩 ===");
            System.out.println("로드된 환경변수 개수: " + dotenv.entries().size());

            dotenv.entries().forEach(entry -> {
                System.setProperty(entry.getKey(), entry.getValue());
                // S3 키 확인용 로그 (마스킹 처리)
                if (entry.getKey().contains("S3")) {
                    String maskedValue = entry.getValue().length() > 4
                        ? entry.getValue().substring(0, 4) + "****"
                        : "****";
                    System.out.println("  " + entry.getKey() + " = " + maskedValue);
                }
            });
            System.out.println("======================");
        } catch (Exception e) {
            System.err.println(".env 파일 로딩 실패: " + e.getMessage());
        }

        SpringApplication.run(ReplantApplication.class, args);
    }

}
