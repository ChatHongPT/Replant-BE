package com.app.replant.domain.reant.entity;

import com.app.replant.common.BaseEntity;
import com.app.replant.domain.reant.enums.ReantStage;
import com.app.replant.domain.user.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.Map;

@Entity
@Table(name = "reant")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Reant extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false, unique = true)
    private User user;

    @Column(nullable = false, length = 50)
    private String name;

    @Column(nullable = false)
    private Integer level;

    @Column(nullable = false)
    private Integer exp;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private ReantStage stage;

    @Column(columnDefinition = "json")
    private String appearance;

    @Builder
    private Reant(User user, String name, Integer level, Integer exp, ReantStage stage, String appearance) {
        this.user = user;
        this.name = name != null ? name : "리앤트";
        this.level = level != null ? level : 1;
        this.exp = exp != null ? exp : 0;
        this.stage = stage != null ? stage : ReantStage.EGG;
        this.appearance = appearance;
    }

    public void updateProfile(String name, String appearance) {
        if (name != null) {
            this.name = name;
        }
        if (appearance != null) {
            this.appearance = appearance;
        }
    }

    public Map<String, Object> getAppearanceAsMap() {
        if (appearance == null) {
            return new HashMap<>();
        }
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            return objectMapper.readValue(appearance, Map.class);
        } catch (JsonProcessingException e) {
            return new HashMap<>();
        }
    }

    public void addExp(int expAmount) {
        this.exp += expAmount;
        checkLevelUp();
    }

    private void checkLevelUp() {
        int nextLevelExp = calculateNextLevelExp();
        while (this.exp >= nextLevelExp) {
            this.level++;
            this.exp -= nextLevelExp;
            updateStage();
            nextLevelExp = calculateNextLevelExp();
        }
    }

    private void updateStage() {
        if (this.level >= 30) {
            this.stage = ReantStage.ADULT;
        } else if (this.level >= 15) {
            this.stage = ReantStage.TEEN;
        } else if (this.level >= 5) {
            this.stage = ReantStage.BABY;
        } else {
            this.stage = ReantStage.EGG;
        }
    }

    private int calculateNextLevelExp() {
        return this.level * 100;
    }
}
