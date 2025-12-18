package com.app.replant.domain.usermission.repository;

import com.app.replant.domain.usermission.entity.UserMission;
import com.app.replant.domain.usermission.enums.UserMissionStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface UserMissionRepository extends JpaRepository<UserMission, Long> {

    @Query("SELECT um FROM UserMission um WHERE um.user.id = :userId " +
           "AND (:status IS NULL OR um.status = :status) " +
           "AND (:missionType IS NULL OR " +
           "   (:missionType = 'SYSTEM' AND um.mission IS NOT NULL) OR " +
           "   (:missionType = 'CUSTOM' AND um.customMission IS NOT NULL))")
    Page<UserMission> findByUserIdWithFilters(
        @Param("userId") Long userId,
        @Param("status") UserMissionStatus status,
        @Param("missionType") String missionType,
        Pageable pageable
    );

    @Query("SELECT um FROM UserMission um WHERE um.id = :userMissionId AND um.user.id = :userId")
    Optional<UserMission> findByIdAndUserId(@Param("userMissionId") Long userMissionId, @Param("userId") Long userId);
}
