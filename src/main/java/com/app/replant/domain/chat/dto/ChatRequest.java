package com.app.replant.domain.chat.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * 채팅 요청 DTO
 */
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ChatRequest {

    @NotBlank(message = "메시지를 입력해주세요")
    @Size(max = 500, message = "메시지는 500자 이내로 입력해주세요")
    private String message;
}
