package com.app.replant.domain.verification.repository;

import com.app.replant.domain.verification.entity.VerificationVote;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface VerificationVoteRepository extends JpaRepository<VerificationVote, Long> {

    boolean existsByPostIdAndUserId(Long postId, Long userId);

    @Query("SELECT vv FROM VerificationVote vv WHERE vv.post.id = :postId AND vv.user.id = :userId")
    Optional<VerificationVote> findByPostIdAndUserId(@Param("postId") Long postId, @Param("userId") Long userId);
}
