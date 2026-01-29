package com.app.replant.domain.mission.repository;

import com.app.replant.domain.mission.entity.Mission;
import com.app.replant.domain.mission.enums.MissionType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

/**
 * Mission Repository
 * QueryDSL을 사용한 복잡한 쿼리는 MissionRepositoryCustom을 통해 구현
 */
public interface MissionRepository extends JpaRepository<Mission, Long>, MissionRepositoryCustom {
    
    /**
     * 제목으로 활성화된 공식 미션 조회
     */
    @Query("SELECT m FROM Mission m WHERE m.title = :title " +
           "AND m.missionType = :missionType AND m.isActive = true")
    Optional<Mission> findByTitleAndMissionTypeAndIsActive(
            @Param("title") String title,
            @Param("missionType") MissionType missionType
    );
}
