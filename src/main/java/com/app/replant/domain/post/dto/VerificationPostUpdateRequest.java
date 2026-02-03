package com.app.replant.domain.post.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 인증 게시글 수정 요청 DTO (PUT)
 * 작성 시에는 userMissionId가 필요하지만, 수정 시에는 불필요하므로 별도 DTO 사용.
 */
@Getter
@NoArgsConstructor
public class VerificationPostUpdateRequest {

    @NotBlank(message = "내용은 필수입니다.")
    private String content;

    private List<String> imageUrls;

    private Integer completionRate; // 완료 정도 (0-100, 선택사항)
}
