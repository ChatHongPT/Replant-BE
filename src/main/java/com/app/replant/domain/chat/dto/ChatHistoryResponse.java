package com.app.replant.domain.chat.dto;

import com.app.replant.domain.chat.entity.ChatLog;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 채팅 이력 조회용 DTO (관리자/운영용)
 */
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChatHistoryResponse {

    private Long id;
    private String userMessage;
    private String aiResponse;
    private String llmProvider;
    private String status;
    private LocalDateTime createdAt;

    public static ChatHistoryResponse from(ChatLog chatLog) {
        return ChatHistoryResponse.builder()
                .id(chatLog.getId())
                .userMessage(chatLog.getUserMessage())
                .aiResponse(chatLog.getAiResponse())
                .llmProvider(chatLog.getLlmProvider().name())
                .status(chatLog.getStatus().name())
                .createdAt(chatLog.getCreatedAt())
                .build();
    }
}
