package com.app.replant.domain.missionset.dto;

import com.app.replant.domain.mission.entity.Mission;
import com.app.replant.domain.missionset.entity.MissionSet;
import com.app.replant.domain.missionset.entity.MissionSetMission;
import com.app.replant.domain.missionset.enums.MissionSource;
import com.app.replant.domain.missionset.enums.TodoListStatus;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class TodoListDto {

    // ============ Request DTOs ============

    @Getter
    public static class CreateRequest {
        private String title;
        private String description;
        private List<Long> randomMissionIds;  // 랜덤 배정된 공식 미션 3개
        private List<Long> customMissionIds;  // 사용자 선택 커스텀 미션 2개
    }

    // ============ Response DTOs ============

    @Getter
    @Builder
    public static class InitResponse {
        private List<MissionSimpleResponse> randomMissions;  // 랜덤 배정된 공식 미션 3개
    }

    @Getter
    @Builder
    public static class SimpleResponse {
        private Long id;
        private String title;
        private String description;
        private Integer completedCount;
        private Integer totalCount;
        private Integer progressRate;
        private Boolean canCreateNew;
        private TodoListStatus status;
        private LocalDateTime createdAt;

        public static SimpleResponse from(MissionSet missionSet) {
            return SimpleResponse.builder()
                    .id(missionSet.getId())
                    .title(missionSet.getTitle())
                    .description(missionSet.getDescription())
                    .completedCount(missionSet.getCompletedCount() != null ? missionSet.getCompletedCount() : 0)
                    .totalCount(missionSet.getTotalCount() != null ? missionSet.getTotalCount() : 5)
                    .progressRate(missionSet.getProgressRate())
                    .canCreateNew(missionSet.canCreateNewTodoList())
                    .status(missionSet.getTodolistStatus())
                    .createdAt(missionSet.getCreatedAt())
                    .build();
        }
    }

    @Getter
    @Builder
    public static class DetailResponse {
        private Long id;
        private String title;
        private String description;
        private Integer completedCount;
        private Integer totalCount;
        private Integer progressRate;
        private Boolean canCreateNew;
        private TodoListStatus status;
        private List<TodoMissionInfo> missions;
        private LocalDateTime createdAt;
        private LocalDateTime updatedAt;

        public static DetailResponse from(MissionSet missionSet) {
            List<TodoMissionInfo> missionInfos = missionSet.getMissions() != null
                    ? missionSet.getMissions().stream().map(TodoMissionInfo::from).collect(Collectors.toList())
                    : new ArrayList<>();

            return DetailResponse.builder()
                    .id(missionSet.getId())
                    .title(missionSet.getTitle())
                    .description(missionSet.getDescription())
                    .completedCount(missionSet.getCompletedCount() != null ? missionSet.getCompletedCount() : 0)
                    .totalCount(missionSet.getTotalCount() != null ? missionSet.getTotalCount() : 5)
                    .progressRate(missionSet.getProgressRate())
                    .canCreateNew(missionSet.canCreateNewTodoList())
                    .status(missionSet.getTodolistStatus())
                    .missions(missionInfos)
                    .createdAt(missionSet.getCreatedAt())
                    .updatedAt(missionSet.getUpdatedAt())
                    .build();
        }
    }

    @Getter
    @Builder
    public static class TodoMissionInfo {
        private Long id;
        private Long missionId;
        private String title;
        private String description;
        private String missionType;
        private String verificationType;
        private Integer displayOrder;
        private Boolean isCompleted;
        private LocalDateTime completedAt;
        private MissionSource missionSource;

        public static TodoMissionInfo from(MissionSetMission msm) {
            Mission mission = msm.getMission();
            return TodoMissionInfo.builder()
                    .id(msm.getId())
                    .missionId(mission.getId())
                    .title(mission.getTitle())
                    .description(mission.getDescription())
                    .missionType(mission.getMissionType().name())
                    .verificationType(mission.getVerificationType().name())
                    .displayOrder(msm.getDisplayOrder())
                    .isCompleted(msm.getIsCompleted() != null ? msm.getIsCompleted() : false)
                    .completedAt(msm.getCompletedAt())
                    .missionSource(msm.getMissionSource())
                    .build();
        }
    }

    @Getter
    @Builder
    public static class MissionSimpleResponse {
        private Long id;
        private String title;
        private String description;
        private String missionType;
        private String verificationType;
        private String category;
        private Integer expReward;

        public static MissionSimpleResponse from(Mission mission) {
            return MissionSimpleResponse.builder()
                    .id(mission.getId())
                    .title(mission.getTitle())
                    .description(mission.getDescription())
                    .missionType(mission.getMissionType().name())
                    .verificationType(mission.getVerificationType().name())
                    .category(mission.getCategory().name())
                    .expReward(mission.getExpReward())
                    .build();
        }
    }

    // ============ 공개 투두리스트용 DTOs ============

    @Getter
    @Builder
    public static class PublicResponse {
        private Long id;
        private String title;
        private String description;
        private Long creatorId;
        private String creatorNickname;
        private Integer missionCount;
        private Integer addedCount;      // 담은 횟수
        private Double averageRating;    // 평균 별점
        private Integer reviewCount;     // 리뷰 수
        private LocalDateTime createdAt;

        public static PublicResponse from(MissionSet missionSet) {
            return PublicResponse.builder()
                    .id(missionSet.getId())
                    .title(missionSet.getTitle())
                    .description(missionSet.getDescription())
                    .creatorId(missionSet.getCreator().getId())
                    .creatorNickname(missionSet.getCreator().getNickname())
                    .missionCount(missionSet.getMissions() != null ? missionSet.getMissions().size() : 0)
                    .addedCount(missionSet.getAddedCount() != null ? missionSet.getAddedCount() : 0)
                    .averageRating(missionSet.getAverageRating() != null ? missionSet.getAverageRating() : 0.0)
                    .reviewCount(missionSet.getReviewCount() != null ? missionSet.getReviewCount() : 0)
                    .createdAt(missionSet.getCreatedAt())
                    .build();
        }
    }

    @Getter
    @Builder
    public static class PublicDetailResponse {
        private Long id;
        private String title;
        private String description;
        private Long creatorId;
        private String creatorNickname;
        private Integer missionCount;
        private Integer addedCount;
        private Double averageRating;
        private Integer reviewCount;
        private List<PublicMissionInfo> missions;
        private LocalDateTime createdAt;
        private LocalDateTime updatedAt;

        public static PublicDetailResponse from(MissionSet missionSet) {
            List<PublicMissionInfo> missionInfos = missionSet.getMissions() != null
                    ? missionSet.getMissions().stream().map(PublicMissionInfo::from).collect(Collectors.toList())
                    : new ArrayList<>();

            return PublicDetailResponse.builder()
                    .id(missionSet.getId())
                    .title(missionSet.getTitle())
                    .description(missionSet.getDescription())
                    .creatorId(missionSet.getCreator().getId())
                    .creatorNickname(missionSet.getCreator().getNickname())
                    .missionCount(missionInfos.size())
                    .addedCount(missionSet.getAddedCount() != null ? missionSet.getAddedCount() : 0)
                    .averageRating(missionSet.getAverageRating() != null ? missionSet.getAverageRating() : 0.0)
                    .reviewCount(missionSet.getReviewCount() != null ? missionSet.getReviewCount() : 0)
                    .missions(missionInfos)
                    .createdAt(missionSet.getCreatedAt())
                    .updatedAt(missionSet.getUpdatedAt())
                    .build();
        }
    }

    @Getter
    @Builder
    public static class PublicMissionInfo {
        private Long missionId;
        private String title;
        private String description;
        private String category;
        private String verificationType;
        private Integer expReward;
        private Integer displayOrder;

        public static PublicMissionInfo from(MissionSetMission msm) {
            Mission mission = msm.getMission();
            return PublicMissionInfo.builder()
                    .missionId(mission.getId())
                    .title(mission.getTitle())
                    .description(mission.getDescription())
                    .category(mission.getCategory().name())
                    .verificationType(mission.getVerificationType().name())
                    .expReward(mission.getExpReward())
                    .displayOrder(msm.getDisplayOrder())
                    .build();
        }
    }

    // ============ 리뷰용 DTOs ============

    @Getter
    public static class ReviewRequest {
        private Integer rating;  // 1-5
        private String content;
    }

    @Getter
    @Builder
    public static class ReviewResponse {
        private Long id;
        private Long todoListId;
        private Long userId;
        private String userNickname;
        private Integer rating;
        private String content;
        private LocalDateTime createdAt;
        private LocalDateTime updatedAt;
    }
}
