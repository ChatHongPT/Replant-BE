package com.app.replant.domain.chat.controller;

import com.app.replant.domain.chat.dto.ChatHistoryResponse;
import com.app.replant.domain.chat.dto.ChatRequest;
import com.app.replant.domain.chat.dto.ChatResponse;
import com.app.replant.domain.chat.service.ChatService;
import com.app.replant.global.common.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Map;

/**
 * 리앤트 채팅 API 컨트롤러
 */
@Tag(name = "Chat", description = "리앤트 채팅 API")
@RestController
@RequestMapping("/api/chat")
@RequiredArgsConstructor
public class ChatController {

    private final ChatService chatService;

    /**
     * 채팅 메시지 전송
     */
    @Operation(summary = "채팅 메시지 전송", description = "리앤트에게 메시지를 보내고 AI 응답을 받습니다")
    @ApiResponses({
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "성공"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "429", description = "일일 채팅 한도 초과")
    })
    @PostMapping
    public ApiResponse<ChatResponse> chat(
            @AuthenticationPrincipal Long userId,
            @Valid @RequestBody ChatRequest request
    ) {
        ChatResponse response = chatService.chat(userId, request);
        return ApiResponse.success(response);
    }

    /**
     * 채팅 이력 조회 (관리자/운영용)
     */
    @Operation(summary = "채팅 이력 조회", description = "사용자의 채팅 이력을 조회합니다")
    @GetMapping("/history")
    public ApiResponse<Page<ChatHistoryResponse>> getChatHistory(
            @AuthenticationPrincipal Long userId,
            @PageableDefault(size = 20, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable
    ) {
        Page<ChatHistoryResponse> history = chatService.getChatHistory(userId, pageable);
        return ApiResponse.success(history);
    }

    /**
     * 오늘 채팅 현황 조회
     */
    @Operation(summary = "오늘 채팅 현황", description = "오늘 사용한 채팅 횟수와 남은 횟수를 조회합니다")
    @GetMapping("/status")
    public ApiResponse<Map<String, Object>> getChatStatus(
            @AuthenticationPrincipal Long userId
    ) {
        Long todayCount = chatService.getTodayChatCount(userId);
        int dailyLimit = 100;
        
        return ApiResponse.success(Map.of(
                "todayCount", todayCount,
                "dailyLimit", dailyLimit,
                "remaining", Math.max(0, dailyLimit - todayCount)
        ));
    }

    /**
     * 채팅 통계 조회 (관리자용)
     */
    @Operation(summary = "채팅 통계 조회 (관리자)", description = "특정 기간의 채팅 통계를 조회합니다")
    @GetMapping("/admin/stats")
    public ApiResponse<ChatService.ChatStats> getStats(
            @RequestParam(required = false) LocalDateTime start,
            @RequestParam(required = false) LocalDateTime end
    ) {
        if (start == null) {
            start = LocalDateTime.now().minusDays(7);
        }
        if (end == null) {
            end = LocalDateTime.now();
        }
        
        ChatService.ChatStats stats = chatService.getStats(start, end);
        return ApiResponse.success(stats);
    }
}
