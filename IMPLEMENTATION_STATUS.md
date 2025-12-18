# Replant Backend API Implementation Status

## Completed APIs

### 1. User API (/api/users/*)
- ✅ GET /api/users/me - 내 정보 조회
- ✅ PUT /api/users/me - 내 정보 수정
- ✅ GET /api/users/{userId} - 다른 유저 프로필 조회

**Files Created:**
- `/controller/UserController.java`

### 2. Reant API (/api/reant)
- ✅ GET /api/reant - 내 펫 조회
- ✅ PUT /api/reant - 펫 정보 수정

**Files Already Exist:**
- `/controller/ReantController.java`

### 3. Mission API (/api/missions/*)
- ✅ GET /api/missions - 미션 목록 조회
- ✅ GET /api/missions/{missionId} - 미션 상세 조회
- ✅ GET /api/missions/{missionId}/reviews - 리뷰 목록 조회
- ✅ POST /api/missions/{missionId}/reviews - 리뷰 작성
- ✅ GET /api/missions/{missionId}/qna - QnA 목록 조회
- ✅ GET /api/missions/{missionId}/qna/{qnaId} - QnA 상세 조회
- ✅ POST /api/missions/{missionId}/qna - QnA 질문 작성
- ✅ POST /api/missions/{missionId}/qna/{qnaId}/answers - QnA 답변 작성
- ✅ PUT /api/missions/{missionId}/qna/{qnaId}/answers/{answerId}/accept - QnA 답변 채택

**Files Created:**
- `/controller/MissionController.java`
- `/domain/mission/service/MissionService.java`
- `/domain/mission/dto/MissionResponse.java`
- `/domain/mission/dto/MissionReviewRequest.java`
- `/domain/mission/dto/MissionReviewResponse.java`
- `/domain/mission/dto/MissionQnARequest.java`
- `/domain/mission/dto/MissionQnAAnswerRequest.java`
- `/domain/mission/dto/MissionQnAResponse.java`
- `/domain/mission/repository/MissionRepository.java`
- `/domain/review/repository/MissionReviewRepository.java`
- `/domain/qna/repository/MissionQnARepository.java`
- `/domain/qna/repository/MissionQnAAnswerRepository.java`

## Remaining APIs to Implement

### 4. CustomMission API (/api/custom-missions/*)
- ⏳ GET /api/custom-missions - 목록 조회
- ⏳ GET /api/custom-missions/{customMissionId} - 상세 조회
- ⏳ POST /api/custom-missions - 생성
- ⏳ PUT /api/custom-missions/{customMissionId} - 수정
- ⏳ DELETE /api/custom-missions/{customMissionId} - 삭제

**Files Needed:**
- `/controller/CustomMissionController.java`
- `/domain/custommission/service/CustomMissionService.java`
- `/domain/custommission/dto/*.java`

### 5. UserMission API (/api/user-missions/*)
- ⏳ GET /api/user-missions - 내 미션 목록
- ⏳ GET /api/user-missions/{userMissionId} - 내 미션 상세
- ⏳ POST /api/user-missions - 커스텀 미션 추가
- ⏳ POST /api/user-missions/{userMissionId}/verify - 미션 인증

**Files Needed:**
- `/controller/UserMissionController.java`
- `/domain/usermission/service/UserMissionService.java`
- `/domain/usermission/dto/*.java`

### 6. Verification API (/api/verifications/*)
- ⏳ GET /api/verifications - 인증글 목록
- ⏳ GET /api/verifications/{verificationId} - 인증글 상세
- ⏳ POST /api/verifications - 인증글 작성
- ⏳ PUT /api/verifications/{verificationId} - 인증글 수정
- ⏳ DELETE /api/verifications/{verificationId} - 인증글 삭제
- ⏳ POST /api/verifications/{verificationId}/votes - 인증 투표

**Files Needed:**
- `/controller/VerificationController.java`
- `/domain/verification/service/VerificationService.java`
- `/domain/verification/dto/*.java`

### 7. Post API (/api/posts/*)
- ⏳ GET /api/posts - 게시글 목록
- ⏳ GET /api/posts/{postId} - 게시글 상세
- ⏳ POST /api/posts - 게시글 작성
- ⏳ PUT /api/posts/{postId} - 게시글 수정
- ⏳ DELETE /api/posts/{postId} - 게시글 삭제
- ⏳ GET /api/posts/{postId}/comments - 댓글 목록
- ⏳ POST /api/posts/{postId}/comments - 댓글 작성
- ⏳ PUT /api/posts/{postId}/comments/{commentId} - 댓글 수정
- ⏳ DELETE /api/posts/{postId}/comments/{commentId} - 댓글 삭제

**Files Needed:**
- `/controller/PostController.java`
- `/domain/post/service/PostService.java`
- `/domain/post/dto/*.java`

### 8. Badge API (/api/badges/*)
- ⏳ GET /api/badges - 유효 뱃지 목록
- ⏳ GET /api/badges/history - 뱃지 히스토리

**Files Needed:**
- `/controller/BadgeController.java`
- `/domain/badge/service/BadgeService.java`
- `/domain/badge/dto/*.java`

### 9. Recommendation API (/api/recommendations/*)
- ⏳ GET /api/recommendations - 추천 목록
- ⏳ POST /api/recommendations/{recommendationId}/accept - 추천 수락
- ⏳ POST /api/recommendations/{recommendationId}/reject - 추천 거절

**Files Needed:**
- `/controller/RecommendationController.java`
- `/domain/recommendation/service/RecommendationService.java`
- `/domain/recommendation/dto/*.java`

### 10. Chat API (/api/chat/*)
- ⏳ GET /api/chat/rooms - 채팅방 목록
- ⏳ GET /api/chat/rooms/{roomId} - 채팅방 상세
- ⏳ GET /api/chat/rooms/{roomId}/messages - 메시지 목록
- ⏳ POST /api/chat/rooms/{roomId}/messages - 메시지 전송
- ⏳ PUT /api/chat/rooms/{roomId}/messages/read - 메시지 읽음

**Files Needed:**
- `/controller/ChatController.java`
- `/domain/chat/service/ChatService.java`
- `/domain/chat/dto/*.java`

### 11. Notification API (/api/notifications/*)
- ⏳ GET /api/notifications - 알림 목록
- ⏳ PUT /api/notifications/{notificationId}/read - 알림 읽음
- ⏳ PUT /api/notifications/read-all - 전체 읽음

**Files Needed:**
- `/controller/NotificationController.java`
- `/domain/notification/service/NotificationService.java`
- `/domain/notification/dto/*.java`

## Repositories Created
✅ All major repositories have been created:
- MissionRepository
- MissionReviewRepository
- MissionQnARepository
- MissionQnAAnswerRepository
- CustomMissionRepository
- UserMissionRepository
- VerificationPostRepository
- VerificationVoteRepository
- PostRepository
- CommentRepository
- UserBadgeRepository
- UserRecommendationRepository
- ChatRoomRepository
- ChatMessageRepository
- NotificationRepository

## Error Codes Updated
✅ ErrorCode enum has been updated with all necessary error codes for:
- Mission, CustomMission, UserMission
- Badge, Review, QnA
- Verification, Post, Comment
- Recommendation, Chat, Notification

## Next Steps
The remaining implementations require creating Services, DTOs, and Controllers for domains 4-11.
Each domain needs approximately:
- 1 Service file (business logic)
- 3-8 DTO files (Request/Response objects)
- 1 Controller file (REST endpoints)

Total estimated files remaining: ~60-80 files
