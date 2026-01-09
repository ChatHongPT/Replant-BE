package com.app.replant.domain.diary.dto;

import com.app.replant.domain.diary.entity.Diary;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Builder
public class DiaryResponse {

    private Long id;
    private Long userId; // 사용자 ID
    private LocalDate date;

    // 프론트엔드 호환 필드
    private String emotion; // 감정 문자열 ('happy', 'excited', 'calm', 'grateful', 'sad', 'angry', 'anxious', 'tired')
    private String weather; // 날씨
    private String location; // 위치
    private List<String> imageUrls; // 이미지 URL 목록
    private Boolean isPrivate; // 비공개 여부
    private LocalDateTime createdAt; // 생성일시
    private LocalDateTime updatedAt; // 수정일시

    // 기존 필드 (하위 호환성)
    private Integer mood; // 기분 값
    private List<String> emotions; // 선택된 감정들
    private List<String> emotionFactors; // 감정에 영향을 준 요인들
    private String content;

    public static DiaryResponse from(Diary diary) {
        ObjectMapper objectMapper = new ObjectMapper();
        List<String> emotions = new ArrayList<>();
        List<String> emotionFactors = new ArrayList<>();
        List<String> imageUrls = new ArrayList<>();

        // JSON 문자열을 List로 변환
        try {
            if (diary.getEmotions() != null && !diary.getEmotions().isEmpty()) {
                emotions = objectMapper.readValue(diary.getEmotions(), new TypeReference<List<String>>() {});
            }
        } catch (Exception e) {
            // JSON 파싱 실패 시 빈 리스트 유지
        }

        try {
            if (diary.getEmotionFactors() != null && !diary.getEmotionFactors().isEmpty()) {
                emotionFactors = objectMapper.readValue(diary.getEmotionFactors(), new TypeReference<List<String>>() {});
            }
        } catch (Exception e) {
            // JSON 파싱 실패 시 빈 리스트 유지
        }

        try {
            if (diary.getImageUrls() != null && !diary.getImageUrls().isEmpty()) {
                imageUrls = objectMapper.readValue(diary.getImageUrls(), new TypeReference<List<String>>() {});
            }
        } catch (Exception e) {
            // JSON 파싱 실패 시 빈 리스트 유지
        }

        return DiaryResponse.builder()
                .id(diary.getId())
                .userId(diary.getUser().getId())
                .date(diary.getDate())
                .emotion(diary.getEmotion())
                .weather(diary.getWeather())
                .location(diary.getLocation())
                .imageUrls(imageUrls)
                .isPrivate(diary.getIsPrivate() != null ? diary.getIsPrivate() : false)
                .createdAt(diary.getCreatedAt())
                .updatedAt(diary.getUpdatedAt())
                .mood(diary.getMood())
                .emotions(emotions)
                .emotionFactors(emotionFactors)
                .content(diary.getContent())
                .build();
    }
}
