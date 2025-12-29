package com.app.replant.domain.mission.dto;

import com.app.replant.domain.mission.enums.MissionType;
import com.app.replant.domain.mission.enums.VerificationType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Getter
@NoArgsConstructor
public class MissionRequest {

    @NotBlank(message = "미션 제목을 입력해주세요")
    @Size(max = 100, message = "제목은 100자 이하로 입력해주세요")
    private String title;

    @NotBlank(message = "미션 설명을 입력해주세요")
    private String description;

    @NotNull(message = "미션 타입을 선택해주세요")
    private MissionType type;

    @NotNull(message = "인증 타입을 선택해주세요")
    private VerificationType verificationType;

    // GPS 인증용 필드
    private BigDecimal gpsLatitude;
    private BigDecimal gpsLongitude;
    private Integer gpsRadiusMeters;

    // 시간 인증용 필드
    private Integer requiredMinutes;

    // 보상 설정
    private Integer expReward;
    private Integer badgeDurationDays;

    // 미션 활성화 여부
    private Boolean isActive;
}
