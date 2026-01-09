package com.app.replant.domain.diary.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Getter
@NoArgsConstructor
public class DiaryRequest {

    @NotNull(message = "날짜를 입력해주세요")
    private LocalDate date;

    // 프론트엔드 호환용 - emotion 문자열 ('happy', 'excited', 'calm', 'grateful', 'sad', 'angry', 'anxious', 'tired')
    private String emotion;

    // 기존 필드 유지 (하위 호환성)
    private Integer mood; // 기분 값 (1-5 또는 슬라이더 값)
    private List<String> emotions; // 선택된 감정들 (예: ["행복", "기쁨", "사랑"])
    private List<String> emotionFactors; // 감정에 영향을 준 요인들 (예: ["공부", "가족", "운동"])

    // 프론트엔드 추가 필드
    private String weather; // 날씨
    private String location; // 위치
    private List<String> imageUrls; // 이미지 URL 목록
    private Boolean isPrivate; // 비공개 여부

    @NotBlank(message = "내용을 입력해주세요")
    @Size(max = 1000, message = "내용은 1000자 이하로 입력해주세요")
    private String content;
}
