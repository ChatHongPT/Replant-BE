package com.app.replant.domain.post.repository;

import com.app.replant.domain.post.entity.Post;
import com.app.replant.domain.post.enums.PostType;
import com.app.replant.domain.verification.enums.VerificationStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface PostRepository extends JpaRepository<Post, Long> {

    // ========================================
    // 커뮤니티 게시글 조회
    // ========================================

    @Query("SELECT p FROM Post p WHERE " +
           "(p.postType = 'GENERAL' OR p.postType = 'VERIFICATION') AND " +
           "(:missionId IS NULL OR p.mission.id = :missionId) " +
           "AND (:customMissionId IS NULL OR p.customMission.id = :customMissionId) " +
           "AND (:badgeOnly = false OR p.hasValidBadge = true) " +
           "AND (p.delFlag = false OR p.delFlag IS NULL)")
    Page<Post> findCommunityPostsWithFilters(
        @Param("missionId") Long missionId,
        @Param("customMissionId") Long customMissionId,
        @Param("badgeOnly") boolean badgeOnly,
        Pageable pageable
    );

    // 기존 메서드 유지 (호환성) - GENERAL + VERIFICATION 둘 다 조회
    @Query("SELECT p FROM Post p WHERE " +
           "(p.postType = 'GENERAL' OR p.postType = 'VERIFICATION') AND " +
           "(:missionId IS NULL OR p.mission.id = :missionId) " +
           "AND (:customMissionId IS NULL OR p.customMission.id = :customMissionId) " +
           "AND (:badgeOnly = false OR p.hasValidBadge = true) " +
           "AND (p.delFlag = false OR p.delFlag IS NULL)")
    Page<Post> findWithFilters(
        @Param("missionId") Long missionId,
        @Param("customMissionId") Long customMissionId,
        @Param("badgeOnly") boolean badgeOnly,
        Pageable pageable
    );

    @Query("SELECT p FROM Post p WHERE p.id = :postId AND p.user.id = :userId AND (p.delFlag = false OR p.delFlag IS NULL)")
    Optional<Post> findByIdAndUserId(@Param("postId") Long postId, @Param("userId") Long userId);

    @Query("SELECT p FROM Post p WHERE p.id = :postId AND (p.delFlag = false OR p.delFlag IS NULL)")
    Optional<Post> findByIdAndNotDeleted(@Param("postId") Long postId);

    @Query("SELECT p FROM Post p WHERE p.user.id = :userId AND (p.delFlag = false OR p.delFlag IS NULL)")
    Page<Post> findByUserIdAndNotDeleted(@Param("userId") Long userId, Pageable pageable);

    // ========================================
    // 인증글(Verification) 조회
    // ========================================

    @Query("SELECT p FROM Post p " +
           "JOIN FETCH p.user " +
           "LEFT JOIN FETCH p.userMission um " +
           "LEFT JOIN FETCH um.mission " +
           "LEFT JOIN FETCH um.customMission " +
           "WHERE p.postType = 'VERIFICATION' " +
           "AND (:status IS NULL OR p.status = :status) " +
           "AND (:missionId IS NULL OR p.mission.id = :missionId) " +
           "AND (:customMissionId IS NULL OR p.customMission.id = :customMissionId) " +
           "AND (p.delFlag = false OR p.delFlag IS NULL)")
    Page<Post> findVerificationPostsWithFilters(
        @Param("status") VerificationStatus status,
        @Param("missionId") Long missionId,
        @Param("customMissionId") Long customMissionId,
        Pageable pageable
    );

    @Query("SELECT p FROM Post p " +
           "JOIN FETCH p.user " +
           "LEFT JOIN FETCH p.userMission um " +
           "LEFT JOIN FETCH um.mission " +
           "LEFT JOIN FETCH um.customMission " +
           "WHERE p.id = :postId " +
           "AND p.postType = 'VERIFICATION' " +
           "AND (p.delFlag = false OR p.delFlag IS NULL)")
    Optional<Post> findVerificationPostById(@Param("postId") Long postId);

    @Query("SELECT p FROM Post p WHERE p.userMission.id = :userMissionId AND p.postType = 'VERIFICATION'")
    Optional<Post> findByUserMissionId(@Param("userMissionId") Long userMissionId);

    // ========================================
    // 공통 조회
    // ========================================

    @Query("SELECT p FROM Post p WHERE p.postType = :postType AND (p.delFlag = false OR p.delFlag IS NULL)")
    Page<Post> findByPostType(@Param("postType") PostType postType, Pageable pageable);

    @Query("SELECT p FROM Post p WHERE p.user.id = :userId AND p.postType = :postType AND (p.delFlag = false OR p.delFlag IS NULL)")
    Page<Post> findByUserIdAndPostType(@Param("userId") Long userId, @Param("postType") PostType postType, Pageable pageable);

    @Query("SELECT COUNT(p) FROM Post p WHERE p.user.id = :userId AND p.postType = 'VERIFICATION' AND p.status = 'APPROVED'")
    long countApprovedVerificationsByUserId(@Param("userId") Long userId);
}
