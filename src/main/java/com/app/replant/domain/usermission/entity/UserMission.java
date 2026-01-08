package com.app.replant.domain.usermission.entity;

import com.app.replant.domain.custommission.entity.CustomMission;
import com.app.replant.domain.mission.entity.Mission;
import com.app.replant.domain.mission.enums.MissionSource;
import com.app.replant.domain.user.entity.User;
import com.app.replant.domain.usermission.enums.UserMissionStatus;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "user_mission", indexes = {
    @Index(name = "idx_user_mission_source", columnList = "mission_source")
})
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class UserMission {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    // 통합된 미션 참조 (공식 미션 + 커스텀 미션 모두)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mission_id")
    private Mission mission;

    // @deprecated - 마이그레이션 후 제거 예정 (V7 마이그레이션에서 mission_id로 통합됨)
    @Deprecated
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "custom_mission_id")
    private CustomMission customMission;

    // 미션 출처 구분 (OFFICIAL / CUSTOM)
    @Enumerated(EnumType.STRING)
    @Column(name = "mission_source")
    private MissionSource missionSource;

    @Column(name = "assigned_at", nullable = false)
    private LocalDateTime assignedAt;

    @Column(name = "due_date", nullable = false)
    private LocalDateTime dueDate;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private UserMissionStatus status;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @Builder
    private UserMission(User user, Mission mission, CustomMission customMission,
                        MissionSource missionSource, LocalDateTime assignedAt,
                        LocalDateTime dueDate, UserMissionStatus status) {
        this.user = user;
        this.mission = mission;
        this.customMission = customMission;

        // missionSource 결정 로직
        if (missionSource != null) {
            this.missionSource = missionSource;
        } else if (mission != null) {
            // 통합된 Mission 엔티티에서 직접 source 가져오기
            this.missionSource = mission.getMissionSource();
        } else if (customMission != null) {
            // 레거시: customMission 사용 시
            this.missionSource = MissionSource.CUSTOM;
        }

        this.assignedAt = assignedAt != null ? assignedAt : LocalDateTime.now();
        this.dueDate = dueDate;
        this.status = status != null ? status : UserMissionStatus.ASSIGNED;
        this.createdAt = LocalDateTime.now();
    }

    public void updateStatus(UserMissionStatus status) {
        this.status = status;
    }

    /**
     * 공식 미션 여부 확인
     */
    public boolean isOfficialMission() {
        if (this.missionSource != null) {
            return this.missionSource == MissionSource.OFFICIAL;
        }
        // 레거시 호환: mission 엔티티가 있고 공식 미션인 경우
        return this.mission != null && this.mission.isOfficialMission();
    }

    /**
     * 커스텀 미션 여부 확인
     */
    public boolean isCustomMission() {
        if (this.missionSource != null) {
            return this.missionSource == MissionSource.CUSTOM;
        }
        // 레거시 호환
        return this.customMission != null || (this.mission != null && this.mission.isCustomMission());
    }

    /**
     * @deprecated Use isOfficialMission() instead
     */
    @Deprecated
    public boolean isSystemMission() {
        return isOfficialMission();
    }

    /**
     * 미션 ID 조회 (통합된 mission 테이블 기준)
     */
    public Long getMissionId() {
        if (this.mission != null) {
            return this.mission.getId();
        }
        // 레거시 호환: customMission이 있는 경우
        if (this.customMission != null) {
            return this.customMission.getId();
        }
        return null;
    }

    /**
     * 미션 제목 조회
     */
    public String getMissionTitle() {
        if (this.mission != null) {
            return this.mission.getTitle();
        }
        // 레거시 호환
        if (this.customMission != null) {
            return this.customMission.getTitle();
        }
        return "미션";
    }

    /**
     * 미션 출처 반환
     */
    public MissionSource getMissionSource() {
        if (this.missionSource != null) {
            return this.missionSource;
        }
        // 자동 추론
        if (this.mission != null) {
            return this.mission.getMissionSource();
        }
        if (this.customMission != null) {
            return MissionSource.CUSTOM;
        }
        return null;
    }
}
