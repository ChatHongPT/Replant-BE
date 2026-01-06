package com.app.replant.controller;

import com.app.replant.controller.dto.SseSendRequestDto;
import com.app.replant.domain.user.entity.User;
import com.app.replant.domain.user.repository.UserRepository;
import com.app.replant.domain.user.security.UserDetail;
import com.app.replant.exception.CustomException;
import com.app.replant.exception.ErrorCode;
import com.app.replant.service.sse.SseService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import java.io.IOException;
import java.util.Map;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name = "SSE 알림", description = "Server-Sent Events를 통한 실시간 알림 API")
@RestController
@RequestMapping("/sse")
@RequiredArgsConstructor
@Slf4j
public class SseController {

    private final UserRepository userRepository;
    private final SseService sseService;
    private final ObjectMapper objectMapper;

    /**
     * SSE 연결
     */
    @Operation(summary = "SSE 연결", description = "Server-Sent Events를 통한 실시간 알림 연결을 설정합니다")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "SSE 연결 성공")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "401", description = "인증 정보 없음")
    @GetMapping(value = "/connect", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public SseEmitter connect(
            @Parameter(hidden = true) Authentication authentication,
            HttpServletResponse response) {
        // SecurityConfig에서 authenticated()로 설정되어 있으므로
        // 여기까지 도달했다면 인증은 통과한 상태
        // 하지만 혹시 모를 경우를 대비해 체크
        if (authentication == null) {
            log.error("SSE 연결 실패: 인증 정보 없음 (SecurityConfig 설정 확인 필요)");
            throw new IllegalStateException("인증 정보가 없습니다");
        }

        Long memberId = getMemberId(authentication);

        if (memberId == null) {
            log.error("SSE 연결 실패: memberId 추출 실패");
            throw new IllegalStateException("사용자 ID를 추출할 수 없습니다");
        }

        // SSE 응답 헤더 설정
        response.setHeader("Content-Type", MediaType.TEXT_EVENT_STREAM_VALUE);
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Connection", "keep-alive");
        response.setHeader("X-Accel-Buffering", "no"); // Nginx 버퍼링 방지

        // CORS는 SecurityConfig에서 중앙 관리하므로 여기서는 제거
        // 중복 설정 시 "multiple values" 오류 발생 가능

        SseEmitter emitter = sseService.createEmitter(memberId);

        try {
            emitter.send(SseEmitter.event()
                    .name("connect")
                    .data("SSE 연결 성공"));
            log.info("SSE 연결 성공 - memberId: {}", memberId);
        } catch (IOException e) {
            log.error("SSE 초기 메시지 전송 실패 - memberId: {}", memberId, e);
            emitter.completeWithError(e);
        }

        return emitter;
    }

    /**
     * 테스트용: 메시지 전송
     */
    @Operation(summary = "테스트 메시지 전송", description = "SSE를 통해 특정 사용자에게 테스트 메시지를 전송합니다")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "메시지 전송 성공")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "400", description = "잘못된 요청")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "회원을 찾을 수 없음 또는 SSE 연결이 없습니다")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "500", description = "메시지 전송 실패")
    @PostMapping("/send")
    public ResponseEntity<String> sendMessage(
            @Parameter(description = "메시지 전송 요청 정보", required = true) @Valid @RequestBody SseSendRequestDto requestDto) {
        log.info("SSE 메시지 전송 요청: memberId={}, message={}", requestDto.getMemberId(), requestDto.getMessage());

        // 이메일로 사용자 찾기
        User user = userRepository.findByEmail(requestDto.getMemberId())
                .orElseThrow(() -> {
                    log.warn("SSE 메시지 전송 실패: 사용자를 찾을 수 없음 - email={}", requestDto.getMemberId());
                    return new CustomException(ErrorCode.USER_NOT_FOUND);
                });

        Long memberId = user.getId();
        boolean sent = sseService.sendToUser(memberId, "message", requestDto.getMessage());

        if (sent) {
            log.info("SSE 메시지 전송 성공 - memberId: {}, message: {}", memberId, requestDto.getMessage());
            return ResponseEntity.ok("메시지 전송 성공");
        }

        log.warn("SSE 연결된 클라이언트 없음 - memberId: {}, 현재 연결 수: {}", memberId, sseService.getConnectedUserCount());
        return ResponseEntity.status(404).body("연결된 클라이언트가 없습니다. 현재 연결 수: " + sseService.getConnectedUserCount());
    }

    /**
     * 테스트용: GET으로 메시지 전송 (브라우저에서 쉽게 테스트)
     */
    @Operation(summary = "테스트 메시지 전송 (GET)", description = "GET 방식으로 SSE를 통해 테스트 메시지를 전송합니다")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "테스트 메시지 전송 성공")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "401", description = "인증 정보가 없습니다")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "SSE 연결이 없습니다")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "500", description = "메시지 전송 실패")
    @GetMapping("/test")
    public ResponseEntity<String> testMessage(
            @Parameter(hidden = true) Authentication authentication) {
        Long memberId = getMemberId(authentication);

        if (memberId == null) {
            return ResponseEntity.status(401).body("인증 정보가 없습니다");
        }

        String testMessage = "테스트 알림입니다! 현재 시간: " + java.time.LocalDateTime.now();
        boolean sent = sseService.sendToUser(memberId, "message", testMessage);

        if (sent) {
            log.info("SSE 테스트 메시지 전송 성공 - memberId: {}", memberId);
            return ResponseEntity.ok("테스트 메시지 전송 성공: " + testMessage);
        }

        return ResponseEntity.status(404).body("연결된 클라이언트가 없습니다. 먼저 /sse/connect에 연결하세요.");
    }

    /**
     * 테스트용: MISSION 알림 전송
     */
    @Operation(summary = "MISSION 타입 알림 전송", description = "미션 알림을 전송합니다. 프론트엔드에서 'N개의 미션이 배정되었습니다.' 메시지가 표시되고, /missions로 이동합니다")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "MISSION 알림 전송 성공")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "401", description = "인증 정보가 없습니다")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "SSE 연결이 없습니다. 먼저 /sse/connect에 연결하세요")
    @GetMapping("/test/mission")
    public ResponseEntity<String> testMissionNotification(
            @Parameter(hidden = true) Authentication authentication) {
        Long memberId = getMemberId(authentication);

        if (memberId == null) {
            return ResponseEntity.status(401).body("인증 정보가 없습니다");
        }

        if (!sseService.isConnected(memberId)) {
            return ResponseEntity.status(404).body("SSE 연결이 없습니다. 먼저 /sse/connect에 연결하세요.");
        }

        // 테스트용: 일간 미션 3개 배정 알림
        sseService.sendMissionNotification(memberId, "일간", 3);
        return ResponseEntity.ok("MISSION 알림 전송 완료 (일간 미션 3개)");
    }

    /**
     * 테스트용: DIARY 알림 전송
     */
    @Operation(summary = "DIARY 타입 알림 전송", description = "일기 알림을 전송합니다. 프론트엔드에서 일기 작성 알림이 표시되고, /calendar/diary/emotion?date=오늘날짜로 이동하여 바로 일기를 작성할 수 있습니다")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "DIARY 알림 전송 성공")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "401", description = "인증 정보가 없습니다")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "SSE 연결이 없습니다. 먼저 /sse/connect에 연결하세요")
    @GetMapping("/test/diary")
    public ResponseEntity<String> testDiaryNotification(
            @Parameter(hidden = true) Authentication authentication) {
        Long memberId = getMemberId(authentication);

        if (memberId == null) {
            return ResponseEntity.status(401).body("인증 정보가 없습니다");
        }

        if (!sseService.isConnected(memberId)) {
            return ResponseEntity.status(404).body("SSE 연결이 없습니다. 먼저 /sse/connect에 연결하세요.");
        }

        sseService.sendDiaryNotification(memberId);
        return ResponseEntity.ok("DIARY 알림 전송 완료");
    }

    /**
     * 테스트용: 커스텀 타입 알림 전송
     */
    @Operation(summary = "커스텀 타입 알림 전송", description = "지정한 타입으로 알림을 전송합니다. 타입: REPORT, diary, goal, achievement 등")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "알림 전송 성공")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "401", description = "인증 정보가 없습니다")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "SSE 연결이 없습니다")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "500", description = "알림 전송 실패")
    @PostMapping("/test/custom")
    public ResponseEntity<String> testCustomNotification(
            @Parameter(hidden = true) Authentication authentication,
            @io.swagger.v3.oas.annotations.parameters.RequestBody(description = "알림 데이터", required = true) @RequestBody Map<String, Object> notificationData) {
        Long memberId = getMemberId(authentication);

        if (memberId == null) {
            return ResponseEntity.status(401).body("인증 정보가 없습니다");
        }

        if (!sseService.isConnected(memberId)) {
            return ResponseEntity.status(404).body("SSE 연결이 없습니다. 먼저 /sse/connect에 연결하세요.");
        }

        try {
            String eventName = (String) notificationData.getOrDefault("type", "message");
            String jsonData = objectMapper.writeValueAsString(notificationData);
            sseService.sendToUser(memberId, eventName, jsonData);
            return ResponseEntity.ok("알림 전송 완료 (타입: " + eventName + ")");
        } catch (Exception e) {
            log.error("커스텀 알림 전송 실패 - memberId: {}", memberId, e);
            return ResponseEntity.status(500).body("알림 전송 실패: " + e.getMessage());
        }
    }

    public int getConnectedUserCount() {
        return sseService.getConnectedUserCount();
    }

    private Long getMemberId(Authentication authentication) {
        if (authentication == null || authentication.getPrincipal() == null) {
            return null;
        }
        try {
            Object principal = authentication.getPrincipal();

            // UserDetail (새로운 방식) 지원
            if (principal instanceof UserDetail) {
                return ((UserDetail) principal).getId();
            }

            // MemberDetail (레거시) 지원 - 하위 호환성
            if (principal instanceof com.app.replant.jwt.MemberDetail) {
                return ((com.app.replant.jwt.MemberDetail) principal).getId();
            }

            log.warn("지원하지 않는 Principal 타입: {}", principal.getClass().getName());
            return null;
        } catch (Exception e) {
            log.error("사용자 ID 추출 실패", e);
            return null;
        }
    }
}
