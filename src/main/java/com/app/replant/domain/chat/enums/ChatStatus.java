package com.app.replant.domain.chat.enums;

/**
 * 채팅 처리 상태 열거형
 */
public enum ChatStatus {
    SUCCESS("정상 처리"),
    FALLBACK("폴백 처리 (Primary 실패)"),
    ERROR("처리 실패"),
    TIMEOUT("타임아웃"),
    RATE_LIMITED("API 제한 초과");

    private final String description;

    ChatStatus(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
