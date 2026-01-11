package com.app.replant.domain.challenge.enums;

/**
 * 챌린지 상태
 * ACTIVE: 진행중
 * COMPLETED: 완료 (기간 종료 + 목표 달성)
 * FAILED: 실패 (기간 종료 + 목표 미달성)
 */
public enum ChallengeStatus {
    ACTIVE,
    COMPLETED,
    FAILED
}
