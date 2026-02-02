package com.app.replant.domain.post.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class PostRequest {

    private Long missionId;

    private String title;

    @NotBlank(message = "내용은 필수입니다.")
    private String content;

    private List<String> imageUrls;

    /** 공개 여부 (일반 게시글만 사용, null이면 true). false = 비공개 */
    private Boolean isPublic;
}
