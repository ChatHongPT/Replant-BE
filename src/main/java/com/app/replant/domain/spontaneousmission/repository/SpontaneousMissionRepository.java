package com.app.replant.domain.spontaneousmission.repository;

import com.app.replant.domain.spontaneousmission.entity.SpontaneousMission;
import com.app.replant.domain.spontaneousmission.enums.SpontaneousMissionType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SpontaneousMissionRepository extends JpaRepository<SpontaneousMission, Long> {
    Optional<SpontaneousMission> findByMissionType(SpontaneousMissionType missionType);
}
