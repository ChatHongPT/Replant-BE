package com.app.replant.domain.notification.dto;

import com.app.replant.domain.notification.entity.Notification;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

@Getter
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
public class NotificationResponse {

    private static final DateTimeFormatter CREATED_AT_FORMAT =
            DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ssXXX").withZone(ZoneId.of("Asia/Seoul"));

    private Long id;
    private String type;
    private String title;
    private String content;
    private String referenceType;
    private Long referenceId;
    private Long userMissionId; // USER_MISSION 타입일 때 referenceId와 동일한 값 (프론트엔드 호환성)
    private Boolean isRead;
    /** Asia/Seoul 기준 ISO 형식 문자열 (Jackson 직렬화 예외 방지를 위해 서버에서 포맷) */
    private String createdAt;

    public static NotificationResponse from(Notification notification) {
        LocalDateTime created = notification.getCreatedAt();
        String createdAtStr = created == null ? null
                : created.atZone(ZoneId.of("Asia/Seoul")).format(CREATED_AT_FORMAT);

        NotificationResponse.NotificationResponseBuilder builder = NotificationResponse.builder()
                .id(notification.getId())
                .type(notification.getType())
                .title(notification.getTitle())
                .content(notification.getContent())
                .referenceType(notification.getReferenceType())
                .referenceId(notification.getReferenceId())
                .isRead(notification.getIsRead())
                .createdAt(createdAtStr);

        // USER_MISSION 타입인 경우 userMissionId 필드도 설정 (프론트엔드 호환성)
        if ("USER_MISSION".equals(notification.getReferenceType()) && notification.getReferenceId() != null) {
            builder.userMissionId(notification.getReferenceId());
        }

        return builder.build();
    }
}
