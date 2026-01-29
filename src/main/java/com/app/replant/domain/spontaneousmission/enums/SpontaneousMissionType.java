package com.app.replant.domain.spontaneousmission.enums;

import lombok.Getter;

/**
 * 돌발 미션 타입
 */
@Getter
public enum SpontaneousMissionType {
    WAKE_UP("기상"),
    MEAL_BREAKFAST("아침 식사"),
    MEAL_LUNCH("점심 식사"),
    MEAL_DINNER("저녁 식사"),
    DIARY("감성일기");

    private final String displayName;

    SpontaneousMissionType(String displayName) {
        this.displayName = displayName;
    }
}
