package com.app.replant.controller;

import com.app.replant.common.ApiResponse;
import com.app.replant.controller.dto.ReantResponse;
import com.app.replant.controller.dto.ReantUpdateRequest;
import com.app.replant.domain.reant.service.ReantService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@Tag(name = "Reant", description = "펫 관련 API")
@RestController
@RequestMapping("/api/reant")
@RequiredArgsConstructor
public class ReantController {

    private final ReantService reantService;

    @Operation(summary = "내 펫 조회")
    @GetMapping
    public ApiResponse<ReantResponse> getMyReant(@AuthenticationPrincipal Long userId) {
        ReantResponse response = reantService.getMyReant(userId);
        return ApiResponse.success(response);
    }

    @Operation(summary = "펫 정보 수정")
    @PutMapping
    public ApiResponse<ReantResponse> updateReant(
            @AuthenticationPrincipal Long userId,
            @RequestBody ReantUpdateRequest request) {
        ReantResponse response = reantService.updateReant(userId, request);
        return ApiResponse.success(response);
    }
}
