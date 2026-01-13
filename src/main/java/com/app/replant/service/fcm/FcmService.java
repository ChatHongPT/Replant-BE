package com.app.replant.service.fcm;

import com.app.replant.domain.notification.entity.Notification;
import com.app.replant.domain.notification.repository.RedisFcmTokenRepository;
import com.google.firebase.messaging.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class FcmService {

    private final RedisFcmTokenRepository redisFcmTokenRepository;

    /**
     * 특정 사용자에게 FCM 푸시 알림 전송
     *
     * @param userId       수신자 ID
     * @param notification 알림 엔티티
     * @return 전송 성공 여부
     */
    public boolean sendNotification(Long userId, Notification notification) {
        try {
            // 1. Redis에서 FCM 토큰 조회
            String token = redisFcmTokenRepository.findByUserId(userId)
                    .orElse(null);

            if (token == null) {
                log.warn("[FCM] 사용자 FCM 토큰 없음 - userId: {}", userId);
                return false;
            }

            // 2. FCM 메시지 생성
            Message message = Message.builder()
                    .setToken(token)
                    .setNotification(com.google.firebase.messaging.Notification.builder()
                            .setTitle(notification.getTitle())
                            .setBody(notification.getContent())
                            .build())
                    .putAllData(buildNotificationData(notification))
                    .setAndroidConfig(AndroidConfig.builder()
                            .setNotification(AndroidNotification.builder()
                                    .setColor("#023c69") // 앱 primary 색상
                                    .setSound("default")
                                    .build())
                            .build())
                    .build();

            // 3. FCM 전송
            String response = FirebaseMessaging.getInstance().send(message);
            log.info("[FCM] 알림 전송 성공 - userId: {}, messageId: {}", userId, response);
            return true;

        } catch (FirebaseMessagingException e) {
            log.error("[FCM] 알림 전송 실패 - userId: {}, error: {}", userId, e.getMessage());

            // 토큰이 유효하지 않은 경우 Redis에서 제거
            if (e.getMessagingErrorCode() == MessagingErrorCode.INVALID_ARGUMENT ||
                e.getMessagingErrorCode() == MessagingErrorCode.UNREGISTERED) {
                log.warn("[FCM] 유효하지 않은 토큰 제거 - userId: {}", userId);
                redisFcmTokenRepository.deleteByUserId(userId);
            }
            return false;
        } catch (Exception e) {
            log.error("[FCM] 알림 전송 중 예외 발생 - userId: {}", userId, e);
            return false;
        }
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
        }

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
    public boolean sendCustomNotification(Long userId, String title, String body, Map<String, String> data) {
        try {
            String token = redisFcmTokenRepository.findByUserId(userId)
                    .orElse(null);

            if (token == null) {
                log.warn("[FCM] 사용자 FCM 토큰 없음 - userId: {}", userId);
                return false;
            }

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

        } catch (Exception e) {
            log.error("[FCM] 커스텀 알림 전송 실패 - userId: {}", userId, e);
            return false;
        }
    }
}
