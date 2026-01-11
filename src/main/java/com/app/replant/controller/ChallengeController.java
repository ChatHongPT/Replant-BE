package com.app.replant.controller;

import com.app.replant.common.ApiResponse;
import com.app.replant.domain.challenge.dto.ChallengeDto;
import com.app.replant.domain.challenge.service.ChallengeService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Tag(name = "Challenge", description = "챌린지 API")
@RestController
@RequestMapping("/api/challenges")
@RequiredArgsConstructor
public class ChallengeController {

    private final ChallengeService challengeService;

    @Operation(summary = "챌린지 시작",
            description = "새로운 챌린지를 시작합니다. (isChallenge=true인 미션만 가능)")
    @io.swagger.v3.oas.annotations.parameters.RequestBody(
            content = @Content(examples = @ExampleObject(value = """
                    {
                      "missionId": 1,
                      "durationDays": 7
                    }
                    """))
    )
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "201", description = "시작 성공"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "400", description = "잘못된 요청 (챌린지 미션이 아님 또는 이미 진행중)"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "401", description = "인증 필요")
    })
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<ChallengeDto.DetailResponse> startChallenge(
            @AuthenticationPrincipal Long userId,
            @RequestBody ChallengeDto.StartRequest request) {
        ChallengeDto.DetailResponse response = challengeService.startChallenge(userId, request);
        return ApiResponse.success(response);
    }

    @Operation(summary = "활성 챌린지 목록 조회",
            description = "진행중인 챌린지 목록을 조회합니다.")
    @GetMapping("/active")
    public ApiResponse<List<ChallengeDto.SimpleResponse>> getActiveChallenges(
            @AuthenticationPrincipal Long userId) {
        List<ChallengeDto.SimpleResponse> response = challengeService.getActiveChallenges(userId);
        return ApiResponse.success(response);
    }

    @Operation(summary = "모든 챌린지 목록 조회",
            description = "모든 챌린지 목록을 조회합니다. (완료/실패 포함)")
    @GetMapping
    public ApiResponse<List<ChallengeDto.SimpleResponse>> getAllChallenges(
            @AuthenticationPrincipal Long userId) {
        List<ChallengeDto.SimpleResponse> response = challengeService.getAllChallenges(userId);
        return ApiResponse.success(response);
    }

    @Operation(summary = "챌린지 상세 조회",
            description = "챌린지의 상세 정보를 조회합니다.")
    @GetMapping("/{challengeId}")
    public ApiResponse<ChallengeDto.DetailResponse> getChallengeDetail(
            @Parameter(description = "챌린지 ID") @PathVariable Long challengeId,
            @AuthenticationPrincipal Long userId) {
        ChallengeDto.DetailResponse response = challengeService.getChallengeDetail(challengeId, userId);
        return ApiResponse.success(response);
    }

    @Operation(summary = "오늘 챌린지 완료",
            description = "오늘의 챌린지를 완료 처리합니다.")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "완료 성공"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "400", description = "이미 오늘 완료했거나 종료된 챌린지"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "401", description = "인증 필요"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "챌린지를 찾을 수 없음")
    })
    @PutMapping("/{challengeId}/complete")
    public ApiResponse<ChallengeDto.DetailResponse> completeToday(
            @Parameter(description = "챌린지 ID") @PathVariable Long challengeId,
            @AuthenticationPrincipal Long userId) {
        ChallengeDto.DetailResponse response = challengeService.completeToday(challengeId, userId);
        return ApiResponse.success(response);
    }

    @Operation(summary = "활성 챌린지 개수 조회",
            description = "진행중인 챌린지 개수를 조회합니다.")
    @GetMapping("/count")
    public ApiResponse<Map<String, Long>> getActiveChallengeCount(
            @AuthenticationPrincipal Long userId) {
        long count = challengeService.getActiveChallengeCount(userId);
        Map<String, Long> response = new HashMap<>();
        response.put("count", count);
        return ApiResponse.success(response);
    }
}
