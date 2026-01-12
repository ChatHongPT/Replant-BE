package com.app.replant.controller;

import com.app.replant.common.ApiResponse;
import com.app.replant.controller.dto.AdminDiaryNotificationRequestDto;
import com.app.replant.controller.dto.AdminReportNotificationRequestDto;
import com.app.replant.controller.dto.NotificationSendRequestDto;
import com.app.replant.controller.dto.UserResponseDto;
import com.app.replant.domain.user.entity.User;
import com.app.replant.domain.user.repository.UserRepository;
import com.app.replant.exception.CustomException;
import com.app.replant.exception.ErrorCode;
import com.app.replant.service.sse.SseService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Tag(name = "관리자", description = "관리자 전용 API (ADMIN 권한 필요)")
@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
@Slf4j
@SecurityRequirement(name = "JWT Token")
public class AdminController {

    private final SseService sseService;
    private final UserRepository userRepository;
    private final JdbcTemplate jdbcTemplate;

    @Operation(summary = "전체 회원 조회", description = "모든 회원 정보를 조회합니다 (관리자 전용)")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "403", description = "권한 없음")
    @GetMapping("/members")
    public ResponseEntity<ApiResponse<List<UserResponseDto>>> getAllMembers() {
        log.info("관리자 - 전체 회원 조회");
        List<User> users = userRepository.findAll();
        List<UserResponseDto> members = users.stream()
                .map(UserResponseDto::from)
                .collect(Collectors.toList());
        return ResponseEntity.ok(ApiResponse.res(200, "사용자들을 정보를 불러왔습니다!", members));
    }

    @Operation(summary = "특정 회원 조회", description = "회원 ID로 특정 회원 정보를 조회합니다 (관리자 전용)")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "회원을 찾을 수 없음")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "403", description = "권한 없음")
    @GetMapping("/members/{userId}")
    public ResponseEntity<ApiResponse<UserResponseDto>> getMemberById(
            @Parameter(description = "조회할 회원 ID", required = true) @PathVariable Long userId) {
        log.info("관리자 - 회원 조회: {}", userId);
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new CustomException(ErrorCode.USER_NOT_FOUND));
        return ResponseEntity.ok(ApiResponse.res(200, "사용자 정보를 불러왔습니다!", UserResponseDto.from(user)));
    }

    @Operation(summary = "사용자 역할 변경", description = "특정 사용자의 역할을 변경합니다 (관리자 전용)")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "역할 변경 성공")
    @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "회원을 찾을 수 없음")
    @PatchMapping("/members/{userId}/role")
    public ResponseEntity<Map<String, Object>> updateMemberRole(
            @Parameter(description = "회원 ID", required = true) @PathVariable Long userId,
            @Parameter(description = "변경할 역할 (USER, GRADUATE, CONTRIBUTOR, ADMIN)", required = true) @RequestParam String role) {
        Map<String, Object> response = new HashMap<>();
        try {
            log.info("관리자 - 회원 역할 변경: userId={}, role={}", userId, role);
            int updated = jdbcTemplate.update("UPDATE `user` SET role = ? WHERE id = ?", role, userId);
            if (updated > 0) {
                response.put("success", true);
                response.put("message", "역할이 변경되었습니다.");
                response.put("userId", userId);
                response.put("newRole", role);
                return ResponseEntity.ok(response);
            } else {
                response.put("success", false);
                response.put("error", "회원을 찾을 수 없습니다.");
                return ResponseEntity.status(404).body(response);
            }
        } catch (Exception e) {
            log.error("역할 변경 실패", e);
            response.put("success", false);
            response.put("error", e.getMessage());
            return ResponseEntity.internalServerError().body(response);
        }
    }

}
