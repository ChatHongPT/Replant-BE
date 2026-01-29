package com.app.replant.global.infrastructure.service.fcm;

import com.app.replant.domain.notification.dto.FcmSendDto;
import com.app.replant.domain.notification.entity.Notification;
import com.app.replant.domain.user.entity.User;
import com.app.replant.domain.user.repository.UserRepository;
import com.google.firebase.messaging.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * FCM SERVICE 구현체
 * FCM과 통신하여 모바일에서 받은 정보를 기반으로 메시지를 전송합니다.
 *
 * @author : lee
 * @fileName : FcmServiceImpl
 * @since : 2/21/24
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class FcmServiceImpl implements FcmService {

    private final UserRepository userRepository;

    private static final int MAX_RETRY_ATTEMPTS = 3; // 최대 재시도 횟수
    private static final long RETRY_DELAY_MS = 1000; // 재시도 간격 (1초)
    
    /**
     * FCM 토큰 마스킹 (로그 보안)
     * @param token FCM 토큰
     * @return 마스킹된 토큰 (앞 10자리 + ... + 뒤 10자리)
     */
    private String maskToken(String token) {
        if (token == null || token.length() <= 20) {
            return "***";
        }
        int visibleLength = 10;
        return token.substring(0, visibleLength) + "..." + token.substring(token.length() - visibleLength);
    }
    
    /**
     * FCM 토큰 무효화 처리 (User 테이블에서 삭제)
     * @param userId 사용자 ID
     */
    @Transactional
    private void invalidateToken(Long userId) {
        try {
            Optional<User> userOpt = userRepository.findById(userId);
            if (userOpt.isPresent()) {
                User user = userOpt.get();
                user.updateFcmToken(null);
                log.info("[FCM] 유효하지 않은 토큰 삭제 완료 - userId: {}", userId);
            }
        } catch (Exception e) {
            log.error("[FCM] 토큰 삭제 실패 - userId: {}", userId, e);
        }
    }

    /**
     * 푸시 메시지 처리를 수행하는 비즈니스 로직
     * 메시지를 구성하고 토큰을 받아서 FCM으로 메시지 처리를 수행합니다.
     *
     * @param fcmSendDto 모바일에서 전달받은 Object
     * @return 성공(1), 실패(0)
     * @throws IOException IO 예외
     */
    @Override
    public int sendMessageTo(FcmSendDto fcmSendDto) throws IOException {
        try {
            Message message = Message.builder()
                    .setToken(fcmSendDto.getToken())
                    .setNotification(com.google.firebase.messaging.Notification.builder()
                            .setTitle(fcmSendDto.getTitle())
                            .setBody(fcmSendDto.getBody())
                            .build())
                    .putData("title", fcmSendDto.getTitle())
                    .putData("body", fcmSendDto.getBody())
                    .putData("click_action", "FLUTTER_NOTIFICATION_CLICK")
                    .setAndroidConfig(AndroidConfig.builder()
                            .setNotification(AndroidNotification.builder()
                                    .setColor("#023c69")
                                    .setSound("default")
                                    .build())
                            .build())
                    .build();

            String messageId = FirebaseMessaging.getInstance().send(message);
            log.info("[FCM] 푸시 메시지 전송 성공 - messageId: {}", messageId);
            return 1;

        } catch (FirebaseMessagingException e) {
            log.error("[FCM] 푸시 메시지 전송 실패 - error: {}, errorCode: {}", e.getMessage(), e.getMessagingErrorCode());
            if (e.getMessagingErrorCode() == MessagingErrorCode.INVALID_ARGUMENT ||
                e.getMessagingErrorCode() == MessagingErrorCode.UNREGISTERED) {
                log.warn("[FCM] 유효하지 않은 FCM 토큰 - token: {}", maskToken(fcmSendDto.getToken()));
            }
            return 0;
        } catch (Exception e) {
            log.error("[FCM] 푸시 메시지 전송 중 예외 발생", e);
            return 0;
        }
    }

    /**
     * 특정 사용자에게 FCM 푸시 알림 전송
     *
     * @param userId       수신자 ID
     * @param notification 알림 엔티티
     * @return 전송 성공 여부
     */
    @Override
    public boolean sendNotification(Long userId, Notification notification) {
        try {
            // 1. User 테이블에서 FCM 토큰 조회
            Optional<User> userOpt = userRepository.findById(userId);
            if (userOpt.isEmpty() || userOpt.get().getFcmToken() == null || userOpt.get().getFcmToken().isEmpty()) {
                log.warn("[FCM] 사용자 FCM 토큰 없음 - userId: {}", userId);
                return false;
            }

            String token = userOpt.get().getFcmToken();

            // 2. 알림 데이터 생성
            Map<String, String> notificationData = buildNotificationData(notification);
            
            // 3. FCM 메시지 생성
            Message.Builder messageBuilder = Message.builder()
                    .setToken(token)
                    .setNotification(com.google.firebase.messaging.Notification.builder()
                            .setTitle(notification.getTitle())
                            .setBody(notification.getContent())
                            .build())
                    .putAllData(notificationData);
            
            // 기상 미션의 경우 deep link 추가
            if ("SPONTANEOUS_WAKE_UP".equals(notification.getType()) && 
                notificationData.containsKey("userMissionId")) {
                String userMissionId = notificationData.get("userMissionId");
                // Android용 click_action 설정 (React Native에서 사용)
                messageBuilder.setAndroidConfig(AndroidConfig.builder()
                        .setNotification(AndroidNotification.builder()
                                .setColor("#023c69") // 앱 primary 색상
                                .setSound("default")
                                .setClickAction("FLUTTER_NOTIFICATION_CLICK") // React Native에서 처리
                                .build())
                        .build());
                
                log.info("[FCM] 기상 미션 알림 - userMissionId 포함: {}", userMissionId);
            } else {
                messageBuilder.setAndroidConfig(AndroidConfig.builder()
                        .setNotification(AndroidNotification.builder()
                                .setColor("#023c69") // 앱 primary 색상
                                .setSound("default")
                                .build())
                        .build());
            }
            
            Message message = messageBuilder.build();

            // 3. FCM 전송
            String response = FirebaseMessaging.getInstance().send(message);
            log.info("[FCM] 알림 전송 성공 - userId: {}, messageId: {}", userId, response);
            return true;

        } catch (FirebaseMessagingException e) {
            log.error("[FCM] 알림 전송 실패 - userId: {}, error: {}, errorCode: {}", 
                    userId, e.getMessage(), e.getMessagingErrorCode());

            // 토큰이 유효하지 않은 경우 User 테이블에서 제거
            MessagingErrorCode errorCode = e.getMessagingErrorCode();
            if (errorCode == MessagingErrorCode.INVALID_ARGUMENT ||
                errorCode == MessagingErrorCode.UNREGISTERED) {
                log.warn("[FCM] 유효하지 않은 토큰 감지 - userId: {}, errorCode: {}, token: {}", 
                        userId, errorCode, maskToken(getUserToken(userId)));
                invalidateToken(userId);
            }
            return false;
        } catch (Exception e) {
            log.error("[FCM] 알림 전송 중 예외 발생 - userId: {}", userId, e);
            return false;
        }
    }
    
    /**
     * 사용자 FCM 토큰 조회 (내부용)
     */
    private String getUserToken(Long userId) {
        return userRepository.findById(userId)
                .map(User::getFcmToken)
                .orElse(null);
    }

    /**
     * 알림 데이터 생성 (앱에서 알림 클릭 시 사용)
     */
    private Map<String, String> buildNotificationData(Notification notification) {
        Map<String, String> data = new HashMap<>();
        data.put("id", String.valueOf(notification.getId()));
        data.put("type", notification.getType());
        data.put("title", notification.getTitle());
        data.put("content", notification.getContent());

        if (notification.getReferenceType() != null) {
            data.put("referenceType", notification.getReferenceType());
        }
        if (notification.getReferenceId() != null) {
            data.put("referenceId", String.valueOf(notification.getReferenceId()));
            
            // USER_MISSION 타입인 경우 userMissionId 필드도 추가 (프론트엔드 호환성)
            if ("USER_MISSION".equals(notification.getReferenceType())) {
                String userMissionId = String.valueOf(notification.getReferenceId());
                data.put("userMissionId", userMissionId);
                log.info("[FCM] 알림 데이터에 userMissionId 추가 - notificationId={}, type={}, userMissionId={}", 
                        notification.getId(), notification.getType(), userMissionId);
            }
        }

        log.info("[FCM] 알림 데이터 구성 완료 - notificationId={}, type={}, data={}", 
                notification.getId(), notification.getType(), data);
        return data;
    }

    /**
     * 커스텀 FCM 알림 전송
     *
     * @param userId 수신자 ID
     * @param title  제목
     * @param body   내용
     * @param data   추가 데이터
     * @return 전송 성공 여부
     */
    @Override
    public boolean sendCustomNotification(Long userId, String title, String body, Map<String, String> data) {
        try {
            // User 테이블에서 FCM 토큰 조회
            Optional<User> userOpt = userRepository.findById(userId);
            if (userOpt.isEmpty() || userOpt.get().getFcmToken() == null || userOpt.get().getFcmToken().isEmpty()) {
                log.warn("[FCM] 사용자 FCM 토큰 없음 - userId: {}", userId);
                return false;
            }

            String token = userOpt.get().getFcmToken();

            Message.Builder messageBuilder = Message.builder()
                    .setToken(token)
                    .setNotification(com.google.firebase.messaging.Notification.builder()
                            .setTitle(title)
                            .setBody(body)
                            .build())
                    .setAndroidConfig(AndroidConfig.builder()
                            .setNotification(AndroidNotification.builder()
                                    .setColor("#023c69")
                                    .setSound("default")
                                    .build())
                            .build());

            if (data != null && !data.isEmpty()) {
                messageBuilder.putAllData(data);
            }

            String response = FirebaseMessaging.getInstance().send(messageBuilder.build());
            log.info("[FCM] 커스텀 알림 전송 성공 - userId: {}, messageId: {}", userId, response);
            return true;

        } catch (FirebaseMessagingException e) {
            log.error("[FCM] 커스텀 알림 전송 실패 - userId: {}, error: {}, errorCode: {}", 
                    userId, e.getMessage(), e.getMessagingErrorCode());

            // 토큰이 유효하지 않은 경우 User 테이블에서 제거
            MessagingErrorCode errorCode = e.getMessagingErrorCode();
            if (errorCode == MessagingErrorCode.INVALID_ARGUMENT ||
                errorCode == MessagingErrorCode.UNREGISTERED) {
                log.warn("[FCM] 유효하지 않은 토큰 감지 - userId: {}, errorCode: {}, token: {}", 
                        userId, errorCode, maskToken(getUserToken(userId)));
                invalidateToken(userId);
            }
            return false;
        } catch (Exception e) {
            log.error("[FCM] 커스텀 알림 전송 중 예외 발생 - userId: {}", userId, e);
            return false;
        }
    }

    /**
     * FCM 알림 전송 (재시도 로직 포함)
     * FCM 송신 실패 시 재시도 로직 수행
     *
     * @param userId       수신자 ID
     * @param notification 알림 엔티티
     * @return 전송 성공 여부
     */
    @Override
    public boolean sendNotificationWithRetry(Long userId, Notification notification) {
        int attempt = 0;
        boolean success = false;
        
        while (attempt < MAX_RETRY_ATTEMPTS && !success) {
            attempt++;
            
            if (attempt > 1) {
                log.info("[FCM] 재시도 시도 - userId: {}, attempt: {}/{}", userId, attempt, MAX_RETRY_ATTEMPTS);
                try {
                    // 재시도 전 대기
                    Thread.sleep(RETRY_DELAY_MS);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    log.error("[FCM] 재시도 대기 중 인터럽트 발생 - userId: {}", userId);
                    return false;
                }
            }
            
            success = sendNotification(userId, notification);
            
            if (success) {
                log.info("[FCM] 알림 전송 성공 (시도 횟수: {}) - userId: {}", attempt, userId);
                return true;
            } else {
                log.warn("[FCM] 알림 전송 실패 (시도 횟수: {}) - userId: {}", attempt, userId);
            }
        }
        
        log.error("[FCM] 알림 전송 최종 실패 (최대 재시도 횟수 초과) - userId: {}, 총 시도 횟수: {}", userId, attempt);
        return false;
    }

    /**
     * 모든 활성 사용자에게 업데이트 알림 전송
     *
     * @param isRequired 강제 업데이트 여부
     * @param message 업데이트 메시지
     * @param storeUrl 스토어 URL
     * @return 전송 성공한 사용자 수
     */
    @Override
    public int sendUpdateNotificationToAllUsers(boolean isRequired, String message, String storeUrl) {
        log.info("[FCM] 모든 활성 사용자에게 업데이트 알림 전송 시작 - isRequired: {}", isRequired);
        
        List<User> activeUsers = userRepository.findAllActiveUsers();
        log.info("[FCM] 활성 사용자 수: {}", activeUsers.size());
        
        int successCount = 0;
        int failCount = 0;
        
        for (User user : activeUsers) {
            if (user.getFcmToken() == null || user.getFcmToken().isEmpty()) {
                log.debug("[FCM] FCM 토큰 없음 - userId: {}", user.getId());
                continue;
            }
            
            try {
                Map<String, String> data = new HashMap<>();
                data.put("type", "APP_UPDATE");
                data.put("isRequired", String.valueOf(isRequired));
                data.put("message", message);
                data.put("storeUrl", storeUrl);
                
                boolean success = sendCustomNotification(
                        user.getId(),
                        "업데이트 알림",
                        message,
                        data
                );
                
                if (success) {
                    successCount++;
                } else {
                    failCount++;
                }
            } catch (Exception e) {
                log.error("[FCM] 업데이트 알림 전송 실패 - userId: {}", user.getId(), e);
                failCount++;
            }
        }
        
        log.info("[FCM] 업데이트 알림 전송 완료 - 성공: {}, 실패: {}", successCount, failCount);
        return successCount;
    }
}
