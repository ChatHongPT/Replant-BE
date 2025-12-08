# API 명세서

## 전체 API 목록

### Auth (인증)
| 도메인 | 이름 | 메서드 | 엔드포인트 | 설명 | 비고 |
|--------|------|--------|-----------|------|------|
| Auth | OAuth 로그인/회원가입 | POST | /api/auth/oauth/{provider} | OAuth 로그인 및 신규 회원가입 | provider: KAKAO, GOOGLE, APPLE, NAVER |
| Auth | 토큰 갱신 | POST | /api/auth/refresh | Access Token 갱신 | Refresh Token 필요 |
| Auth | 로그아웃 | POST | /api/auth/logout | 로그아웃 처리 | 인증 필요 |

### User (사용자)
| 도메인 | 이름 | 메서드 | 엔드포인트 | 설명 | 비고 |
|--------|------|--------|-----------|------|------|
| User | 내 정보 조회 | GET | /api/users/me | 로그인한 사용자 정보 조회 | 인증 필요 |
| User | 내 정보 수정 | PUT | /api/users/me | 로그인한 사용자 정보 수정 | 인증 필요 |
| User | 다른 유저 조회 | GET | /api/users/{userId} | 다른 유저 프로필 조회 | 공개 정보만 |

### Reant (펫)
| 도메인 | 이름 | 메서드 | 엔드포인트 | 설명 | 비고 |
|--------|------|--------|-----------|------|------|
| Reant | 내 펫 조회 | GET | /api/reant | 로그인한 사용자의 펫 조회 | 인증 필요 |
| Reant | 펫 정보 수정 | PUT | /api/reant | 펫 이름, 외형 수정 | 인증 필요 |

### Mission (시스템 미션)
| 도메인 | 이름 | 메서드 | 엔드포인트 | 설명 | 비고 |
|--------|------|--------|-----------|------|------|
| Mission | 미션 목록 조회 | GET | /api/missions | 시스템 미션 목록 조회 | type, verificationType 필터 |
| Mission | 미션 상세 조회 | GET | /api/missions/{missionId} | 시스템 미션 상세 조회 | |
| Mission | 리뷰 목록 조회 | GET | /api/missions/{missionId}/reviews | 미션 리뷰 목록 조회 | 페이지네이션 |
| Mission | 리뷰 작성 | POST | /api/missions/{missionId}/reviews | 미션 리뷰 작성 | 인증 필요, 뱃지 필요 |
| Mission | QnA 목록 조회 | GET | /api/missions/{missionId}/qna | 미션 QnA 목록 조회 | 페이지네이션 |
| Mission | QnA 상세 조회 | GET | /api/missions/{missionId}/qna/{qnaId} | QnA 상세 및 답변 조회 | |
| Mission | QnA 질문 작성 | POST | /api/missions/{missionId}/qna | QnA 질문 작성 | 인증 필요, 뱃지 불필요 |
| Mission | QnA 답변 작성 | POST | /api/missions/{missionId}/qna/{qnaId}/answers | QnA 답변 작성 | 인증 필요, 뱃지 필요 |
| Mission | QnA 답변 채택 | PUT | /api/missions/{missionId}/qna/{qnaId}/answers/{answerId}/accept | QnA 답변 채택 | 질문자만 가능 |

### CustomMission (커스텀 미션)
| 도메인 | 이름 | 메서드 | 엔드포인트 | 설명 | 비고 |
|--------|------|--------|-----------|------|------|
| CustomMission | 목록 조회 | GET | /api/custom-missions | 공개된 커스텀 미션 목록 | verificationType 필터 |
| CustomMission | 상세 조회 | GET | /api/custom-missions/{customMissionId} | 커스텀 미션 상세 조회 | |
| CustomMission | 생성 | POST | /api/custom-missions | 커스텀 미션 생성 | 인증 필요 |
| CustomMission | 수정 | PUT | /api/custom-missions/{customMissionId} | 커스텀 미션 수정 | 생성자만 가능 |
| CustomMission | 삭제 | DELETE | /api/custom-missions/{customMissionId} | 커스텀 미션 삭제 | 생성자만 가능 |

### UserMission (내 미션)
| 도메인 | 이름 | 메서드 | 엔드포인트 | 설명 | 비고 |
|--------|------|--------|-----------|------|------|
| UserMission | 내 미션 목록 | GET | /api/user-missions | 할당된 미션 목록 조회 | status, missionType 필터 |
| UserMission | 내 미션 상세 | GET | /api/user-missions/{userMissionId} | 할당된 미션 상세 조회 | |
| UserMission | 커스텀 미션 추가 | POST | /api/user-missions | 커스텀 미션을 내 미션에 추가 | 인증 필요 |
| UserMission | 미션 인증 | POST | /api/user-missions/{userMissionId}/verify | GPS/TIME 인증 처리 | 인증 필요 |

### Verification (인증 게시판)
| 도메인 | 이름 | 메서드 | 엔드포인트 | 설명 | 비고 |
|--------|------|--------|-----------|------|------|
| Verification | 인증글 목록 | GET | /api/verifications | 인증글 목록 조회 | status, missionId 필터 |
| Verification | 인증글 상세 | GET | /api/verifications/{verificationId} | 인증글 상세 조회 | |
| Verification | 인증글 작성 | POST | /api/verifications | COMMUNITY 인증글 작성 | 인증 필요 |
| Verification | 인증글 수정 | PUT | /api/verifications/{verificationId} | 인증글 수정 | PENDING 상태만 |
| Verification | 인증글 삭제 | DELETE | /api/verifications/{verificationId} | 인증글 삭제 | PENDING 상태만 |
| Verification | 인증 투표 | POST | /api/verifications/{verificationId}/votes | 인증글에 투표 | 본인 글 투표 불가 |

### Post (자유 게시판)
| 도메인 | 이름 | 메서드 | 엔드포인트 | 설명 | 비고 |
|--------|------|--------|-----------|------|------|
| Post | 게시글 목록 | GET | /api/posts | 게시글 목록 조회 | missionId, badgeOnly 필터 |
| Post | 게시글 상세 | GET | /api/posts/{postId} | 게시글 상세 조회 | |
| Post | 게시글 작성 | POST | /api/posts | 게시글 작성 | 인증 필요, 미션 태그 선택 |
| Post | 게시글 수정 | PUT | /api/posts/{postId} | 게시글 수정 | 작성자만 가능 |
| Post | 게시글 삭제 | DELETE | /api/posts/{postId} | 게시글 삭제 | 작성자만 가능 |
| Post | 댓글 목록 | GET | /api/posts/{postId}/comments | 댓글 목록 조회 | 페이지네이션 |
| Post | 댓글 작성 | POST | /api/posts/{postId}/comments | 댓글 작성 | 인증 필요 |
| Post | 댓글 수정 | PUT | /api/posts/{postId}/comments/{commentId} | 댓글 수정 | 작성자만 가능 |
| Post | 댓글 삭제 | DELETE | /api/posts/{postId}/comments/{commentId} | 댓글 삭제 | 작성자만 가능 |

### Badge (뱃지)
| 도메인 | 이름 | 메서드 | 엔드포인트 | 설명 | 비고 |
|--------|------|--------|-----------|------|------|
| Badge | 유효 뱃지 목록 | GET | /api/badges | 현재 유효한 뱃지 목록 | 인증 필요 |
| Badge | 뱃지 히스토리 | GET | /api/badges/history | 전체 뱃지 내역 조회 | 만료 포함 |

### Recommendation (유저 추천)
| 도메인 | 이름 | 메서드 | 엔드포인트 | 설명 | 비고 |
|--------|------|--------|-----------|------|------|
| Recommendation | 추천 목록 | GET | /api/recommendations | 받은 추천 목록 조회 | status 필터 |
| Recommendation | 추천 수락 | POST | /api/recommendations/{recommendationId}/accept | 추천 수락 및 채팅방 생성 | 인증 필요 |
| Recommendation | 추천 거절 | POST | /api/recommendations/{recommendationId}/reject | 추천 거절 | 인증 필요 |

### Chat (채팅)
| 도메인 | 이름 | 메서드 | 엔드포인트 | 설명 | 비고 |
|--------|------|--------|-----------|------|------|
| Chat | 채팅방 목록 | GET | /api/chat/rooms | 내 채팅방 목록 조회 | 인증 필요 |
| Chat | 채팅방 상세 | GET | /api/chat/rooms/{roomId} | 채팅방 정보 조회 | |
| Chat | 메시지 목록 | GET | /api/chat/rooms/{roomId}/messages | 채팅 메시지 조회 | 커서 기반 페이지네이션 |
| Chat | 메시지 전송 | POST | /api/chat/rooms/{roomId}/messages | 메시지 전송 | 활성 채팅방만 |
| Chat | 메시지 읽음 | PUT | /api/chat/rooms/{roomId}/messages/read | 메시지 읽음 처리 | 인증 필요 |

### Notification (알림)
| 도메인 | 이름 | 메서드 | 엔드포인트 | 설명 | 비고 |
|--------|------|--------|-----------|------|------|
| Notification | 알림 목록 | GET | /api/notifications | 알림 목록 조회 | isRead 필터 |
| Notification | 알림 읽음 | PUT | /api/notifications/{notificationId}/read | 단일 알림 읽음 처리 | 인증 필요 |
| Notification | 전체 읽음 | PUT | /api/notifications/read-all | 모든 알림 읽음 처리 | 인증 필요 |

---

## 목차
1. [인증 (Auth)](#1-인증-auth)
2. [사용자 (User)](#2-사용자-user)
3. [펫 (Reant)](#3-펫-reant)
4. [시스템 미션 (Mission)](#4-시스템-미션-mission)
5. [커스텀 미션 (CustomMission)](#5-커스텀-미션-custommission)
6. [내 미션 (UserMission)](#6-내-미션-usermission)
7. [인증 게시판 (Verification)](#7-인증-게시판-verification)
8. [자유 게시판 (Post)](#8-자유-게시판-post)
9. [뱃지 (Badge)](#9-뱃지-badge)
10. [유저 추천 (Recommendation)](#10-유저-추천-recommendation)
11. [채팅 (Chat)](#11-채팅-chat)
12. [알림 (Notification)](#12-알림-notification)

---

## 1. 인증 (Auth)

### 1.1 OAuth 로그인/회원가입
```
POST /api/auth/oauth/{provider}
```

**Path Parameters**
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| provider | string | Y | KAKAO, GOOGLE, APPLE, NAVER |

**Request Body**
```json
{
  "accessToken": "oauth_access_token"
}
```

**Response (200 OK)**
```json
{
  "accessToken": "jwt_access_token",
  "refreshToken": "jwt_refresh_token",
  "user": {
    "id": 1,
    "email": "user@example.com",
    "nickname": "사용자",
    "profileImg": "https://..."
  },
  "isNewUser": true
}
```

---

### 1.2 토큰 갱신
```
POST /api/auth/refresh
```

**Request Body**
```json
{
  "refreshToken": "jwt_refresh_token"
}
```

**Response (200 OK)**
```json
{
  "accessToken": "new_jwt_access_token",
  "refreshToken": "new_jwt_refresh_token"
}
```

---

### 1.3 로그아웃
```
POST /api/auth/logout
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Response (200 OK)**
```json
{
  "message": "로그아웃 되었습니다."
}
```

---

## 2. 사용자 (User)

### 2.1 내 정보 조회
```
GET /api/users/me
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Response (200 OK)**
```json
{
  "id": 1,
  "email": "user@example.com",
  "nickname": "사용자",
  "birthDate": "1995-03-15",
  "gender": "MALE",
  "profileImg": "https://...",
  "createdAt": "2024-01-15T10:00:00"
}
```

---

### 2.2 내 정보 수정
```
PUT /api/users/me
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Request Body**
```json
{
  "nickname": "새닉네임",
  "birthDate": "1995-03-15",
  "gender": "MALE",
  "profileImg": "https://..."
}
```

**Response (200 OK)**
```json
{
  "id": 1,
  "email": "user@example.com",
  "nickname": "새닉네임",
  "birthDate": "1995-03-15",
  "gender": "MALE",
  "profileImg": "https://...",
  "updatedAt": "2024-01-16T12:00:00"
}
```

---

### 2.3 다른 유저 프로필 조회
```
GET /api/users/{userId}
```

**Path Parameters**
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| userId | long | Y | 사용자 ID |

**Response (200 OK)**
```json
{
  "id": 2,
  "nickname": "다른사용자",
  "profileImg": "https://...",
  "reant": {
    "name": "리앤트",
    "level": 5,
    "stage": "BABY"
  }
}
```

---

## 3. 펫 (Reant)

### 3.1 내 펫 조회
```
GET /api/reant
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Response (200 OK)**
```json
{
  "id": 1,
  "name": "리앤트",
  "level": 3,
  "exp": 150,
  "stage": "BABY",
  "appearance": {
    "color": "blue",
    "accessory": "hat"
  },
  "nextLevelExp": 200
}
```

---

### 3.2 펫 정보 수정
```
PUT /api/reant
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Request Body**
```json
{
  "name": "새이름",
  "appearance": {
    "color": "red",
    "accessory": "glasses"
  }
}
```

**Response (200 OK)**
```json
{
  "id": 1,
  "name": "새이름",
  "level": 3,
  "exp": 150,
  "stage": "BABY",
  "appearance": {
    "color": "red",
    "accessory": "glasses"
  }
}
```

---

## 4. 시스템 미션 (Mission)

### 4.1 미션 목록 조회
```
GET /api/missions
```

**Query Parameters**
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| type | string | N | DAILY, WEEKLY, MONTHLY |
| verificationType | string | N | COMMUNITY, GPS, TIME |
| page | int | N | 페이지 번호 (기본: 0) |
| size | int | N | 페이지 크기 (기본: 20) |

**Response (200 OK)**
```json
{
  "content": [
    {
      "id": 1,
      "title": "아침 스트레칭",
      "description": "10분간 스트레칭하기",
      "type": "DAILY",
      "verificationType": "TIME",
      "requiredMinutes": 10,
      "expReward": 10,
      "badgeDurationDays": 3
    },
    {
      "id": 2,
      "title": "공원 산책하기",
      "description": "가까운 공원에서 산책하기",
      "type": "DAILY",
      "verificationType": "GPS",
      "gpsLatitude": 37.5665,
      "gpsLongitude": 126.9780,
      "gpsRadiusMeters": 100,
      "expReward": 15,
      "badgeDurationDays": 3
    }
  ],
  "totalElements": 50,
  "totalPages": 3,
  "number": 0
}
```

---

### 4.2 미션 상세 조회
```
GET /api/missions/{missionId}
```

**Path Parameters**
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| missionId | long | Y | 미션 ID |

**Response (200 OK)**
```json
{
  "id": 1,
  "title": "아침 스트레칭",
  "description": "10분간 스트레칭하기",
  "type": "DAILY",
  "verificationType": "TIME",
  "requiredMinutes": 10,
  "expReward": 10,
  "badgeDurationDays": 3,
  "reviewCount": 25,
  "qnaCount": 10
}
```

---

### 4.3 미션 리뷰 목록 조회
```
GET /api/missions/{missionId}/reviews
```

**Path Parameters**
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| missionId | long | Y | 미션 ID |

**Query Parameters**
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| page | int | N | 페이지 번호 (기본: 0) |
| size | int | N | 페이지 크기 (기본: 20) |

**Response (200 OK)**
```json
{
  "content": [
    {
      "id": 1,
      "userId": 1,
      "userNickname": "사용자1",
      "userProfileImg": "https://...",
      "content": "아침에 하면 개운해요!",
      "createdAt": "2024-01-15T08:00:00"
    }
  ],
  "totalElements": 25,
  "totalPages": 2,
  "number": 0
}
```

---

### 4.4 미션 리뷰 작성
```
POST /api/missions/{missionId}/reviews
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Path Parameters**
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| missionId | long | Y | 미션 ID |

**Request Body**
```json
{
  "content": "정말 좋은 미션이에요!"
}
```

**Response (201 Created)**
```json
{
  "id": 10,
  "missionId": 1,
  "userId": 1,
  "content": "정말 좋은 미션이에요!",
  "createdAt": "2024-01-16T10:00:00"
}
```

**Error Response (403 Forbidden)**
```json
{
  "error": "BADGE_REQUIRED",
  "message": "유효한 뱃지가 없습니다."
}
```

---

### 4.5 미션 QnA 목록 조회
```
GET /api/missions/{missionId}/qna
```

**Path Parameters**
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| missionId | long | Y | 미션 ID |

**Query Parameters**
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| page | int | N | 페이지 번호 (기본: 0) |
| size | int | N | 페이지 크기 (기본: 20) |

**Response (200 OK)**
```json
{
  "content": [
    {
      "id": 1,
      "questionerId": 2,
      "questionerNickname": "질문자",
      "question": "실내에서 해도 되나요?",
      "isResolved": true,
      "answerCount": 3,
      "createdAt": "2024-01-15T09:00:00"
    }
  ],
  "totalElements": 10,
  "totalPages": 1,
  "number": 0
}
```

---

### 4.6 미션 QnA 상세 조회
```
GET /api/missions/{missionId}/qna/{qnaId}
```

**Response (200 OK)**
```json
{
  "id": 1,
  "questionerId": 2,
  "questionerNickname": "질문자",
  "question": "실내에서 해도 되나요?",
  "isResolved": true,
  "createdAt": "2024-01-15T09:00:00",
  "answers": [
    {
      "id": 1,
      "answererId": 1,
      "answererNickname": "답변자",
      "content": "네, 실내에서도 가능해요!",
      "isAccepted": true,
      "createdAt": "2024-01-15T10:00:00"
    }
  ]
}
```

---

### 4.7 미션 QnA 질문 작성
```
POST /api/missions/{missionId}/qna
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Request Body**
```json
{
  "question": "비가 와도 할 수 있나요?"
}
```

**Response (201 Created)**
```json
{
  "id": 5,
  "missionId": 1,
  "questionerId": 1,
  "question": "비가 와도 할 수 있나요?",
  "isResolved": false,
  "createdAt": "2024-01-16T11:00:00"
}
```

---

### 4.8 미션 QnA 답변 작성
```
POST /api/missions/{missionId}/qna/{qnaId}/answers
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Request Body**
```json
{
  "content": "네, 우산 쓰고 하셔도 됩니다!"
}
```

**Response (201 Created)**
```json
{
  "id": 3,
  "qnaId": 5,
  "answererId": 2,
  "content": "네, 우산 쓰고 하셔도 됩니다!",
  "isAccepted": false,
  "createdAt": "2024-01-16T12:00:00"
}
```

**Error Response (403 Forbidden)**
```json
{
  "error": "BADGE_REQUIRED",
  "message": "유효한 뱃지가 없습니다."
}
```

---

### 4.9 미션 QnA 답변 채택
```
PUT /api/missions/{missionId}/qna/{qnaId}/answers/{answerId}/accept
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Response (200 OK)**
```json
{
  "id": 3,
  "qnaId": 5,
  "isAccepted": true,
  "message": "답변이 채택되었습니다."
}
```

**Error Response (403 Forbidden)**
```json
{
  "error": "NOT_QUESTIONER",
  "message": "질문 작성자만 채택할 수 있습니다."
}
```

---

## 5. 커스텀 미션 (CustomMission)

### 5.1 커스텀 미션 목록 조회
```
GET /api/custom-missions
```

**Query Parameters**
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| verificationType | string | N | COMMUNITY, GPS, TIME |
| page | int | N | 페이지 번호 (기본: 0) |
| size | int | N | 페이지 크기 (기본: 20) |

**Response (200 OK)**
```json
{
  "content": [
    {
      "id": 1,
      "title": "하루 물 2L 마시기",
      "description": "건강을 위해 물 2L 마시기",
      "creatorId": 5,
      "creatorNickname": "건강왕",
      "durationDays": 7,
      "verificationType": "COMMUNITY",
      "expReward": 30,
      "badgeDurationDays": 5,
      "participantCount": 150
    }
  ],
  "totalElements": 30,
  "totalPages": 2,
  "number": 0
}
```

---

### 5.2 커스텀 미션 상세 조회
```
GET /api/custom-missions/{customMissionId}
```

**Response (200 OK)**
```json
{
  "id": 1,
  "title": "하루 물 2L 마시기",
  "description": "건강을 위해 물 2L 마시기",
  "creatorId": 5,
  "creatorNickname": "건강왕",
  "durationDays": 7,
  "isPublic": true,
  "verificationType": "COMMUNITY",
  "expReward": 30,
  "badgeDurationDays": 5,
  "participantCount": 150,
  "completionCount": 120,
  "createdAt": "2024-01-10T10:00:00"
}
```

---

### 5.3 커스텀 미션 생성
```
POST /api/custom-missions
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Request Body**
```json
{
  "title": "매일 독서 30분",
  "description": "하루 30분씩 책 읽기",
  "durationDays": 14,
  "isPublic": true,
  "verificationType": "TIME",
  "requiredMinutes": 30,
  "expReward": 20,
  "badgeDurationDays": 7
}
```

**GPS 미션인 경우**
```json
{
  "title": "한강공원 방문하기",
  "description": "한강공원에서 산책하기",
  "durationDays": 7,
  "isPublic": true,
  "verificationType": "GPS",
  "gpsLatitude": 37.5171,
  "gpsLongitude": 127.0068,
  "gpsRadiusMeters": 200,
  "expReward": 25,
  "badgeDurationDays": 5
}
```

**Response (201 Created)**
```json
{
  "id": 10,
  "title": "매일 독서 30분",
  "description": "하루 30분씩 책 읽기",
  "creatorId": 1,
  "durationDays": 14,
  "isPublic": true,
  "verificationType": "TIME",
  "requiredMinutes": 30,
  "expReward": 20,
  "badgeDurationDays": 7,
  "createdAt": "2024-01-16T10:00:00"
}
```

---

### 5.4 커스텀 미션 수정
```
PUT /api/custom-missions/{customMissionId}
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Request Body**
```json
{
  "title": "매일 독서 1시간",
  "description": "하루 1시간씩 책 읽기",
  "isPublic": true
}
```

**Response (200 OK)**
```json
{
  "id": 10,
  "title": "매일 독서 1시간",
  "description": "하루 1시간씩 책 읽기",
  "isPublic": true,
  "updatedAt": "2024-01-16T12:00:00"
}
```

**Error Response (403 Forbidden)**
```json
{
  "error": "NOT_CREATOR",
  "message": "미션 생성자만 수정할 수 있습니다."
}
```

---

### 5.5 커스텀 미션 삭제
```
DELETE /api/custom-missions/{customMissionId}
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Response (200 OK)**
```json
{
  "message": "미션이 삭제되었습니다."
}
```

**Error Response (403 Forbidden)**
```json
{
  "error": "NOT_CREATOR",
  "message": "미션 생성자만 삭제할 수 있습니다."
}
```

---

## 6. 내 미션 (UserMission)

### 6.1 내 미션 목록 조회
```
GET /api/user-missions
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Query Parameters**
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| status | string | N | ASSIGNED, PENDING, COMPLETED, EXPIRED |
| missionType | string | N | SYSTEM, CUSTOM |
| page | int | N | 페이지 번호 (기본: 0) |
| size | int | N | 페이지 크기 (기본: 20) |

**Response (200 OK)**
```json
{
  "content": [
    {
      "id": 1,
      "missionType": "SYSTEM",
      "mission": {
        "id": 1,
        "title": "아침 스트레칭",
        "type": "DAILY",
        "verificationType": "TIME",
        "requiredMinutes": 10
      },
      "assignedAt": "2024-01-16T00:00:00",
      "dueDate": "2024-01-16T23:59:59",
      "status": "ASSIGNED"
    },
    {
      "id": 2,
      "missionType": "CUSTOM",
      "customMission": {
        "id": 1,
        "title": "하루 물 2L 마시기",
        "durationDays": 7,
        "verificationType": "COMMUNITY"
      },
      "assignedAt": "2024-01-15T10:00:00",
      "dueDate": "2024-01-22T10:00:00",
      "status": "ASSIGNED"
    }
  ],
  "totalElements": 5,
  "totalPages": 1,
  "number": 0
}
```

---

### 6.2 내 미션 상세 조회
```
GET /api/user-missions/{userMissionId}
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Response (200 OK)**
```json
{
  "id": 1,
  "missionType": "SYSTEM",
  "mission": {
    "id": 1,
    "title": "아침 스트레칭",
    "description": "10분간 스트레칭하기",
    "type": "DAILY",
    "verificationType": "TIME",
    "requiredMinutes": 10,
    "expReward": 10,
    "badgeDurationDays": 3
  },
  "assignedAt": "2024-01-16T00:00:00",
  "dueDate": "2024-01-16T23:59:59",
  "status": "ASSIGNED",
  "verification": null
}
```

---

### 6.3 커스텀 미션 추가
```
POST /api/user-missions
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Request Body**
```json
{
  "customMissionId": 1
}
```

**Response (201 Created)**
```json
{
  "id": 10,
  "customMission": {
    "id": 1,
    "title": "하루 물 2L 마시기"
  },
  "assignedAt": "2024-01-16T10:00:00",
  "dueDate": "2024-01-23T10:00:00",
  "status": "ASSIGNED"
}
```

---

### 6.4 미션 인증 (GPS)
```
POST /api/user-missions/{userMissionId}/verify
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Request Body**
```json
{
  "type": "GPS",
  "latitude": 37.5668,
  "longitude": 126.9775
}
```

**Response (200 OK)**
```json
{
  "userMissionId": 1,
  "status": "COMPLETED",
  "verification": {
    "gpsLatitude": 37.5668,
    "gpsLongitude": 126.9775,
    "gpsDistanceMeters": 52,
    "verifiedAt": "2024-01-16T14:30:00"
  },
  "rewards": {
    "expEarned": 10,
    "badge": {
      "id": 1,
      "expiresAt": "2024-01-19T14:30:00"
    }
  },
  "recommendation": {
    "id": 1,
    "recommendedUserId": 5,
    "recommendedUserNickname": "산책러버"
  }
}
```

**Error Response (400 Bad Request)**
```json
{
  "error": "GPS_OUT_OF_RANGE",
  "message": "목표 위치에서 너무 멀리 있습니다.",
  "distance": 250,
  "requiredRadius": 100
}
```

---

### 6.5 미션 인증 (TIME)
```
POST /api/user-missions/{userMissionId}/verify
```

**Request Body**
```json
{
  "type": "TIME",
  "startedAt": "2024-01-16T07:00:00",
  "endedAt": "2024-01-16T07:12:00"
}
```

**Response (200 OK)**
```json
{
  "userMissionId": 1,
  "status": "COMPLETED",
  "verification": {
    "timeStartedAt": "2024-01-16T07:00:00",
    "timeEndedAt": "2024-01-16T07:12:00",
    "timeActualMinutes": 12,
    "verifiedAt": "2024-01-16T07:12:00"
  },
  "rewards": {
    "expEarned": 10,
    "badge": {
      "id": 2,
      "expiresAt": "2024-01-19T07:12:00"
    }
  }
}
```

**Error Response (400 Bad Request)**
```json
{
  "error": "TIME_NOT_ENOUGH",
  "message": "필요 시간을 충족하지 못했습니다.",
  "actualMinutes": 8,
  "requiredMinutes": 10
}
```

---

## 7. 인증 게시판 (Verification)

### 7.1 인증글 목록 조회
```
GET /api/verifications
```

**Query Parameters**
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| status | string | N | PENDING, APPROVED, REJECTED |
| missionId | long | N | 시스템 미션 ID |
| customMissionId | long | N | 커스텀 미션 ID |
| page | int | N | 페이지 번호 (기본: 0) |
| size | int | N | 페이지 크기 (기본: 20) |

**Response (200 OK)**
```json
{
  "content": [
    {
      "id": 1,
      "userId": 1,
      "userNickname": "사용자",
      "userProfileImg": "https://...",
      "missionTitle": "오늘의 감사 기록",
      "content": "오늘 부모님께 감사했습니다...",
      "imageUrls": ["https://..."],
      "status": "PENDING",
      "approveCount": 2,
      "rejectCount": 0,
      "createdAt": "2024-01-16T15:00:00"
    }
  ],
  "totalElements": 50,
  "totalPages": 3,
  "number": 0
}
```

---

### 7.2 인증글 상세 조회
```
GET /api/verifications/{verificationId}
```

**Response (200 OK)**
```json
{
  "id": 1,
  "userId": 1,
  "userNickname": "사용자",
  "userProfileImg": "https://...",
  "userMissionId": 3,
  "missionType": "SYSTEM",
  "mission": {
    "id": 22,
    "title": "오늘의 감사 기록",
    "type": "DAILY"
  },
  "content": "오늘 부모님께 감사했습니다...",
  "imageUrls": ["https://..."],
  "status": "PENDING",
  "approveCount": 2,
  "rejectCount": 0,
  "createdAt": "2024-01-16T15:00:00",
  "myVote": null
}
```

---

### 7.3 인증글 작성
```
POST /api/verifications
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Request Body**
```json
{
  "userMissionId": 3,
  "content": "오늘 부모님께 감사했습니다...",
  "imageUrls": ["https://..."]
}
```

**Response (201 Created)**
```json
{
  "id": 1,
  "userMissionId": 3,
  "content": "오늘 부모님께 감사했습니다...",
  "imageUrls": ["https://..."],
  "status": "PENDING",
  "createdAt": "2024-01-16T15:00:00"
}
```

---

### 7.4 인증글 수정
```
PUT /api/verifications/{verificationId}
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Request Body**
```json
{
  "content": "수정된 내용입니다...",
  "imageUrls": ["https://new-image.jpg"]
}
```

**Response (200 OK)**
```json
{
  "id": 1,
  "content": "수정된 내용입니다...",
  "imageUrls": ["https://new-image.jpg"],
  "status": "PENDING",
  "updatedAt": "2024-01-16T16:00:00"
}
```

**Error Response (403 Forbidden)**
```json
{
  "error": "MODIFICATION_NOT_ALLOWED",
  "message": "인증 완료 후에는 수정할 수 없습니다."
}
```

---

### 7.5 인증글 삭제
```
DELETE /api/verifications/{verificationId}
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Response (200 OK)**
```json
{
  "message": "인증글이 삭제되었습니다."
}
```

**Error Response (403 Forbidden)**
```json
{
  "error": "DELETION_NOT_ALLOWED",
  "message": "인증 완료 후에는 삭제할 수 없습니다."
}
```

---

### 7.6 인증 투표
```
POST /api/verifications/{verificationId}/votes
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Request Body**
```json
{
  "vote": "APPROVE"
}
```

**Response (200 OK)**
```json
{
  "verificationId": 1,
  "vote": "APPROVE",
  "approveCount": 3,
  "rejectCount": 0,
  "status": "APPROVED",
  "message": "인증이 승인되었습니다."
}
```

**Error Response (400 Bad Request)**
```json
{
  "error": "ALREADY_VOTED",
  "message": "이미 투표하셨습니다."
}
```

**Error Response (403 Forbidden)**
```json
{
  "error": "SELF_VOTE_NOT_ALLOWED",
  "message": "본인 글에는 투표할 수 없습니다."
}
```

---

## 8. 자유 게시판 (Post)

### 8.1 게시글 목록 조회
```
GET /api/posts
```

**Query Parameters**
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| missionId | long | N | 시스템 미션 ID로 필터 |
| customMissionId | long | N | 커스텀 미션 ID로 필터 |
| badgeOnly | boolean | N | 뱃지 보유자 글만 (기본: false) |
| page | int | N | 페이지 번호 (기본: 0) |
| size | int | N | 페이지 크기 (기본: 20) |

**Response (200 OK)**
```json
{
  "content": [
    {
      "id": 1,
      "userId": 1,
      "userNickname": "사용자",
      "userProfileImg": "https://...",
      "missionTag": {
        "id": 15,
        "title": "공원 산책하기",
        "type": "SYSTEM"
      },
      "title": "오늘 산책 후기",
      "content": "공원이 너무 좋았어요!",
      "imageUrls": ["https://..."],
      "hasValidBadge": true,
      "commentCount": 5,
      "createdAt": "2024-01-16T18:00:00"
    }
  ],
  "totalElements": 100,
  "totalPages": 5,
  "number": 0
}
```

---

### 8.2 게시글 상세 조회
```
GET /api/posts/{postId}
```

**Response (200 OK)**
```json
{
  "id": 1,
  "userId": 1,
  "userNickname": "사용자",
  "userProfileImg": "https://...",
  "missionTag": {
    "id": 15,
    "title": "공원 산책하기",
    "type": "SYSTEM"
  },
  "title": "오늘 산책 후기",
  "content": "공원이 너무 좋았어요!",
  "imageUrls": ["https://..."],
  "hasValidBadge": true,
  "commentCount": 5,
  "createdAt": "2024-01-16T18:00:00",
  "updatedAt": "2024-01-16T18:00:00"
}
```

---

### 8.3 게시글 작성
```
POST /api/posts
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Request Body**
```json
{
  "missionId": 15,
  "title": "오늘 산책 후기",
  "content": "공원이 너무 좋았어요!",
  "imageUrls": ["https://..."]
}
```

**커스텀 미션 태그인 경우**
```json
{
  "customMissionId": 1,
  "title": "물 마시기 성공!",
  "content": "오늘도 2L 달성!",
  "imageUrls": []
}
```

**미션 태그 없는 경우**
```json
{
  "title": "그냥 일상 글",
  "content": "오늘 하루 이야기...",
  "imageUrls": []
}
```

**Response (201 Created)**
```json
{
  "id": 10,
  "missionTag": {
    "id": 15,
    "title": "공원 산책하기"
  },
  "title": "오늘 산책 후기",
  "content": "공원이 너무 좋았어요!",
  "imageUrls": ["https://..."],
  "hasValidBadge": true,
  "createdAt": "2024-01-16T18:00:00"
}
```

---

### 8.4 게시글 수정
```
PUT /api/posts/{postId}
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Request Body**
```json
{
  "title": "수정된 제목",
  "content": "수정된 내용",
  "imageUrls": ["https://new-image.jpg"]
}
```

**Response (200 OK)**
```json
{
  "id": 10,
  "title": "수정된 제목",
  "content": "수정된 내용",
  "imageUrls": ["https://new-image.jpg"],
  "updatedAt": "2024-01-16T19:00:00"
}
```

---

### 8.5 게시글 삭제
```
DELETE /api/posts/{postId}
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Response (200 OK)**
```json
{
  "message": "게시글이 삭제되었습니다."
}
```

---

### 8.6 댓글 목록 조회
```
GET /api/posts/{postId}/comments
```

**Query Parameters**
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| page | int | N | 페이지 번호 (기본: 0) |
| size | int | N | 페이지 크기 (기본: 20) |

**Response (200 OK)**
```json
{
  "content": [
    {
      "id": 1,
      "userId": 2,
      "userNickname": "댓글러",
      "userProfileImg": "https://...",
      "content": "좋은 글이네요!",
      "createdAt": "2024-01-16T19:00:00"
    }
  ],
  "totalElements": 5,
  "totalPages": 1,
  "number": 0
}
```

---

### 8.7 댓글 작성
```
POST /api/posts/{postId}/comments
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Request Body**
```json
{
  "content": "좋은 글이네요!"
}
```

**Response (201 Created)**
```json
{
  "id": 10,
  "postId": 1,
  "userId": 1,
  "content": "좋은 글이네요!",
  "createdAt": "2024-01-16T19:30:00"
}
```

---

### 8.8 댓글 수정
```
PUT /api/posts/{postId}/comments/{commentId}
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Request Body**
```json
{
  "content": "수정된 댓글입니다."
}
```

**Response (200 OK)**
```json
{
  "id": 10,
  "content": "수정된 댓글입니다.",
  "updatedAt": "2024-01-16T20:00:00"
}
```

---

### 8.9 댓글 삭제
```
DELETE /api/posts/{postId}/comments/{commentId}
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Response (200 OK)**
```json
{
  "message": "댓글이 삭제되었습니다."
}
```

---

## 9. 뱃지 (Badge)

### 9.1 내 유효 뱃지 목록 조회
```
GET /api/badges
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Response (200 OK)**
```json
{
  "badges": [
    {
      "id": 1,
      "missionType": "SYSTEM",
      "mission": {
        "id": 15,
        "title": "공원 산책하기"
      },
      "issuedAt": "2024-01-16T14:30:00",
      "expiresAt": "2024-01-19T14:30:00",
      "remainingDays": 2
    },
    {
      "id": 2,
      "missionType": "CUSTOM",
      "customMission": {
        "id": 1,
        "title": "하루 물 2L 마시기"
      },
      "issuedAt": "2024-01-15T10:00:00",
      "expiresAt": "2024-01-20T10:00:00",
      "remainingDays": 3
    }
  ],
  "totalCount": 2
}
```

---

### 9.2 뱃지 히스토리 조회
```
GET /api/badges/history
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Query Parameters**
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| page | int | N | 페이지 번호 (기본: 0) |
| size | int | N | 페이지 크기 (기본: 20) |

**Response (200 OK)**
```json
{
  "content": [
    {
      "id": 1,
      "missionType": "SYSTEM",
      "mission": {
        "id": 15,
        "title": "공원 산책하기"
      },
      "issuedAt": "2024-01-16T14:30:00",
      "expiresAt": "2024-01-19T14:30:00",
      "isExpired": false
    },
    {
      "id": 0,
      "missionType": "SYSTEM",
      "mission": {
        "id": 10,
        "title": "아침 스트레칭"
      },
      "issuedAt": "2024-01-10T07:00:00",
      "expiresAt": "2024-01-13T07:00:00",
      "isExpired": true
    }
  ],
  "totalElements": 15,
  "totalPages": 1,
  "number": 0
}
```

---

## 10. 유저 추천 (Recommendation)

### 10.1 추천 목록 조회
```
GET /api/recommendations
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Query Parameters**
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| status | string | N | PENDING, ACCEPTED, REJECTED, EXPIRED |

**Response (200 OK)**
```json
{
  "recommendations": [
    {
      "id": 1,
      "recommendedUser": {
        "id": 5,
        "nickname": "산책러버",
        "profileImg": "https://...",
        "reant": {
          "name": "리앤트",
          "level": 7,
          "stage": "ADULT"
        }
      },
      "mission": {
        "id": 15,
        "title": "공원 산책하기",
        "type": "SYSTEM"
      },
      "matchReason": {
        "ageDiff": 3,
        "sameGender": true
      },
      "status": "PENDING",
      "expiresAt": "2024-01-23T14:30:00",
      "createdAt": "2024-01-16T14:30:00"
    }
  ],
  "totalCount": 1
}
```

---

### 10.2 추천 수락
```
POST /api/recommendations/{recommendationId}/accept
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Response (200 OK)**
```json
{
  "recommendationId": 1,
  "status": "ACCEPTED",
  "chatRoom": {
    "id": 1,
    "otherUser": {
      "id": 5,
      "nickname": "산책러버",
      "profileImg": "https://..."
    },
    "createdAt": "2024-01-16T15:00:00"
  },
  "message": "채팅방이 생성되었습니다."
}
```

---

### 10.3 추천 거절
```
POST /api/recommendations/{recommendationId}/reject
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Response (200 OK)**
```json
{
  "recommendationId": 1,
  "status": "REJECTED",
  "message": "추천을 거절했습니다."
}
```

---

## 11. 채팅 (Chat)

### 11.1 채팅방 목록 조회
```
GET /api/chat/rooms
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Response (200 OK)**
```json
{
  "rooms": [
    {
      "id": 1,
      "otherUser": {
        "id": 5,
        "nickname": "산책러버",
        "profileImg": "https://..."
      },
      "matchedMission": {
        "id": 15,
        "title": "공원 산책하기"
      },
      "lastMessage": {
        "content": "안녕하세요!",
        "createdAt": "2024-01-16T15:05:00",
        "isRead": false
      },
      "unreadCount": 1,
      "isActive": true,
      "createdAt": "2024-01-16T15:00:00"
    }
  ],
  "totalCount": 1
}
```

---

### 11.2 채팅방 상세 조회
```
GET /api/chat/rooms/{roomId}
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Response (200 OK)**
```json
{
  "id": 1,
  "otherUser": {
    "id": 5,
    "nickname": "산책러버",
    "profileImg": "https://..."
  },
  "matchedMission": {
    "id": 15,
    "title": "공원 산책하기"
  },
  "isActive": true,
  "createdAt": "2024-01-16T15:00:00"
}
```

---

### 11.3 메시지 목록 조회
```
GET /api/chat/rooms/{roomId}/messages
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Query Parameters**
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| before | long | N | 이 메시지 ID 이전 메시지 조회 (페이지네이션) |
| size | int | N | 조회 개수 (기본: 50) |

**Response (200 OK)**
```json
{
  "messages": [
    {
      "id": 1,
      "senderId": 1,
      "content": "안녕하세요!",
      "isRead": true,
      "isMine": true,
      "createdAt": "2024-01-16T15:05:00"
    },
    {
      "id": 2,
      "senderId": 5,
      "content": "안녕하세요~ 반갑습니다!",
      "isRead": true,
      "isMine": false,
      "createdAt": "2024-01-16T15:06:00"
    }
  ],
  "hasMore": false
}
```

---

### 11.4 메시지 전송
```
POST /api/chat/rooms/{roomId}/messages
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Request Body**
```json
{
  "content": "산책 어디서 주로 하세요?"
}
```

**Response (201 Created)**
```json
{
  "id": 3,
  "roomId": 1,
  "senderId": 1,
  "content": "산책 어디서 주로 하세요?",
  "isRead": false,
  "createdAt": "2024-01-16T15:10:00"
}
```

**Error Response (403 Forbidden)**
```json
{
  "error": "CHAT_ROOM_INACTIVE",
  "message": "비활성화된 채팅방입니다."
}
```

---

### 11.5 메시지 읽음 처리
```
PUT /api/chat/rooms/{roomId}/messages/read
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Response (200 OK)**
```json
{
  "roomId": 1,
  "readCount": 3,
  "message": "메시지를 읽음 처리했습니다."
}
```

---

## 12. 알림 (Notification)

### 12.1 알림 목록 조회
```
GET /api/notifications
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Query Parameters**
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| isRead | boolean | N | 읽음 여부 필터 |
| page | int | N | 페이지 번호 (기본: 0) |
| size | int | N | 페이지 크기 (기본: 20) |

**Response (200 OK)**
```json
{
  "content": [
    {
      "id": 1,
      "type": "MISSION_ASSIGNED",
      "title": "오늘의 미션이 도착했어요",
      "content": "3개의 새로운 미션이 있습니다.",
      "referenceType": null,
      "referenceId": null,
      "isRead": false,
      "createdAt": "2024-01-16T00:00:00"
    },
    {
      "id": 2,
      "type": "VERIFICATION_APPROVED",
      "title": "미션 인증이 승인됐어요!",
      "content": "'오늘의 감사 기록' 미션이 인증되었습니다.",
      "referenceType": "VERIFICATION",
      "referenceId": 1,
      "isRead": false,
      "createdAt": "2024-01-16T18:00:00"
    },
    {
      "id": 3,
      "type": "USER_RECOMMENDED",
      "title": "새로운 친구를 추천해드려요",
      "content": "같은 미션을 완료한 '산책러버'님을 만나보세요!",
      "referenceType": "USER",
      "referenceId": 5,
      "isRead": true,
      "createdAt": "2024-01-16T14:30:00"
    }
  ],
  "totalElements": 10,
  "totalPages": 1,
  "number": 0,
  "unreadCount": 2
}
```

---

### 12.2 알림 읽음 처리
```
PUT /api/notifications/{notificationId}/read
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Response (200 OK)**
```json
{
  "id": 1,
  "isRead": true,
  "message": "알림을 읽음 처리했습니다."
}
```

---

### 12.3 전체 알림 읽음 처리
```
PUT /api/notifications/read-all
```

**Headers**
| 헤더 | 필수 | 설명 |
|------|------|------|
| Authorization | Y | Bearer {accessToken} |

**Response (200 OK)**
```json
{
  "readCount": 5,
  "message": "모든 알림을 읽음 처리했습니다."
}
```

---

## 공통 에러 응답

### 401 Unauthorized
```json
{
  "error": "UNAUTHORIZED",
  "message": "인증이 필요합니다."
}
```

### 403 Forbidden
```json
{
  "error": "FORBIDDEN",
  "message": "권한이 없습니다."
}
```

### 404 Not Found
```json
{
  "error": "NOT_FOUND",
  "message": "리소스를 찾을 수 없습니다."
}
```

### 500 Internal Server Error
```json
{
  "error": "INTERNAL_SERVER_ERROR",
  "message": "서버 오류가 발생했습니다."
}
```

---

## 알림 타입 (Notification Type)

| 타입 | 설명 |
|------|------|
| MISSION_ASSIGNED | 새 미션 할당 |
| VERIFICATION_APPROVED | 인증 승인됨 |
| VERIFICATION_REJECTED | 인증 거절됨 |
| USER_RECOMMENDED | 유저 추천 |
| CHAT_MESSAGE | 새 채팅 메시지 |
| BADGE_EXPIRING | 뱃지 만료 임박 |
| QNA_ANSWERED | 내 질문에 답변 달림 |
| QNA_ACCEPTED | 내 답변이 채택됨 |
