package com.app.replant.domain.challenge.repository;

import com.app.replant.domain.challenge.entity.UserChallenge;
import com.app.replant.domain.challenge.enums.ChallengeStatus;
import com.app.replant.domain.mission.entity.Mission;
import com.app.replant.domain.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserChallengeRepository extends JpaRepository<UserChallenge, Long> {

    /**
     * 사용자의 활성 챌린지 목록
     */
    @Query("SELECT uc FROM UserChallenge uc JOIN FETCH uc.mission " +
           "WHERE uc.user = :user AND uc.status = 'ACTIVE' " +
           "ORDER BY uc.startDate DESC")
    List<UserChallenge> findActiveByUser(@Param("user") User user);

    /**
     * 사용자의 모든 챌린지 목록
     */
    @Query("SELECT uc FROM UserChallenge uc JOIN FETCH uc.mission " +
           "WHERE uc.user = :user ORDER BY uc.createdAt DESC")
    List<UserChallenge> findAllByUser(@Param("user") User user);

    /**
     * 사용자의 특정 상태 챌린지 목록
     */
    @Query("SELECT uc FROM UserChallenge uc JOIN FETCH uc.mission " +
           "WHERE uc.user = :user AND uc.status = :status " +
           "ORDER BY uc.startDate DESC")
    List<UserChallenge> findByUserAndStatus(
        @Param("user") User user,
        @Param("status") ChallengeStatus status
    );

    /**
     * 사용자의 특정 미션에 대한 활성 챌린지 존재 여부
     */
    boolean existsByUserAndMissionAndStatus(User user, Mission mission, ChallengeStatus status);

    /**
     * 챌린지 상세 조회 (미션 정보 포함)
     */
    @Query("SELECT uc FROM UserChallenge uc JOIN FETCH uc.mission " +
           "WHERE uc.id = :id")
    Optional<UserChallenge> findByIdWithMission(@Param("id") Long id);

    /**
     * 사용자의 활성 챌린지 개수
     */
    @Query("SELECT COUNT(uc) FROM UserChallenge uc WHERE uc.user = :user AND uc.status = 'ACTIVE'")
    long countActiveByUser(@Param("user") User user);

    /**
     * 사용자의 특정 미션에 대한 활성 챌린지
     */
    @Query("SELECT uc FROM UserChallenge uc WHERE uc.user = :user AND uc.mission = :mission AND uc.status = 'ACTIVE'")
    Optional<UserChallenge> findActiveByUserAndMission(@Param("user") User user, @Param("mission") Mission mission);
}
