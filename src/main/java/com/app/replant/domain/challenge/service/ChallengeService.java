package com.app.replant.domain.challenge.service;

import com.app.replant.domain.challenge.dto.ChallengeDto;
import com.app.replant.domain.challenge.entity.UserChallenge;
import com.app.replant.domain.challenge.enums.ChallengeStatus;
import com.app.replant.domain.challenge.repository.UserChallengeRepository;
import com.app.replant.domain.mission.entity.Mission;
import com.app.replant.domain.mission.repository.MissionRepository;
import com.app.replant.domain.user.entity.User;
import com.app.replant.domain.user.repository.UserRepository;
import com.app.replant.exception.CustomException;
import com.app.replant.exception.ErrorCode;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional(readOnly = true)
public class ChallengeService {

    private final UserChallengeRepository userChallengeRepository;
    private final MissionRepository missionRepository;
    private final UserRepository userRepository;

    /**
     * 챌린지 시작하기
     */
    @Transactional
    public ChallengeDto.DetailResponse startChallenge(Long userId, ChallengeDto.StartRequest request) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new CustomException(ErrorCode.USER_NOT_FOUND));

        Mission mission = missionRepository.findById(request.getMissionId())
                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_NOT_FOUND));

        // 챌린지 미션인지 확인
        if (!Boolean.TRUE.equals(mission.getIsChallenge())) {
            throw new CustomException(ErrorCode.INVALID_REQUEST, "챌린지 미션이 아닙니다.");
        }

        // 이미 해당 미션으로 진행중인 챌린지가 있는지 확인
        if (userChallengeRepository.existsByUserAndMissionAndStatus(user, mission, ChallengeStatus.ACTIVE)) {
            throw new CustomException(ErrorCode.INVALID_REQUEST, "이미 진행중인 챌린지입니다.");
        }

        // 기간 설정 (요청에 없으면 미션의 기본 기간 사용)
        Integer durationDays = request.getDurationDays();
        if (durationDays == null) {
            durationDays = mission.getChallengeDays() != null ? mission.getChallengeDays() : 7;
        }

        UserChallenge challenge = UserChallenge.builder()
                .user(user)
                .mission(mission)
                .durationDays(durationDays)
                .build();

        userChallengeRepository.save(challenge);

        log.info("챌린지 시작: id={}, missionId={}, userId={}", challenge.getId(), mission.getId(), userId);
        return ChallengeDto.DetailResponse.from(challenge);
    }

    /**
     * 활성 챌린지 목록 조회
     */
    public List<ChallengeDto.SimpleResponse> getActiveChallenges(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new CustomException(ErrorCode.USER_NOT_FOUND));

        List<UserChallenge> challenges = userChallengeRepository.findActiveByUser(user);

        // 오늘 완료 상태 리셋 (필요시)
        challenges.forEach(UserChallenge::resetTodayStatus);

        return challenges.stream()
                .map(ChallengeDto.SimpleResponse::from)
                .collect(Collectors.toList());
    }

    /**
     * 모든 챌린지 목록 조회
     */
    public List<ChallengeDto.SimpleResponse> getAllChallenges(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new CustomException(ErrorCode.USER_NOT_FOUND));

        return userChallengeRepository.findAllByUser(user).stream()
                .map(ChallengeDto.SimpleResponse::from)
                .collect(Collectors.toList());
    }

    /**
     * 챌린지 상세 조회
     */
    public ChallengeDto.DetailResponse getChallengeDetail(Long challengeId, Long userId) {
        UserChallenge challenge = userChallengeRepository.findByIdWithMission(challengeId)
                .orElseThrow(() -> new CustomException(ErrorCode.NOT_FOUND, "챌린지를 찾을 수 없습니다."));

        // 본인만 조회 가능
        if (!challenge.getUser().getId().equals(userId)) {
            throw new CustomException(ErrorCode.ACCESS_DENIED);
        }

        return ChallengeDto.DetailResponse.from(challenge);
    }

    /**
     * 오늘 챌린지 완료 처리
     */
    @Transactional
    public ChallengeDto.DetailResponse completeToday(Long challengeId, Long userId) {
        UserChallenge challenge = userChallengeRepository.findByIdWithMission(challengeId)
                .orElseThrow(() -> new CustomException(ErrorCode.NOT_FOUND, "챌린지를 찾을 수 없습니다."));

        // 본인만 완료 가능
        if (!challenge.getUser().getId().equals(userId)) {
            throw new CustomException(ErrorCode.ACCESS_DENIED);
        }

        // 활성 상태인지 확인
        if (!challenge.isActive()) {
            throw new CustomException(ErrorCode.INVALID_REQUEST, "이미 종료된 챌린지입니다.");
        }

        // 오늘 이미 완료했는지 확인
        if (Boolean.TRUE.equals(challenge.getTodayCompleted())) {
            throw new CustomException(ErrorCode.INVALID_REQUEST, "오늘 이미 완료한 챌린지입니다.");
        }

        challenge.completeToday();

        log.info("챌린지 오늘 완료: challengeId={}, streak={}, total={}",
                challengeId, challenge.getCurrentStreak(), challenge.getTotalCompletedDays());

        return ChallengeDto.DetailResponse.from(challenge);
    }

    /**
     * 활성 챌린지 개수 조회
     */
    public long getActiveChallengeCount(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new CustomException(ErrorCode.USER_NOT_FOUND));

        return userChallengeRepository.countActiveByUser(user);
    }
}
