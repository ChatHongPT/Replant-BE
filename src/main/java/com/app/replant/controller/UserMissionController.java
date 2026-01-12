package com.app.replant.controller;

import com.app.replant.common.ApiResponse;
import com.app.replant.domain.usermission.dto.*;
import com.app.replant.domain.usermission.enums.UserMissionStatus;
import com.app.replant.domain.usermission.service.UserMissionService;
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

        @Operation(summary = "내 미션 목록 조회", description = "로그인한 사용자의 미션 목록을 조회합니다. 상태 및 미션 타입으로 필터링 가능합니다.")
        @ApiResponses(value = {
                        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공", content = @Content(examples = @ExampleObject(value = """
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
                        @Parameter(description = "미션 상태 필터 (ASSIGNED, PENDING, COMPLETED, EXPIRED)") @RequestParam(required = false) UserMissionStatus status,
                        @Parameter(description = "미션 타입 필터 (SYSTEM, CUSTOM)") @RequestParam(required = false) String missionType,
                        @PageableDefault(size = 20, sort = "assignedAt", direction = Sort.Direction.DESC) Pageable pageable) {
                Page<UserMissionResponse> missions = userMissionService.getUserMissions(userId, status, missionType,
                                pageable);
                return ApiResponse.success(missions);
        }

        @Operation(summary = "내 미션 상세 조회", description = "특정 미션의 상세 정보를 조회합니다.")
        @GetMapping("/{userMissionId}")
        public ApiResponse<UserMissionResponse> getUserMission(
                        @Parameter(description = "사용자 미션 ID", example = "1") @PathVariable Long userMissionId,
                        @AuthenticationPrincipal Long userId) {
                UserMissionResponse mission = userMissionService.getUserMission(userMissionId, userId);
                return ApiResponse.success(mission);
        }

        @Operation(summary = "커스텀 미션을 내 미션에 추가", description = "공개된 커스텀 미션을 내 미션 목록에 추가합니다.")
        @io.swagger.v3.oas.annotations.parameters.RequestBody(content = @Content(examples = @ExampleObject(value = """
                        {
                          "customMissionId": 5
                        }
                        """)))
        @PostMapping("/custom")
        @ResponseStatus(HttpStatus.CREATED)
        public ApiResponse<UserMissionResponse> addCustomMission(
                        @AuthenticationPrincipal Long userId,
                        @RequestBody @Valid AddCustomMissionRequest request) {
                UserMissionResponse mission = userMissionService.addCustomMission(userId, request);
                return ApiResponse.success(mission);
        }

        @Operation(summary = "시스템 미션을 내 미션에 추가", description = "시스템 미션을 내 미션 목록에 추가합니다.")
        @io.swagger.v3.oas.annotations.parameters.RequestBody(content = @Content(examples = @ExampleObject(value = """
                        {
                          "missionId": 10
                        }
                        """)))
        @PostMapping
        @ResponseStatus(HttpStatus.CREATED)
        public ApiResponse<UserMissionResponse> addMission(
                        @AuthenticationPrincipal Long userId,
                        @RequestBody @Valid AddMissionRequest request) {
                UserMissionResponse mission = userMissionService.addMission(userId, request);
                return ApiResponse.success(mission);
        }

        @Operation(summary = "미션 인증 (GPS/TIME)", description = "GPS 위치 또는 시간으로 미션을 인증합니다.")
        @io.swagger.v3.oas.annotations.parameters.RequestBody(content = @Content(examples = {
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
        }))
        @ApiResponses(value = {
                        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "인증 성공", content = @Content(examples = @ExampleObject(value = """
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
                        @Parameter(description = "사용자 미션 ID", example = "1") @PathVariable Long userMissionId,
                        @AuthenticationPrincipal Long userId,
                        @RequestBody @Valid VerifyMissionRequest request) {
                VerifyMissionResponse response = userMissionService.verifyMission(userMissionId, userId, request);
                return ApiResponse.success(response);
        }

        @GetMapping("/history")
        @Operation(summary = "미션 완료 이력 조회", description = "완료한 미션의 이력을 조회합니다.")
        public ApiResponse<Page<UserMissionResponse>> getMissionHistory(
                        @AuthenticationPrincipal Long userId,
                        @PageableDefault(size = 20, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable) {
                Page<UserMissionResponse> history = userMissionService.getMissionHistory(userId, pageable);
                return ApiResponse.success(history);
        }
}
