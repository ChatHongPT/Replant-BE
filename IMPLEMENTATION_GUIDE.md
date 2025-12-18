# Replant Backend - Complete Implementation Guide

## 작업 완료 현황

### ✅ 완료된 작업

1. **기본 인프라**
   - ✅ 모든 Repository 인터페이스 생성 (15개)
   - ✅ ErrorCode 업데이트 (모든 도메인 에러 추가)
   - ✅ BaseEntity, ApiResponse 등 공통 클래스 존재 확인

2. **User API** - 100% 완료
   - ✅ UserController 생성
   - ✅ 모든 엔드포인트 구현

3. **Reant API** - 100% 완료
   - ✅ 기존 ReantController 활용

4. **Mission API** - 100% 완료
   - ✅ MissionController 생성
   - ✅ MissionService 생성
   - ✅ 모든 DTO 생성 (7개)
   - ✅ Review 및 QnA 전체 기능 구현

### ⏳ 미완료 작업 (나머지 7개 도메인)

아래 도메인들은 Repository는 생성되었으나, Service, DTO, Controller가 필요합니다:

1. **CustomMission API** (5개 엔드포인트)
2. **UserMission API** (4개 엔드포인트)
3. **Verification API** (6개 엔드포인트)
4. **Post API** (9개 엔드포인트)
5. **Badge API** (2개 엔드포인트)
6. **Recommendation API** (3개 엔드포인트)
7. **Chat API** (5개 엔드포인트)
8. **Notification API** (3개 엔드포인트)

**총 37개 엔드포인트**가 추가로 필요하며, 약 **50-70개 파일**을 생성해야 합니다.

---

## 각 도메인별 구현 가이드

### 패턴 예시

각 도메인은 다음 패턴을 따릅니다:

```
domain/{domain-name}/
├── dto/
│   ├── {Domain}CreateRequest.java
│   ├── {Domain}UpdateRequest.java
│   ├── {Domain}Response.java
│   └── {Domain}DetailResponse.java
├── service/
│   └── {Domain}Service.java
├── repository/
│   └── {Domain}Repository.java (✅ 이미 생성됨)
└── entity/
    └── {Domain}.java (✅ 이미 존재)

controller/
└── {Domain}Controller.java
```

---

## 상세 구현 계획

### 1. CustomMission API

**엔드포인트:**
- GET /api/custom-missions
- GET /api/custom-missions/{id}
- POST /api/custom-missions
- PUT /api/custom-missions/{id}
- DELETE /api/custom-missions/{id}

**필요 파일:**
```
/domain/custommission/dto/CustomMissionRequest.java
/domain/custommission/dto/CustomMissionResponse.java
/domain/custommission/dto/CustomMissionDetailResponse.java
/domain/custommission/service/CustomMissionService.java
/controller/CustomMissionController.java
```

**핵심 로직:**
- 생성자만 수정/삭제 가능 (NOT_MISSION_CREATOR 체크)
- isPublic=true인 미션만 목록에 노출
- verificationType 필터 지원

---

### 2. UserMission API

**엔드포인트:**
- GET /api/user-missions
- GET /api/user-missions/{id}
- POST /api/user-missions
- POST /api/user-missions/{id}/verify

**필요 파일:**
```
/domain/usermission/dto/UserMissionResponse.java
/domain/usermission/dto/UserMissionDetailResponse.java
/domain/usermission/dto/AddCustomMissionRequest.java
/domain/usermission/dto/VerifyMissionRequest.java
/domain/usermission/dto/VerifyMissionResponse.java
/domain/usermission/service/UserMissionService.java
/controller/UserMissionController.java
```

**핵심 로직:**
- GPS 인증: 거리 계산 (Haversine formula)
- TIME 인증: 시간 차이 계산
- 인증 성공 시 Badge 자동 생성
- 보상 지급 (EXP, Badge)
- 특정 조건에서 Recommendation 생성

---

### 3. Verification API

**엔드포인트:**
- GET /api/verifications
- GET /api/verifications/{id}
- POST /api/verifications
- PUT /api/verifications/{id}
- DELETE /api/verifications/{id}
- POST /api/verifications/{id}/votes

**필요 파일:**
```
/domain/verification/dto/VerificationPostRequest.java
/domain/verification/dto/VerificationPostResponse.java
/domain/verification/dto/VerificationDetailResponse.java
/domain/verification/dto/VoteRequest.java
/domain/verification/dto/VoteResponse.java
/domain/verification/service/VerificationService.java
/controller/VerificationController.java
```

**핵심 로직:**
- PENDING 상태일 때만 수정/삭제 가능
- 본인 글 투표 불가 (SELF_VOTE_NOT_ALLOWED)
- 중복 투표 방지 (ALREADY_VOTED)
- 투표 수에 따라 APPROVED/REJECTED 자동 전환
- 승인 시 UserMission 상태 COMPLETED로 변경

---

### 4. Post API

**엔드포인트:**
- GET /api/posts
- GET /api/posts/{id}
- POST /api/posts
- PUT /api/posts/{id}
- DELETE /api/posts/{id}
- GET /api/posts/{id}/comments
- POST /api/posts/{id}/comments
- PUT /api/posts/{id}/comments/{commentId}
- DELETE /api/posts/{id}/comments/{commentId}

**필요 파일:**
```
/domain/post/dto/PostCreateRequest.java
/domain/post/dto/PostUpdateRequest.java
/domain/post/dto/PostResponse.java
/domain/post/dto/PostDetailResponse.java
/domain/post/dto/CommentRequest.java
/domain/post/dto/CommentResponse.java
/domain/post/service/PostService.java
/controller/PostController.java
```

**핵심 로직:**
- 미션 태그 선택 가능 (missionId 또는 customMissionId)
- badgeOnly 필터: hasValidBadge=true인 글만
- 작성자만 수정/삭제 가능

---

### 5. Badge API

**엔드포인트:**
- GET /api/badges
- GET /api/badges/history

**필요 파일:**
```
/domain/badge/dto/BadgeResponse.java
/domain/badge/dto/BadgeHistoryResponse.java
/domain/badge/service/BadgeService.java
/controller/BadgeController.java
```

**핵심 로직:**
- GET /badges: expiresAt > now인 유효한 뱃지만
- GET /badges/history: 만료 포함 전체 내역

---

### 6. Recommendation API

**엔드포인트:**
- GET /api/recommendations
- POST /api/recommendations/{id}/accept
- POST /api/recommendations/{id}/reject

**필요 파일:**
```
/domain/recommendation/dto/RecommendationResponse.java
/domain/recommendation/dto/AcceptResponse.java
/domain/recommendation/service/RecommendationService.java
/controller/RecommendationController.java
```

**핵심 로직:**
- accept 시 ChatRoom 자동 생성
- status를 ACCEPTED/REJECTED로 변경
- EXPIRED 상태는 응답에서 제외 또는 필터링

---

### 7. Chat API

**엔드포인트:**
- GET /api/chat/rooms
- GET /api/chat/rooms/{id}
- GET /api/chat/rooms/{id}/messages
- POST /api/chat/rooms/{id}/messages
- PUT /api/chat/rooms/{id}/messages/read

**필요 파일:**
```
/domain/chat/dto/ChatRoomResponse.java
/domain/chat/dto/ChatRoomDetailResponse.java
/domain/chat/dto/ChatMessageResponse.java
/domain/chat/dto/SendMessageRequest.java
/domain/chat/service/ChatService.java
/controller/ChatController.java
```

**핵심 로직:**
- 커서 기반 페이지네이션 (before 파라미터)
- isActive=false면 메시지 전송 불가
- 읽음 처리: 상대방 메시지만 isRead=true로 변경

---

### 8. Notification API

**엔드포인트:**
- GET /api/notifications
- PUT /api/notifications/{id}/read
- PUT /api/notifications/read-all

**필요 파일:**
```
/domain/notification/dto/NotificationResponse.java
/domain/notification/service/NotificationService.java
/controller/NotificationController.java
```

**핵심 로직:**
- isRead 필터 지원
- read-all: 해당 유저의 모든 알림을 isRead=true로 일괄 변경
- unreadCount도 함께 반환

---

## 구현 시 주의사항

### 1. 인증 처리
모든 컨트롤러에서 `@AuthenticationPrincipal Long userId` 사용

### 2. 예외 처리
```java
throw new CustomException(ErrorCode.XXX_NOT_FOUND);
```

### 3. 트랜잭션
```java
@Service
@Transactional(readOnly = true)  // 클래스 레벨
public class XxxService {

    @Transactional  // 쓰기 메서드에만
    public XxxResponse create(...) {
        ...
    }
}
```

### 4. DTO 변환
```java
public static XxxResponse from(Xxx entity) {
    return XxxResponse.builder()
        .id(entity.getId())
        ...
        .build();
}
```

### 5. Swagger 문서화
```java
@Tag(name = "Xxx", description = "XXX API")
@Operation(summary = "XXX 조회")
```

---

## 빠른 구현 순서

1. **Badge** (가장 단순, 2개 엔드포인트)
2. **Notification** (단순, 3개 엔드포인트)
3. **Recommendation** (중간, 3개 엔드포인트)
4. **CustomMission** (중간, 5개 엔드포인트)
5. **Chat** (중간, 5개 엔드포인트)
6. **UserMission** (복잡, GPS/TIME 인증 로직)
7. **Verification** (복잡, 투표 로직)
8. **Post** (복잡, 댓글 포함 9개 엔드포인트)

---

## 마지막 체크리스트

구현 완료 후 다음을 확인하세요:

- [ ] 모든 Repository 메서드가 Service에서 사용되는가?
- [ ] 모든 ErrorCode가 적절히 사용되는가?
- [ ] @AuthenticationPrincipal이 필요한 곳에 모두 적용되었는가?
- [ ] Swagger 문서화가 완료되었는가?
- [ ] Validation (@Valid, @NotBlank 등)이 적용되었는가?
- [ ] 페이지네이션이 필요한 곳에 적용되었는가?
- [ ] 트랜잭션 범위가 올바른가?

---

## 예상 작업 시간

- Badge + Notification: 1시간
- Recommendation + CustomMission: 2시간
- Chat: 1.5시간
- UserMission: 2시간
- Verification: 2시간
- Post: 2.5시간

**총 예상 시간: 약 11시간**

