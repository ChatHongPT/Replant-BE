package com.app.replant.scheduler;

import com.app.replant.domain.notification.enums.NotificationType;
import com.app.replant.domain.notification.service.NotificationService;
import com.app.replant.domain.user.entity.User;
import com.app.replant.domain.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 투두리스트 생성 알림 스케줄러
 * 매일 오전 9시(KST)에 모든 활성 사용자에게 투두리스트 생성 알림 발송
 */
@Component
@RequiredArgsConstructor
@Slf4j
public class TodoReminderScheduler {

    private final UserRepository userRepository;
    private final NotificationService notificationService;

    /**
     * 매일 오전 9시(KST) 실행
     * cron: "초 분 시 일 월 요일"
     * KST = UTC+9 이므로, UTC 기준 0시(자정)가 KST 9시
     */
    @Scheduled(cron = "0 0 0 * * *", zone = "Asia/Seoul")
    public void sendDailyTodoReminder() {
        log.info("=== 투두리스트 생성 알림 스케줄러 시작 ===");

        try {
            // 모든 활성 사용자 조회
            List<User> activeUsers = userRepository.findAllActiveUsers();
            log.info("활성 사용자 수: {}", activeUsers.size());

            int successCount = 0;
            int failCount = 0;

            for (User user : activeUsers) {
                try {
                    // 알림 생성 및 발송
                    notificationService.createAndPushNotification(
                            user,
                            NotificationType.SYSTEM,
                            "투두리스트 생성 알림",
                            "투두리스트를 생성해주세요!");
                    successCount++;
                } catch (Exception e) {
                    log.error("사용자 {}에게 알림 발송 실패", user.getId(), e);
                    failCount++;
                }
            }

            log.info("=== 투두리스트 생성 알림 스케줄러 완료 === 성공: {}, 실패: {}", successCount, failCount);
        } catch (Exception e) {
            log.error("투두리스트 알림 스케줄러 실행 중 오류 발생", e);
        }
    }
}
