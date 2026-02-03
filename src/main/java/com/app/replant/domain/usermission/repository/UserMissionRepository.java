package com.app.replant.domain.usermission.repository;

import com.app.replant.domain.usermission.entity.UserMission;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * UserMission Repository
 * QueryDSL을 사용한 복잡한 쿼리는 UserMissionRepositoryCustom을 통해 구현
 */
public interface UserMissionRepository extends JpaRepository<UserMission, Long>, UserMissionRepositoryCustom {

    /** 투두리스트에서 생성된 UserMission 목록 조회 (삭제 가능 여부 검사용) */
    List<UserMission> findByTodoList_Id(Long todoListId);

    /** 투두리스트에서 생성된 UserMission 전부 삭제 (투두리스트 Hard Delete 시 나의 미션/캘린더에서도 제거) */
    void deleteByTodoList_Id(Long todoListId);
}
