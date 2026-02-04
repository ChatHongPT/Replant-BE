package com.app.replant.domain.notification.dto;

import com.app.replant.domain.notification.entity.Notification;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThatNoException;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

@DisplayName("NotificationResponse 직렬화 검증 (알림 API 500 방지)")
class NotificationResponseTest {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Test
    @DisplayName("from() + JSON 직렬화 시 예외 없음 (createdAt String 포맷)")
    void from_and_serialize_does_not_throw() {
        Notification notification = mock(Notification.class);
        when(notification.getId()).thenReturn(1L);
        when(notification.getType()).thenReturn("USER_MISSION");
        when(notification.getTitle()).thenReturn("기상 미션");
        when(notification.getContent()).thenReturn("인증해주세요.");
        when(notification.getReferenceType()).thenReturn("USER_MISSION");
        when(notification.getReferenceId()).thenReturn(100L);
        when(notification.getIsRead()).thenReturn(false);
        when(notification.getCreatedAt()).thenReturn(LocalDateTime.of(2026, 2, 4, 13, 27, 0));

        assertThatNoException().isThrownBy(() -> {
            NotificationResponse response = NotificationResponse.from(notification);
            String json = objectMapper.writeValueAsString(response);
            assert !json.isEmpty();
            assert json.contains("createdAt");
            assert json.contains("+09:00");
        });
    }

    @Test
    @DisplayName("createdAt null 시에도 직렬화 예외 없음")
    void from_with_null_createdAt_does_not_throw() {
        Notification notification = mock(Notification.class);
        when(notification.getId()).thenReturn(2L);
        when(notification.getType()).thenReturn("DIARY");
        when(notification.getTitle()).thenReturn("일기 알림");
        when(notification.getContent()).thenReturn("일기를 작성해보세요.");
        when(notification.getReferenceType()).thenReturn(null);
        when(notification.getReferenceId()).thenReturn(null);
        when(notification.getIsRead()).thenReturn(true);
        when(notification.getCreatedAt()).thenReturn(null);

        assertThatNoException().isThrownBy(() -> {
            NotificationResponse response = NotificationResponse.from(notification);
            String json = objectMapper.writeValueAsString(response);
            assert !json.isEmpty();
        });
    }

    @Test
    @DisplayName("Page 형태 리스트 직렬화 (API 응답과 동일 구조)")
    void list_serialize_like_api_response() throws Exception {
        Notification n1 = mock(Notification.class);
        when(n1.getId()).thenReturn(1L);
        when(n1.getType()).thenReturn("USER_MISSION");
        when(n1.getTitle()).thenReturn("기상 미션");
        when(n1.getContent()).thenReturn("인증해주세요.");
        when(n1.getReferenceType()).thenReturn("USER_MISSION");
        when(n1.getReferenceId()).thenReturn(100L);
        when(n1.getIsRead()).thenReturn(false);
        when(n1.getCreatedAt()).thenReturn(LocalDateTime.of(2026, 2, 4, 13, 27, 0));

        List<NotificationResponse> content = List.of(NotificationResponse.from(n1));
        String json = objectMapper.writeValueAsString(content);
        assert !json.isEmpty();
        assert json.contains("2026-02-04");
        assert json.contains("+09:00");
    }
}
