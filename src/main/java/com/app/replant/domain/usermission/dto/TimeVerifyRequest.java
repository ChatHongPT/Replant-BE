package com.app.replant.domain.usermission.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 시간 인증 요청 (클라이언트 POST /api/verifications/time 호환)
 */
@Getter
@Setter
@NoArgsConstructor
public class TimeVerifyRequest {

    @NotNull(message = "userMissionId는 필수입니다.")
    private Long userMissionId;
}
