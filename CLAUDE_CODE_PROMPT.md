# Replant 백엔드 프로젝트 생성 요청

## 프로젝트 개요
펫(리앤트) 육성 + 미션 수행 + 커뮤니티 앱의 백엔드 서버

## 기술 스택
- **Java**: 17
- **Spring Boot**: 3.2.x
- **Spring Security**: JWT 인증
- **Spring Data JPA**: ORM
- **Database**: MariaDB 10.11
- **Build Tool**: Gradle (Groovy DSL)
- **API 문서**: Swagger (springdoc-openapi)

## 프로젝트 기본 설정

### build.gradle
```groovy
plugins {
    id 'java'
    id 'org.springframework.boot' version '3.2.0'
    id 'io.spring.dependency-management' version '1.1.4'
}

group = 'com.replant'
version = '0.0.1-SNAPSHOT'

java {
    sourceCompatibility = '17'
}

configurations {
    compileOnly {
        extendsFrom annotationProcessor
    }
}

repositories {
    mavenCentral()
}

dependencies {
    // Spring Boot
    implementation 'org.springframework.boot:spring-boot-starter-web'
    implementation 'org.springframework.boot:spring-boot-starter-data-jpa'
    implementation 'org.springframework.boot:spring-boot-starter-security'
    implementation 'org.springframework.boot:spring-boot-starter-validation'
    
    // Database
    runtimeOnly 'org.mariadb.jdbc:mariadb-java-client'
    
    // JWT
    implementation 'io.jsonwebtoken:jjwt-api:0.12.3'
    runtimeOnly 'io.jsonwebtoken:jjwt-impl:0.12.3'
    runtimeOnly 'io.jsonwebtoken:jjwt-jackson:0.12.3'
    
    // Swagger
    implementation 'org.springdoc:springdoc-openapi-starter-webmvc-ui:2.3.0'
    
    // Lombok
    compileOnly 'org.projectlombok:lombok'
    annotationProcessor 'org.projectlombok:lombok'
    
    // Test
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
    testImplementation 'org.springframework.security:spring-security-test'
}

tasks.named('test') {
    useJUnitPlatform()
}
```

### application.yml
```yaml
spring:
  datasource:
    url: jdbc:mariadb://localhost:3306/replant?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Seoul
    username: ${DB_USERNAME:root}
    password: ${DB_PASSWORD:password}
    driver-class-name: org.mariadb.jdbc.Driver
    
  jpa:
    hibernate:
      ddl-auto: validate
    properties:
      hibernate:
        format_sql: true
        default_batch_fetch_size: 100
    open-in-view: false
    
  jackson:
    property-naming-strategy: LOWER_CAMEL_CASE
    default-property-inclusion: non_null
    
jwt:
  secret: ${JWT_SECRET:your-256-bit-secret-key-here-must-be-at-least-256-bits}
  access-token-validity: 3600000      # 1시간
  refresh-token-validity: 604800000   # 7일

logging:
  level:
    org.hibernate.SQL: debug
    org.hibernate.orm.jdbc.bind: trace
```

---

## 프로젝트 구조

```
src/main/java/com/replant/
├── ReplantApplication.java
│
├── global/
│   ├── config/
│   │   ├── SecurityConfig.java
│   │   ├── JwtConfig.java
│   │   ├── SwaggerConfig.java
│   │   └── JpaConfig.java
│   │
│   ├── security/
│   │   ├── jwt/
│   │   │   ├── JwtTokenProvider.java
│   │   │   ├── JwtAuthenticationFilter.java
│   │   │   └── JwtProperties.java
│   │   ├── CustomUserDetails.java
│   │   ├── CustomUserDetailsService.java
│   │   └── SecurityUtils.java
│   │
│   ├── exception/
│   │   ├── ErrorCode.java
│   │   ├── ErrorResponse.java
│   │   ├── BusinessException.java
│   │   └── GlobalExceptionHandler.java
│   │
│   └── common/
│       ├── BaseEntity.java
│       └── ApiResponse.java
│
└── domain/
    ├── user/
    ├── auth/
    ├── reant/
    ├── mission/
    ├── custommission/
    ├── usermission/
    ├── badge/
    ├── review/
    ├── qna/
    ├── verification/
    ├── post/
    ├── recommendation/
    ├── chat/
    └── notification/
```

---

## 코딩 컨벤션 (반드시 준수)

### 1. Entity

```java
package com.replant.domain.user.entity;

import com.replant.global.common.BaseEntity;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "user")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class User extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 255)
    private String email;

    @Column(nullable = false, length = 50)
    private String nickname;

    @Column(name = "birth_date")
    private LocalDate birthDate;

    @Column(length = 10)
    private String gender;

    @Column(name = "profile_img", length = 500)
    private String profileImg;

    // 연관관계 - 항상 LAZY
    @OneToOne(mappedBy = "user", fetch = FetchType.LAZY)
    private Reant reant;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<UserOAuth> oauthList = new ArrayList<>();

    // Builder는 private 생성자에 적용
    @Builder
    private User(String email, String nickname, LocalDate birthDate, String gender, String profileImg) {
        this.email = email;
        this.nickname = nickname;
        this.birthDate = birthDate;
        this.gender = gender;
        this.profileImg = profileImg;
    }

    // 비즈니스 메서드
    public void updateProfile(String nickname, LocalDate birthDate, String gender, String profileImg) {
        if (nickname != null) this.nickname = nickname;
        if (birthDate != null) this.birthDate = birthDate;
        if (gender != null) this.gender = gender;
        if (profileImg != null) this.profileImg = profileImg;
    }
}
```

### 2. BaseEntity

```java
package com.replant.global.common;

import jakarta.persistence.Column;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;

@Getter
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public abstract class BaseEntity {

    @CreatedDate
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @LastModifiedDate
    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;
}
```

### 3. Enum

```java
package com.replant.domain.mission.entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum MissionType {
    DAILY("일간"),
    WEEKLY("주간"),
    MONTHLY("월간");

    private final String description;
}
```

### 4. Repository

```java
package com.replant.domain.user.repository;

import com.replant.domain.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByEmail(String email);

    boolean existsByEmail(String email);

    @Query("SELECT u FROM User u LEFT JOIN FETCH u.reant WHERE u.id = :userId")
    Optional<User> findByIdWithReant(@Param("userId") Long userId);
}
```

### 5. Service

```java
package com.replant.domain.user.service;

import com.replant.domain.user.dto.request.UserUpdateRequest;
import com.replant.domain.user.dto.response.UserResponse;
import com.replant.domain.user.entity.User;
import com.replant.domain.user.repository.UserRepository;
import com.replant.global.exception.BusinessException;
import com.replant.global.exception.ErrorCode;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class UserService {

    private final UserRepository userRepository;

    public UserResponse getMyInfo(Long userId) {
        User user = findUserById(userId);
        return UserResponse.from(user);
    }

    @Transactional
    public UserResponse updateMyInfo(Long userId, UserUpdateRequest request) {
        User user = findUserById(userId);
        user.updateProfile(
            request.getNickname(),
            request.getBirthDate(),
            request.getGender(),
            request.getProfileImg()
        );
        return UserResponse.from(user);
    }

    private User findUserById(Long userId) {
        return userRepository.findById(userId)
            .orElseThrow(() -> new BusinessException(ErrorCode.USER_NOT_FOUND));
    }
}
```

### 6. Controller

```java
package com.replant.domain.user.controller;

import com.replant.domain.user.dto.request.UserUpdateRequest;
import com.replant.domain.user.dto.response.UserResponse;
import com.replant.domain.user.service.UserService;
import com.replant.global.security.CustomUserDetails;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@Tag(name = "User", description = "사용자 API")
@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @Operation(summary = "내 정보 조회")
    @GetMapping("/me")
    public ResponseEntity<UserResponse> getMyInfo(
            @AuthenticationPrincipal CustomUserDetails userDetails) {
        return ResponseEntity.ok(userService.getMyInfo(userDetails.getUserId()));
    }

    @Operation(summary = "내 정보 수정")
    @PutMapping("/me")
    public ResponseEntity<UserResponse> updateMyInfo(
            @AuthenticationPrincipal CustomUserDetails userDetails,
            @RequestBody @Valid UserUpdateRequest request) {
        return ResponseEntity.ok(userService.updateMyInfo(userDetails.getUserId(), request));
    }
}
```

### 7. DTO - Request

```java
package com.replant.domain.user.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Getter
@NoArgsConstructor
public class UserUpdateRequest {

    @NotBlank(message = "닉네임은 필수입니다")
    @Size(max = 50, message = "닉네임은 50자 이하여야 합니다")
    private String nickname;

    private LocalDate birthDate;

    private String gender;

    @Size(max = 500, message = "프로필 이미지 URL은 500자 이하여야 합니다")
    private String profileImg;
}
```

### 8. DTO - Response

```java
package com.replant.domain.user.dto.response;

import com.replant.domain.user.entity.User;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Builder
public class UserResponse {

    private Long id;
    private String email;
    private String nickname;
    private LocalDate birthDate;
    private String gender;
    private String profileImg;
    private LocalDateTime createdAt;

    public static UserResponse from(User user) {
        return UserResponse.builder()
            .id(user.getId())
            .email(user.getEmail())
            .nickname(user.getNickname())
            .birthDate(user.getBirthDate())
            .gender(user.getGender())
            .profileImg(user.getProfileImg())
            .createdAt(user.getCreatedAt())
            .build();
    }
}
```

### 9. ErrorCode

```java
package com.replant.global.exception;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;

@Getter
@RequiredArgsConstructor
public enum ErrorCode {

    // Common (C)
    INVALID_INPUT(HttpStatus.BAD_REQUEST, "C001", "잘못된 입력입니다"),
    UNAUTHORIZED(HttpStatus.UNAUTHORIZED, "C002", "인증이 필요합니다"),
    FORBIDDEN(HttpStatus.FORBIDDEN, "C003", "권한이 없습니다"),
    RESOURCE_NOT_FOUND(HttpStatus.NOT_FOUND, "C004", "리소스를 찾을 수 없습니다"),
    INTERNAL_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "C005", "서버 오류가 발생했습니다"),

    // Auth (A)
    INVALID_TOKEN(HttpStatus.UNAUTHORIZED, "A001", "유효하지 않은 토큰입니다"),
    EXPIRED_TOKEN(HttpStatus.UNAUTHORIZED, "A002", "만료된 토큰입니다"),
    OAUTH_FAILED(HttpStatus.BAD_REQUEST, "A003", "OAuth 인증에 실패했습니다"),

    // User (U)
    USER_NOT_FOUND(HttpStatus.NOT_FOUND, "U001", "사용자를 찾을 수 없습니다"),
    DUPLICATE_EMAIL(HttpStatus.CONFLICT, "U002", "이미 존재하는 이메일입니다"),

    // Reant (R)
    REANT_NOT_FOUND(HttpStatus.NOT_FOUND, "R001", "리앤트를 찾을 수 없습니다"),

    // Mission (M)
    MISSION_NOT_FOUND(HttpStatus.NOT_FOUND, "M001", "미션을 찾을 수 없습니다"),
    USER_MISSION_NOT_FOUND(HttpStatus.NOT_FOUND, "M002", "할당된 미션을 찾을 수 없습니다"),
    MISSION_ALREADY_COMPLETED(HttpStatus.BAD_REQUEST, "M003", "이미 완료된 미션입니다"),
    MISSION_EXPIRED(HttpStatus.BAD_REQUEST, "M004", "만료된 미션입니다"),

    // Custom Mission (CM)
    CUSTOM_MISSION_NOT_FOUND(HttpStatus.NOT_FOUND, "CM001", "커스텀 미션을 찾을 수 없습니다"),
    NOT_MISSION_CREATOR(HttpStatus.FORBIDDEN, "CM002", "미션 생성자만 수정/삭제할 수 있습니다"),

    // Badge (B)
    BADGE_REQUIRED(HttpStatus.FORBIDDEN, "B001", "유효한 뱃지가 필요합니다"),
    BADGE_NOT_FOUND(HttpStatus.NOT_FOUND, "B002", "뱃지를 찾을 수 없습니다"),

    // Review (RV)
    REVIEW_ALREADY_EXISTS(HttpStatus.CONFLICT, "RV001", "이미 리뷰를 작성했습니다"),
    REVIEW_NOT_FOUND(HttpStatus.NOT_FOUND, "RV002", "리뷰를 찾을 수 없습니다"),

    // QnA (Q)
    QNA_NOT_FOUND(HttpStatus.NOT_FOUND, "Q001", "QnA를 찾을 수 없습니다"),
    ANSWER_NOT_FOUND(HttpStatus.NOT_FOUND, "Q002", "답변을 찾을 수 없습니다"),
    NOT_QUESTIONER(HttpStatus.FORBIDDEN, "Q003", "질문 작성자만 채택할 수 있습니다"),

    // Verification (V)
    VERIFICATION_NOT_FOUND(HttpStatus.NOT_FOUND, "V001", "인증글을 찾을 수 없습니다"),
    ALREADY_VOTED(HttpStatus.BAD_REQUEST, "V002", "이미 투표했습니다"),
    SELF_VOTE_NOT_ALLOWED(HttpStatus.FORBIDDEN, "V003", "본인 글에는 투표할 수 없습니다"),
    MODIFICATION_NOT_ALLOWED(HttpStatus.FORBIDDEN, "V004", "수정/삭제가 불가능한 상태입니다"),
    GPS_OUT_OF_RANGE(HttpStatus.BAD_REQUEST, "V005", "목표 위치에서 너무 멀리 있습니다"),
    TIME_NOT_ENOUGH(HttpStatus.BAD_REQUEST, "V006", "필요 시간을 충족하지 못했습니다"),

    // Post (P)
    POST_NOT_FOUND(HttpStatus.NOT_FOUND, "P001", "게시글을 찾을 수 없습니다"),
    COMMENT_NOT_FOUND(HttpStatus.NOT_FOUND, "P002", "댓글을 찾을 수 없습니다"),
    NOT_POST_AUTHOR(HttpStatus.FORBIDDEN, "P003", "작성자만 수정/삭제할 수 있습니다"),

    // Recommendation (RC)
    RECOMMENDATION_NOT_FOUND(HttpStatus.NOT_FOUND, "RC001", "추천을 찾을 수 없습니다"),
    RECOMMENDATION_EXPIRED(HttpStatus.BAD_REQUEST, "RC002", "만료된 추천입니다"),

    // Chat (CH)
    CHAT_ROOM_NOT_FOUND(HttpStatus.NOT_FOUND, "CH001", "채팅방을 찾을 수 없습니다"),
    CHAT_ROOM_INACTIVE(HttpStatus.FORBIDDEN, "CH002", "비활성화된 채팅방입니다"),
    NOT_CHAT_PARTICIPANT(HttpStatus.FORBIDDEN, "CH003", "채팅방 참여자가 아닙니다"),

    // Notification (N)
    NOTIFICATION_NOT_FOUND(HttpStatus.NOT_FOUND, "N001", "알림을 찾을 수 없습니다");

    private final HttpStatus httpStatus;
    private final String code;
    private final String message;
}
```

### 10. BusinessException & GlobalExceptionHandler

```java
// BusinessException.java
package com.replant.global.exception;

import lombok.Getter;

@Getter
public class BusinessException extends RuntimeException {

    private final ErrorCode errorCode;

    public BusinessException(ErrorCode errorCode) {
        super(errorCode.getMessage());
        this.errorCode = errorCode;
    }

    public BusinessException(ErrorCode errorCode, String message) {
        super(message);
        this.errorCode = errorCode;
    }
}
```

```java
// GlobalExceptionHandler.java
package com.replant.global.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(BusinessException.class)
    protected ResponseEntity<ErrorResponse> handleBusinessException(BusinessException e) {
        log.error("BusinessException: {}", e.getMessage());
        ErrorCode errorCode = e.getErrorCode();
        return ResponseEntity
            .status(errorCode.getHttpStatus())
            .body(ErrorResponse.of(errorCode));
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    protected ResponseEntity<ErrorResponse> handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        log.error("Validation Error: {}", e.getMessage());
        return ResponseEntity
            .badRequest()
            .body(ErrorResponse.of(ErrorCode.INVALID_INPUT, e.getBindingResult()));
    }

    @ExceptionHandler(Exception.class)
    protected ResponseEntity<ErrorResponse> handleException(Exception e) {
        log.error("Internal Server Error: ", e);
        return ResponseEntity
            .internalServerError()
            .body(ErrorResponse.of(ErrorCode.INTERNAL_ERROR));
    }
}
```

```java
// ErrorResponse.java
package com.replant.global.exception;

import lombok.Builder;
import lombok.Getter;
import org.springframework.validation.BindingResult;

import java.util.List;

@Getter
@Builder
public class ErrorResponse {

    private String code;
    private String message;
    private List<FieldError> errors;

    public static ErrorResponse of(ErrorCode errorCode) {
        return ErrorResponse.builder()
            .code(errorCode.getCode())
            .message(errorCode.getMessage())
            .build();
    }

    public static ErrorResponse of(ErrorCode errorCode, BindingResult bindingResult) {
        return ErrorResponse.builder()
            .code(errorCode.getCode())
            .message(errorCode.getMessage())
            .errors(FieldError.of(bindingResult))
            .build();
    }

    @Getter
    @Builder
    public static class FieldError {
        private String field;
        private String value;
        private String reason;

        public static List<FieldError> of(BindingResult bindingResult) {
            return bindingResult.getFieldErrors().stream()
                .map(error -> FieldError.builder()
                    .field(error.getField())
                    .value(error.getRejectedValue() == null ? "" : error.getRejectedValue().toString())
                    .reason(error.getDefaultMessage())
                    .build())
                .toList();
        }
    }
}
```

---

## ERD 테이블 정보

### 테이블 목록 (19개)
1. User - 사용자
2. UserOAuth - OAuth 연동 정보
3. Reant - 펫
4. Mission - 시스템 미션
5. CustomMission - 커스텀 미션
6. UserMission - 사용자 미션 인스턴스
7. MissionVerification - 미션 인증 기록
8. UserBadge - 뱃지
9. MissionReview - 미션 리뷰
10. MissionQnA - 미션 QnA 질문
11. MissionQnAAnswer - 미션 QnA 답변
12. VerificationPost - 인증 게시판 글
13. VerificationVote - 인증 투표
14. Post - 자유 게시판 글
15. Comment - 댓글
16. UserRecommendation - 유저 추천
17. ChatRoom - 채팅방
18. ChatMessage - 채팅 메시지
19. Notification - 알림

### 주요 관계
- User : UserOAuth = 1 : N
- User : Reant = 1 : 1
- User : UserMission = 1 : N
- Mission : UserMission = 1 : N
- CustomMission : UserMission = 1 : N
- UserMission : MissionVerification = 1 : 1
- UserMission : UserBadge = 1 : 1
- UserMission : VerificationPost = 1 : 1
- VerificationPost : VerificationVote = 1 : N
- Post : Comment = 1 : N
- UserRecommendation : ChatRoom = 1 : 1
- ChatRoom : ChatMessage = 1 : N

### Enum 목록
- OAuthProvider: KAKAO, GOOGLE, APPLE, NAVER
- ReantStage: EGG, BABY, ADULT
- MissionType: DAILY, WEEKLY, MONTHLY
- VerificationType: COMMUNITY, GPS, TIME
- UserMissionStatus: ASSIGNED, PENDING, COMPLETED, EXPIRED
- VerificationStatus: PENDING, APPROVED, REJECTED
- VoteType: APPROVE, REJECT
- RecommendationStatus: PENDING, ACCEPTED, REJECTED, EXPIRED
- NotificationType: MISSION_ASSIGNED, VERIFICATION_APPROVED, VERIFICATION_REJECTED, USER_RECOMMENDED, CHAT_MESSAGE, BADGE_EXPIRING, QNA_ANSWERED, QNA_ACCEPTED

---

## 작업 순서

### Phase 1: 기본 설정
1. 프로젝트 생성 (build.gradle, application.yml)
2. global/common 패키지 (BaseEntity, ApiResponse)
3. global/exception 패키지 (ErrorCode, ErrorResponse, BusinessException, GlobalExceptionHandler)
4. global/config 패키지 (JpaConfig, SwaggerConfig)
5. global/security 패키지 (JWT 관련 클래스들)
6. global/config/SecurityConfig

### Phase 2: 핵심 도메인
7. user 도메인 (Entity, Repository, Service, Controller, DTO)
8. auth 도메인 (OAuth 로그인, 토큰 발급)
9. reant 도메인

### Phase 3: 미션 도메인
10. mission 도메인
11. custommission 도메인
12. usermission 도메인 (MissionVerification 포함)
13. badge 도메인

### Phase 4: 미션 부가 기능
14. review 도메인
15. qna 도메인

### Phase 5: 커뮤니티 도메인
16. verification 도메인 (인증 게시판)
17. post 도메인 (자유 게시판)

### Phase 6: 소셜 도메인
18. recommendation 도메인
19. chat 도메인
20. notification 도메인

---

## 주의사항

1. **Entity 생성 시**
   - 반드시 BaseEntity 상속
   - @NoArgsConstructor(access = AccessLevel.PROTECTED) 사용
   - 연관관계는 항상 LAZY 로딩
   - @Builder는 private 생성자에 적용

2. **Service 생성 시**
   - 클래스에 @Transactional(readOnly = true) 적용
   - 변경 메서드에만 @Transactional 적용

3. **Controller 생성 시**
   - Swagger 어노테이션 추가 (@Tag, @Operation)
   - @AuthenticationPrincipal로 현재 사용자 조회

4. **DTO 생성 시**
   - Request: validation 어노테이션 필수
   - Response: 정적 팩토리 메서드 from() 사용

5. **예외 처리**
   - 항상 ErrorCode를 사용한 BusinessException throw
   - 새로운 예외 필요 시 ErrorCode에 추가

---

## 요청

첨부된 API_SPEC.md 파일을 참고하여 위 순서대로 Spring Boot 프로젝트를 생성해주세요.

각 Phase 완료 후 "다음 Phase로 진행해줘"라고 하면 다음 단계를 진행합니다.

현재 Phase가 완료되면 어떤 파일들이 생성되었는지 목록을 보여주세요.
