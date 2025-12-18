package com.app.replant.service.goal;

import com.app.replant.controller.dto.SetGoalDto;
import com.app.replant.entity.Goal;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 목표 서비스 구현
 */
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class GoalServiceImpl implements GoalService {

    @Override
    @Transactional
    public Goal setGoal(Long memberId, SetGoalDto setGoalDto) {
        // TODO: 실제 구현 필요
        return setGoalDto.toEntity();
    }

    @Override
    public Goal getGoalByMemberId(Long memberId) {
        // TODO: 실제 구현 필요
        throw new IllegalArgumentException("Goal not found");
    }

    @Override
    @Transactional
    public Goal updateGoal(Long memberId, SetGoalDto setGoalDto) {
        // TODO: 실제 구현 필요
        return setGoalDto.toEntity();
    }

    @Override
    @Transactional
    public void calculateGoalScores() {
        // TODO: 실제 구현 필요
    }
}
