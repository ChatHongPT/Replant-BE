package com.app.replant.domain.post.dto;

import com.app.replant.domain.post.entity.Comment;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@Builder
public class CommentResponse {

    private Long id;
    private Long userId;
    private String userNickname;
    private String userProfileImg;
    private String content;
    private Long parentId;
    private List<CommentResponse> replies;
    private int replyCount;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    public static CommentResponse from(Comment comment) {
        // User가 이미 로딩되어 있어야 함 (LAZY 로딩 문제 방지)
        Long userId = comment.getUser() != null ? comment.getUser().getId() : null;
        String userNickname = comment.getUser() != null ? comment.getUser().getNickname() : "알 수 없음";
        String userProfileImg = comment.getUser() != null ? comment.getUser().getProfileImg() : null;

        return CommentResponse.builder()
                .id(comment.getId())
                .userId(userId)
                .userNickname(userNickname)
                .userProfileImg(userProfileImg)
                .content(comment.getContent())
                .parentId(comment.getParentId())
                .replyCount(comment.getReplies() != null ? comment.getReplies().size() : 0)
                .createdAt(comment.getCreatedAt())
                .updatedAt(comment.getUpdatedAt())
                .build();
    }

    /**
     * 대댓글까지 포함해서 반환 (최상위 댓글용)
     */
    public static CommentResponse fromWithReplies(Comment comment) {
        List<CommentResponse> replyResponses = null;
        if (comment.getReplies() != null && !comment.getReplies().isEmpty()) {
            replyResponses = comment.getReplies().stream()
                    .map(CommentResponse::from)
                    .collect(Collectors.toList());
        }

        // User가 이미 로딩되어 있어야 함 (LAZY 로딩 문제 방지)
        Long userId = comment.getUser() != null ? comment.getUser().getId() : null;
        String userNickname = comment.getUser() != null ? comment.getUser().getNickname() : "알 수 없음";
        String userProfileImg = comment.getUser() != null ? comment.getUser().getProfileImg() : null;

        return CommentResponse.builder()
                .id(comment.getId())
                .userId(userId)
                .userNickname(userNickname)
                .userProfileImg(userProfileImg)
                .content(comment.getContent())
                .parentId(comment.getParentId())
                .replies(replyResponses)
                .replyCount(comment.getReplies() != null ? comment.getReplies().size() : 0)
                .createdAt(comment.getCreatedAt())
                .updatedAt(comment.getUpdatedAt())
                .build();
    }
}
