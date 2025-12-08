package com.app.replant.domain.mission.entity;

import com.app.replant.common.BaseEntity;
import com.app.replant.domain.user.entity.User;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "mission_qna")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class MissionQna extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mission_id", nullable = false)
    private Mission mission;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "questioner_id", nullable = false)
    private User questioner;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String question;

    @Column(name = "is_resolved", nullable = false)
    private Boolean isResolved;

    @Builder
    public MissionQna(Mission mission, User questioner, String question) {
        this.mission = mission;
        this.questioner = questioner;
        this.question = question;
        this.isResolved = false;
    }

    public void markAsResolved() {
        this.isResolved = true;
    }

    public boolean isQuestioner(Long userId) {
        return this.questioner.getId().equals(userId);
    }
}
