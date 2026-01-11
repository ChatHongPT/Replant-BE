package com.app.replant.domain.challenge.dto;

import com.app.replant.domain.challenge.entity.UserChallenge;
import com.app.replant.domain.challenge.enums.ChallengeStatus;
import com.app.replant.domain.mission.entity.Mission;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class ChallengeDto {

    // ============ Request DTOs ============

    @Getter
    public static class StartRequest {
        private Long missionId;  // isChallenge=true인 미션 ID
        private Integer durationDays;  // 챌린지 기간 (일수)
    }

    // ============ Response DTOs ============

    @Getter
    @Builder
    public static class SimpleResponse {
        private Long id;
        private Long missionId;
        private String missionTitle;
        private String missionDescription;
        private ChallengeStatus status;
        private Integer currentStreak;
        private Integer totalCompletedDays;
        private Integer durationDays;
        private Integer progressRate;
        private Integer remainingDays;
        private Boolean todayCompleted;
        private LocalDate startDate;
        private LocalDate endDate;

        public static SimpleResponse from(UserChallenge challenge) {
            Mission mission = challenge.getMission();
            return SimpleResponse.builder()
                    .id(challenge.getId())
                    .missionId(mission.getId())
                    .missionTitle(mission.getTitle())
                    .missionDescription(mission.getDescription())
                    .status(challenge.getStatus())
                    .currentStreak(challenge.getCurrentStreak())
                    .totalCompletedDays(challenge.getTotalCompletedDays())
                    .durationDays(challenge.getDurationDays())
                    .progressRate(challenge.getProgressRate())
                    .remainingDays(challenge.getRemainingDays())
                    .todayCompleted(challenge.getTodayCompleted())
                    .startDate(challenge.getStartDate())
                    .endDate(challenge.getEndDate())
                    .build();
        }
    }

    @Getter
    @Builder
    public static class DetailResponse {
        private Long id;
        private MissionInfo mission;
        private ChallengeStatus status;
        private Integer currentStreak;
        private Integer totalCompletedDays;
        private Integer durationDays;
        private Integer progressRate;
        private Integer remainingDays;
        private Boolean todayCompleted;
        private LocalDate startDate;
        private LocalDate endDate;
        private LocalDate lastCompletedDate;
        private LocalDateTime createdAt;

        public static DetailResponse from(UserChallenge challenge) {
            Mission mission = challenge.getMission();
            return DetailResponse.builder()
                    .id(challenge.getId())
                    .mission(MissionInfo.from(mission))
                    .status(challenge.getStatus())
                    .currentStreak(challenge.getCurrentStreak())
                    .totalCompletedDays(challenge.getTotalCompletedDays())
                    .durationDays(challenge.getDurationDays())
                    .progressRate(challenge.getProgressRate())
                    .remainingDays(challenge.getRemainingDays())
                    .todayCompleted(challenge.getTodayCompleted())
                    .startDate(challenge.getStartDate())
                    .endDate(challenge.getEndDate())
                    .lastCompletedDate(challenge.getLastCompletedDate())
                    .createdAt(challenge.getCreatedAt())
                    .build();
        }
    }

    @Getter
    @Builder
    public static class MissionInfo {
        private Long id;
        private String title;
        private String description;
        private String category;
        private String verificationType;
        private Integer expReward;
        private Integer challengeDays;

        public static MissionInfo from(Mission mission) {
            return MissionInfo.builder()
                    .id(mission.getId())
                    .title(mission.getTitle())
                    .description(mission.getDescription())
                    .category(mission.getCategory().name())
                    .verificationType(mission.getVerificationType().name())
                    .expReward(mission.getExpReward())
                    .challengeDays(mission.getChallengeDays())
                    .build();
        }
    }
}
