package com.app.replant.controller;

import com.app.replant.common.ApiResponse;
import com.app.replant.domain.usermission.dto.*;
import com.app.replant.domain.usermission.enums.UserMissionStatus;
import com.app.replant.domain.usermission.enums.WakeupTimeSlot;
import com.app.replant.domain.usermission.service.UserMissionService;
import com.app.replant.domain.usermission.service.WakeupMissionService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@Tag(name = "UserMission", description = "내 미션 API - 사용자에게 할당된 미션 관리")
@RestController
@RequestMapping("/api/missions/my")
@RequiredArgsConstructor
public class UserMissionController {

    private final UserMissionService userMissionService;
    private final WakeupMissionService wakeupMissionService;

    @Operation(summary = "내 미션 목록 조회",
            description = "로그인한 사용자의 미션 목록을 조회합니다. 상태 및 미션 타입으로 필터링 가능합니다.")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공",
                    content = @Content(examples = @ExampleObject(value = """
                            {
                              "success": true,
                              "data": {
                                "content": [
                                  {
                                    "id": 1,
                                    "missionType": "SYSTEM",
                                    "mission": {
                                      "id": 10,
                                      "title": "매일 물 2L 마시기",
                                      "description": "건강을 위해 물을 충분히 마셔보세요"
                                    },
                                    "status": "ASSIGNED",
                                    "assignedAt": "2024-01-15T09:00:00",
                                    "dueDate": "2024-01-22T23:59:59"
                                  }
                                ],
                                "totalElements": 1,
                                "totalPages": 1,
                                "number": 0
                              }
                            }
                            """)))
    })
    @GetMapping
    public ApiResponse<Page<UserMissionResponse>> getUserMissions(
            @AuthenticationPrincipal Long userId,
            @Parameter(description = "미션 상태 필터 (ASSIGNED, PENDING, COMPLETED, EXPIRED)")
            @RequestParam(required = false) UserMissionStatus status,
            @Parameter(description = "미션 타입 필터 (SYSTEM, CUSTOM)")
            @RequestParam(required = false) String missionType,
            @PageableDefault(size = 20, sort = "assignedAt", direction = Sort.Direction.DESC) Pageable pageable) {
        Page<UserMissionResponse> missions = userMissionService.getUserMissions(userId, status, missionType, pageable);
        return ApiResponse.success(missions);
    }

    @Operation(summary = "내 미션 상세 조회",
            description = "특정 미션의 상세 정보를 조회합니다.")
    @GetMapping("/{userMissionId}")
    public ApiResponse<UserMissionResponse> getUserMission(
            @Parameter(description = "사용자 미션 ID", example = "1")
            @PathVariable Long userMissionId,
            @AuthenticationPrincipal Long userId) {
        UserMissionResponse mission = userMissionService.getUserMission(userMissionId, userId);
        return ApiResponse.success(mission);
    }

    @Operation(summary = "커스텀 미션을 내 미션에 추가",
            description = "공개된 커스텀 미션을 내 미션 목록에 추가합니다.")
    @io.swagger.v3.oas.annotations.parameters.RequestBody(
            content = @Content(examples = @ExampleObject(value = """
                    {
                      "customMissionId": 5
                    }
                    """))
    )
    @PostMapping("/custom")
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<UserMissionResponse> addCustomMission(
            @AuthenticationPrincipal Long userId,
            @RequestBody @Valid AddCustomMissionRequest request) {
        UserMissionResponse mission = userMissionService.addCustomMission(userId, request);
        return ApiResponse.success(mission);
    }

    @Operation(summary = "시스템 미션을 내 미션에 추가",
            description = "시스템 미션을 내 미션 목록에 추가합니다.")
    @io.swagger.v3.oas.annotations.parameters.RequestBody(
            content = @Content(examples = @ExampleObject(value = """
                    {
                      "missionId": 10
                    }
                    """))
    )
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<UserMissionResponse> addMission(
            @AuthenticationPrincipal Long userId,
            @RequestBody @Valid AddMissionRequest request) {
        UserMissionResponse mission = userMissionService.addMission(userId, request);
        return ApiResponse.success(mission);
    }

    @Operation(summary = "미션 인증 (GPS/TIME)",
            description = "GPS 위치 또는 시간으로 미션을 인증합니다.")
    @io.swagger.v3.oas.annotations.parameters.RequestBody(
            content = @Content(examples = {
                    @ExampleObject(name = "GPS 인증", value = """
                            {
                              "type": "GPS",
                              "latitude": 37.5665,
                              "longitude": 126.9780
                            }
                            """),
                    @ExampleObject(name = "TIME 인증", value = """
                            {
                              "type": "TIME",
                              "startedAt": "2024-01-15T09:00:00",
                              "endedAt": "2024-01-15T09:30:00"
                            }
                            """)
            })
    )
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "인증 성공",
                    content = @Content(examples = @ExampleObject(value = """
                            {
                              "success": true,
                              "data": {
                                "userMissionId": 1,
                                "status": "COMPLETED",
                                "rewards": {
                                  "expEarned": 20,
                                  "badge": {
                                    "id": 5,
                                    "expiresAt": "2024-01-18T23:59:59"
                                  }
                                }
                              }
                            }
                            """))),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "400", description = "인증 실패 (위치 불일치 등)")
    })
    @PostMapping("/{userMissionId}/verify")
    public ApiResponse<VerifyMissionResponse> verifyMission(
            @Parameter(description = "사용자 미션 ID", example = "1")
            @PathVariable Long userMissionId,
            @AuthenticationPrincipal Long userId,
            @RequestBody @Valid VerifyMissionRequest request) {
        VerifyMissionResponse response = userMissionService.verifyMission(userMissionId, userId, request);
        return ApiResponse.success(response);
    }

    @Operation(summary = "미션 수행 이력 조회", description = "완료/실패 포함 전체 미션 이력 조회")
    @GetMapping("/history")
    public ApiResponse<Page<UserMissionResponse>> getMissionHistory(
            @AuthenticationPrincipal Long userId,
            @PageableDefault(size = 20, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable) {
        Page<UserMissionResponse> history = userMissionService.getMissionHistory(userId, pageable);
        return ApiResponse.success(history);
    }

    // ============ 기상 미션 설정 API ============

    @Operation(summary = "기상 미션 시간대 설정", description = "다음 주차 기상미션 시간대를 설정합니다 (6-8시/8-10시/10-12시)")
    @PostMapping("/wakeup/settings")
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<WakeupMissionSettingResponse> setWakeupTime(
            @AuthenticationPrincipal Long userId,
            @RequestBody @Valid WakeupMissionSettingRequest request) {
        WakeupMissionSettingResponse response = wakeupMissionService.setWakeupTime(userId, request);
        return ApiResponse.success(response);
    }

    @Operation(summary = "기상 미션 시간대 수정")
    @PutMapping("/wakeup/settings/{settingId}")
    public ApiResponse<WakeupMissionSettingResponse> updateWakeupTime(
            @AuthenticationPrincipal Long userId,
            @PathVariable Long settingId,
            @RequestParam WakeupTimeSlot timeSlot) {
        WakeupMissionSettingResponse response = wakeupMissionService.updateWakeupTime(userId, settingId, timeSlot);
        return ApiResponse.success(response);
    }

    @Operation(summary = "현재 주차 기상 미션 설정 조회")
    @GetMapping("/wakeup/settings/current")
    public ApiResponse<WakeupMissionSettingResponse> getCurrentWeekSetting(
            @AuthenticationPrincipal Long userId) {
        WakeupMissionSettingResponse response = wakeupMissionService.getCurrentWeekSetting(userId);
        return ApiResponse.success(response);
    }

    @Operation(summary = "특정 주차 기상 미션 설정 조회")
    @GetMapping("/wakeup/settings")
    public ApiResponse<WakeupMissionSettingResponse> getWeekSetting(
            @AuthenticationPrincipal Long userId,
            @RequestParam Integer weekNumber,
            @RequestParam Integer year) {
        WakeupMissionSettingResponse response = wakeupMissionService.getWeekSetting(userId, weekNumber, year);
        return ApiResponse.success(response);
    }

    @Operation(summary = "다음 주차 기상 미션 설정 정보", description = "다음 주차 설정을 위한 정보와 이미 설정되어 있는지 확인")
    @GetMapping("/wakeup/settings/next-week-info")
    public ApiResponse<WakeupMissionService.NextWeekSetupInfo> getNextWeekSetupInfo(
            @AuthenticationPrincipal Long userId) {
        WakeupMissionService.NextWeekSetupInfo info = wakeupMissionService.getNextWeekSetupInfo(userId);
        return ApiResponse.success(info);
    }

    @Operation(summary = "기상 미션 인증 시간 확인", description = "현재 시간이 설정된 기상 인증 시간대인지 확인")
    @GetMapping("/wakeup/verify-time")
    public ApiResponse<WakeupMissionService.WakeupVerificationResult> verifyWakeupTime(
            @AuthenticationPrincipal Long userId) {
        WakeupMissionService.WakeupVerificationResult result = wakeupMissionService.verifyWakeupTime(userId);
        return ApiResponse.success(result);
    }
}
