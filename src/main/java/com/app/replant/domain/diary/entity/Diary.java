package com.app.replant.domain.diary.entity;

import com.app.replant.domain.user.entity.User;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "diary", indexes = {
    @Index(name = "idx_diary_user_date", columnList = "user_id, date")
})
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Diary {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(nullable = false)
    private LocalDate date;

    // 프론트엔드 호환 필드 - emotion 문자열 ('happy', 'excited', 'calm', 'grateful', 'sad', 'angry', 'anxious', 'tired')
    @Column(name = "emotion", length = 50)
    private String emotion;

    // 기존 필드 (하위 호환성)
    @Column
    private Integer mood; // 기분 값 (1-5 또는 슬라이더 값)

    @Column(name = "emotions", columnDefinition = "json")
    private String emotions; // 선택된 감정들 (JSON 배열: ["행복", "기쁨", "사랑"])

    @Column(name = "emotion_factors", columnDefinition = "json")
    private String emotionFactors; // 감정에 영향을 준 요인들 (JSON 배열: ["공부", "가족", "운동"])

    @Column(nullable = false, columnDefinition = "TEXT")
    private String content;

    // 프론트엔드 추가 필드
    @Column(name = "weather", length = 50)
    private String weather; // 날씨

    @Column(name = "location", length = 255)
    private String location; // 위치

    @Column(name = "image_urls", columnDefinition = "json")
    private String imageUrls; // 이미지 URL 목록 (JSON 배열)

    @Column(name = "is_private")
    private Boolean isPrivate; // 비공개 여부

    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt; // 생성일시

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt; // 수정일시

    @Builder
    public Diary(User user, LocalDate date, String emotion, Integer mood, String emotions, String emotionFactors,
                 String content, String weather, String location, String imageUrls, Boolean isPrivate) {
        this.user = user;
        this.date = date;
        this.emotion = emotion;
        this.mood = mood;
        this.emotions = emotions;
        this.emotionFactors = emotionFactors;
        this.content = content;
        this.weather = weather;
        this.location = location;
        this.imageUrls = imageUrls;
        this.isPrivate = isPrivate;
    }

    public void update(String emotion, Integer mood, String emotions, String emotionFactors, String content,
                       String weather, String location, String imageUrls, Boolean isPrivate) {
        if (emotion != null) {
            this.emotion = emotion;
        }
        if (mood != null) {
            this.mood = mood;
        }
        if (emotions != null) {
            this.emotions = emotions;
        }
        if (emotionFactors != null) {
            this.emotionFactors = emotionFactors;
        }
        if (content != null) {
            this.content = content;
        }
        if (weather != null) {
            this.weather = weather;
        }
        if (location != null) {
            this.location = location;
        }
        if (imageUrls != null) {
            this.imageUrls = imageUrls;
        }
        if (isPrivate != null) {
            this.isPrivate = isPrivate;
        }
    }
}
