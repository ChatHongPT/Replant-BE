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
}
