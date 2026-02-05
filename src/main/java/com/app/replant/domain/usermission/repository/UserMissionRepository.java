package com.app.replant.domain.usermission.repository;

import com.app.replant.domain.usermission.entity.UserMission;
import com.app.replant.domain.usermission.enums.UserMissionStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

/**
 * UserMission Repository
 * QueryDSL을 사용한 복잡한 쿼리는 UserMissionRepositoryCustom을 통해 구현
 */
public interface UserMissionRepository extends JpaRepository<UserMission, Long>, UserMissionRepositoryCustom {

    // TODO: UserMission 엔티티에 TodoList 필드가 없어서 주석 처리
    // 투두리스트와 UserMission의 관계는 TodoListMission을 통해 관리됨
    // List<UserMission> findByTodoList_Id(Long todoListId);
    // void deleteByTodoList_Id(Long todoListId);
    
    // TODO: isSpontaneous 필드가 삭제되어 임시로 주석 처리
    // 필요시 mission IS NULL 조건으로 QueryDSL로 구현 필요
    // Optional<UserMission> findTopByUserIdAndIsSpontaneousAndStatusOrderByAssignedAtDesc(
    //         Long userId, Boolean isSpontaneous, UserMissionStatus status);
}
