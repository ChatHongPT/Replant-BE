package com.app.replant.domain.post.repository;

import com.app.replant.domain.post.entity.Post;
import com.app.replant.domain.post.enums.PostType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

/**
 * PostRepository Custom Interface
 * QueryDSL을 사용한 복잡한 쿼리 메서드 정의
 */
public interface PostRepositoryCustom {

    // ========================================
    // 게시글 목록 조회 (통합)
    // ========================================

    /**
     * 모든 게시글 조회 (GENERAL + VERIFICATION)
     */
    Page<Post> findAllPosts(Pageable pageable);

    /**
     * 게시글 목록 조회. currentUserId가 있으면 공개글 + 내 비공개글, 없으면 공개글만.
     */
    Page<Post> findWithFilters(
            Long missionId,
            boolean badgeOnly,
            Pageable pageable,
            Long currentUserId);

    /**
     * 커뮤니티 게시글 조회 (하위 호환성)
     */
    Page<Post> findCommunityPostsWithFilters(
            Long missionId,
            boolean badgeOnly,
            Pageable pageable);

    // ========================================
    // 타입별 조회
    // ========================================

    Page<Post> findByPostType(PostType postType, Pageable pageable);

    Page<Post> findByUserIdAndPostType(Long userId, PostType postType, Pageable pageable);

    // ========================================
    // 인증글 조회
    // ========================================

    Page<Post> findVerificationPostsWithFilters(String status, Pageable pageable);

    Optional<Post> findVerificationPostById(Long postId);

    Optional<Post> findByUserMissionId(Long userMissionId);

    /**
     * 작성자 + 미션 ID로 인증 게시글 1건 조회 (어느 UserMission으로 작성했는지와 무관).
     * 투두리스트 상세에서 "이 미션에 대한 작성자의 인증글"을 찾을 때 사용.
     */
    Optional<Post> findVerificationPostByUserIdAndMissionId(Long userId, Long missionId);

    // ========================================
    // 단건 조회
    // ========================================

    Optional<Post> getPostByIdExcludingDeleted(Long postId);

    Optional<Post> findByIdAndUserId(Long postId, Long userId);

    /**
     * 사용자별 삭제되지 않은 게시글 조회
     * 통합된 메서드: getUserPostsExcludingDeleted와 동일한 기능
     */
    Page<Post> findByUserIdAndNotDeleted(Long userId, Pageable pageable);

    // ========================================
    // 통계
    // ========================================

    long countApprovedVerificationsByUserId(Long userId);

    long countByUserId(Long userId);
}
