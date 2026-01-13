# FCM (Firebase Cloud Messaging) 설정 가이드

Replant 백엔드에 FCM 푸시 알림 기능이 추가되었습니다.

## 개요

- **SSE (Server-Sent Events)**: 사용자가 앱을 실행 중일 때 실시간 알림
- **FCM (Firebase Cloud Messaging)**: 사용자가 앱을 사용하지 않을 때 푸시 알림

## 설정 방법

### 1. Firebase 프로젝트 설정

1. [Firebase Console](https://console.firebase.google.com/) 접속
2. 기존 프로젝트 선택 또는 새 프로젝트 생성
3. 프로젝트 설정 > 서비스 계정 탭 이동
4. "새 비공개 키 생성" 클릭
5. JSON 파일 다운로드 (예: `firebase-service-account.json`)

### 2. 서비스 계정 키 파일 배치

다운로드한 JSON 파일을 다음 위치 중 하나에 배치:

**옵션 1: resources 폴더 (권장)**
```
src/main/resources/firebase-service-account.json
```

**옵션 2: 프로젝트 루트**
```
Replant-BE/firebase-service-account.json
```

**옵션 3: 절대 경로**
```
/path/to/firebase-service-account.json
```

### 3. 환경 변수 설정

`.env` 파일에 다음 설정 추가:

```env
FIREBASE_CONFIG_PATH=firebase-service-account.json
```

절대 경로를 사용하는 경우:
```env
FIREBASE_CONFIG_PATH=/path/to/firebase-service-account.json
```

### 4. Gradle 의존성 확인

`build.gradle`에 이미 추가되어 있습니다:
```gradle
implementation 'com.google.firebase:firebase-admin:9.2.0'
```

### 5. 서버 실행

```bash
./gradlew bootRun
```

서버 시작 시 다음 로그 확인:
```
[Firebase] Firebase Admin SDK 초기화 완료
```

## API 사용법

### FCM 토큰 등록

프론트엔드(React Native)에서 앱 시작 시 자동으로 호출됩니다:

```http
POST /api/notifications/fcm/token
Authorization: Bearer {JWT_TOKEN}
Content-Type: application/json

{
  "fcmToken": "사용자의_FCM_토큰"
}
```

### 알림 전송 흐름

```java
// NotificationService.createAndPushNotification() 호출 시:
// 1. DB에 알림 저장
// 2. SSE로 실시간 전송 시도 (사용자가 온라인인 경우)
// 3. SSE 실패 시 FCM으로 푸시 알림 전송 (사용자가 오프라인인 경우)

notificationService.createAndPushNotification(
    user,
    NotificationType.MISSION_ASSIGNED,
    "새로운 미션",
    "오늘의 미션이 배정되었습니다!"
);
```

## 데이터베이스 테이블

### fcm_token 테이블

```sql
CREATE TABLE fcm_token (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL UNIQUE,
    token VARCHAR(500) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id)
);
```

## 트러블슈팅

### Firebase 초기화 실패

**증상:**
```
[Firebase] Firebase 초기화 실패 - 설정 파일을 찾을 수 없습니다
```

**해결 방법:**
1. `firebase-service-account.json` 파일 위치 확인
2. `.env` 파일의 `FIREBASE_CONFIG_PATH` 경로 확인
3. 파일 읽기 권한 확인

### FCM 토큰 전송 실패

**증상:**
```
[FCM] 알림 전송 실패 - userId: 123, error: Invalid token
```

**해결 방법:**
- 안드로이드 앱의 `google-services.json`과 백엔드의 `firebase-service-account.json`이 동일한 Firebase 프로젝트인지 확인
- FCM 토큰이 만료되었을 수 있음 (자동으로 DB에서 제거됨)

### 알림이 전송되지 않음

**확인 사항:**
1. Firebase 초기화 성공 여부 (서버 로그 확인)
2. FCM 토큰 등록 여부 (DB `fcm_token` 테이블 확인)
3. 사용자 SSE 연결 상태 (온라인이면 FCM 대신 SSE 사용)

## 보안 주의사항

⚠️ **중요:** `firebase-service-account.json` 파일은 **절대 Git에 커밋하지 마세요!**

`.gitignore`에 추가:
```gitignore
# Firebase
firebase-service-account.json
**/firebase-service-account*.json
```

## 로그 확인

FCM 관련 로그는 `[FCM]` 또는 `[알림]` 태그로 필터링할 수 있습니다:

```bash
# FCM 관련 로그만 보기
./gradlew bootRun | grep "\[FCM\]"

# 알림 전송 로그 보기
./gradlew bootRun | grep "\[알림\]"
```

## 참고 자료

- [Firebase Admin SDK 문서](https://firebase.google.com/docs/admin/setup)
- [FCM 서버 구현 가이드](https://firebase.google.com/docs/cloud-messaging/server)
- [React Native Firebase 문서](https://rnfirebase.io/)
