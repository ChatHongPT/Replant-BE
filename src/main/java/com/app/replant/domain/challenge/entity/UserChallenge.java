package com.app.replant.domain.challenge.entity;

import com.app.replant.domain.challenge.enums.ChallengeStatus;
import com.app.replant.domain.mission.entity.Mission;
import com.app.replant.domain.user.entity.User;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 사용자 챌린지 엔티티
 * 사용자가 참여하는 챌린지 미션의 진행 상태를 관리
 */
@Entity
@Table(name = "user_challenge", indexes = {
    @Index(name = "idx_user_challenge_user", columnList = "user_id"),
    @Index(name = "idx_user_challenge_mission", columnList = "mission_id"),
    @Index(name = "idx_user_challenge_status", columnList = "status")
})
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class UserChallenge {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mission_id", nullable = false)
    private Mission mission;  // isChallenge=true인 미션

    // 챌린지 시작일
    @Column(name = "start_date", nullable = false)
    private LocalDate startDate;

    // 챌린지 종료일
    @Column(name = "end_date", nullable = false)
    private LocalDate endDate;

    // 현재 연속 달성일
    @Column(name = "current_streak", nullable = false)
    private Integer currentStreak;

    // 총 완료일 수
    @Column(name = "total_completed_days", nullable = false)
    private Integer totalCompletedDays;

    // 챌린지 상태
    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false, length = 20)
    private ChallengeStatus status;

    // 마지막 완료 날짜
    @Column(name = "last_completed_date")
    private LocalDate lastCompletedDate;

    // 오늘 완료 여부
    @Column(name = "today_completed")
    private Boolean todayCompleted;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @Builder
    private UserChallenge(User user, Mission mission, Integer durationDays) {
        this.user = user;
        this.mission = mission;
        this.startDate = LocalDate.now();
        this.endDate = LocalDate.now().plusDays(durationDays != null ? durationDays : 7);
        this.currentStreak = 0;
        this.totalCompletedDays = 0;
        this.status = ChallengeStatus.ACTIVE;
        this.todayCompleted = false;
        this.createdAt = LocalDateTime.now();
        this.updatedAt = LocalDateTime.now();
    }

    /**
     * 오늘 챌린지 완료 처리
     */
    public void completeToday() {
        LocalDate today = LocalDate.now();

        // 이미 오늘 완료했으면 무시
        if (Boolean.TRUE.equals(this.todayCompleted) && today.equals(this.lastCompletedDate)) {
            return;
        }

        // 연속 달성 계산
        if (this.lastCompletedDate != null) {
            if (this.lastCompletedDate.equals(today.minusDays(1))) {
                // 어제 완료했으면 연속 유지
                this.currentStreak++;
            } else if (!this.lastCompletedDate.equals(today)) {
                // 어제 완료 안했으면 연속 초기화
                this.currentStreak = 1;
            }
        } else {
            this.currentStreak = 1;
        }

        this.totalCompletedDays++;
        this.lastCompletedDate = today;
        this.todayCompleted = true;
        this.updatedAt = LocalDateTime.now();

        // 챌린지 완료 체크
        checkCompletion();
    }

    /**
     * 하루가 지났을 때 오늘 완료 여부 리셋
     */
    public void resetTodayStatus() {
        LocalDate today = LocalDate.now();
        if (this.lastCompletedDate == null || !this.lastCompletedDate.equals(today)) {
            this.todayCompleted = false;
        }
    }

    /**
     * 챌린지 완료/실패 체크
     */
    private void checkCompletion() {
        LocalDate today = LocalDate.now();
        if (!today.isBefore(this.endDate)) {
            // 종료일에 도달
            if (this.totalCompletedDays >= getDurationDays() * 0.8) {  // 80% 이상 달성 시 완료
                this.status = ChallengeStatus.COMPLETED;
            } else {
                this.status = ChallengeStatus.FAILED;
            }
        }
    }

    /**
     * 챌린지 기간 (일수)
     */
    public int getDurationDays() {
        return (int) (this.endDate.toEpochDay() - this.startDate.toEpochDay());
    }

    /**
     * 진행률 계산 (0-100)
     */
    public int getProgressRate() {
        int duration = getDurationDays();
        if (duration == 0) return 100;
        return (int) Math.round((double) this.totalCompletedDays / duration * 100);
    }

    /**
     * 남은 일수
     */
    public int getRemainingDays() {
        LocalDate today = LocalDate.now();
        if (today.isAfter(this.endDate)) return 0;
        return (int) (this.endDate.toEpochDay() - today.toEpochDay());
    }

    /**
     * 활성 상태인지 확인
     */
    public boolean isActive() {
        return this.status == ChallengeStatus.ACTIVE;
    }
}
