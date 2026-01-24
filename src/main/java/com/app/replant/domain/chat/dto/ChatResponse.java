package com.app.replant.domain.chat.dto;

import com.app.replant.domain.chat.entity.ChatLog;
import com.app.replant.domain.chat.enums.LLMProvider;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 채팅 응답 DTO
 */
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChatResponse {

    private String message;           // AI 응답 메시지
    private String reantName;         // 리앤트 이름
    private LLMProvider provider;     // 사용된 LLM (디버깅/모니터링용, 프론트에서 숨겨도 됨)
    private LocalDateTime timestamp;  // 응답 시간

    /**
     * ChatLog 엔티티로부터 응답 DTO 생성
     */
    public static ChatResponse from(ChatLog chatLog) {
        return ChatResponse.builder()
                .message(chatLog.getAiResponse())
                .reantName(chatLog.getReant().getName())
                .provider(chatLog.getLlmProvider())
                .timestamp(chatLog.getCreatedAt())
                .build();
    }

    /**
     * 간단한 응답 생성 (저장 전)
     */
    public static ChatResponse of(String message, String reantName, LLMProvider provider) {
        return ChatResponse.builder()
                .message(message)
                .reantName(reantName)
                .provider(provider)
                .timestamp(LocalDateTime.now())
                .build();
    }
}
