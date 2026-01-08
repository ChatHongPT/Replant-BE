package com.app.replant.domain.post.repository;

import com.app.replant.domain.post.entity.Comment;
import com.app.replant.domain.post.enums.CommentTargetType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    // 게시글의 모든 댓글 조회
    @Query("SELECT c FROM Comment c WHERE c.post.id = :postId")
    Page<Comment> findByPostId(@Param("postId") Long postId, Pageable pageable);

    // 최상위 댓글만 조회 (parent가 null인 것들) - User까지 함께 로딩
    @Query("SELECT DISTINCT c FROM Comment c " +
           "LEFT JOIN FETCH c.user " +
           "LEFT JOIN FETCH c.replies r " +
           "LEFT JOIN FETCH r.user " +
           "WHERE c.post.id = :postId AND c.parent IS NULL " +
           "ORDER BY c.createdAt ASC")
    List<Comment> findParentCommentsByPostIdWithUser(@Param("postId") Long postId);

    // 특정 사용자의 특정 댓글 조회
    @Query("SELECT c FROM Comment c WHERE c.id = :commentId AND c.user.id = :userId")
    Optional<Comment> findByIdAndUserId(@Param("commentId") Long commentId, @Param("userId") Long userId);

    // 게시글의 댓글 수 조회
    @Query("SELECT COUNT(c) FROM Comment c WHERE c.post.id = :postId")
    long countByPostId(@Param("postId") Long postId);

    // 특정 댓글의 대댓글 조회
    @Query("SELECT c FROM Comment c WHERE c.parent.id = :parentId ORDER BY c.createdAt ASC")
    List<Comment> findRepliesByParentId(@Param("parentId") Long parentId);

    // ============================================
    // targetType/targetId 기반 일반화된 댓글 쿼리
    // ============================================

    // 특정 대상의 모든 댓글 조회 (페이징)
    @Query("SELECT c FROM Comment c WHERE c.targetType = :targetType AND c.targetId = :targetId")
    Page<Comment> findByTarget(@Param("targetType") CommentTargetType targetType,
                               @Param("targetId") Long targetId,
                               Pageable pageable);

    // 특정 대상의 최상위 댓글만 조회 (User 포함)
    @Query("SELECT DISTINCT c FROM Comment c " +
           "LEFT JOIN FETCH c.user " +
           "LEFT JOIN FETCH c.replies r " +
           "LEFT JOIN FETCH r.user " +
           "WHERE c.targetType = :targetType AND c.targetId = :targetId AND c.parent IS NULL " +
           "ORDER BY c.createdAt ASC")
    List<Comment> findParentCommentsByTargetWithUser(@Param("targetType") CommentTargetType targetType,
                                                      @Param("targetId") Long targetId);

    // 특정 대상의 댓글 수 조회
    @Query("SELECT COUNT(c) FROM Comment c WHERE c.targetType = :targetType AND c.targetId = :targetId")
    long countByTarget(@Param("targetType") CommentTargetType targetType,
                       @Param("targetId") Long targetId);
}
