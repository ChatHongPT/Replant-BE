package com.app.replant.domain.missionset.service;

import com.app.replant.domain.mission.entity.Mission;
import com.app.replant.domain.mission.enums.MissionCategory;
import com.app.replant.domain.mission.repository.MissionRepository;
import com.app.replant.domain.missionset.dto.TodoListDto;
import com.app.replant.domain.missionset.entity.TodoList;
import com.app.replant.domain.missionset.entity.TodoListLike;
import com.app.replant.domain.missionset.entity.TodoListMission;
import com.app.replant.domain.missionset.enums.MissionSource;
import com.app.replant.domain.missionset.enums.TodoListStatus;
import com.app.replant.domain.missionset.repository.TodoListLikeRepository;
import com.app.replant.domain.missionset.repository.TodoListMissionRepository;
import com.app.replant.domain.missionset.repository.TodoListRepository;
import com.app.replant.domain.user.entity.User;
import com.app.replant.domain.user.repository.UserRepository;
import com.app.replant.domain.usermission.entity.UserMission;
import com.app.replant.domain.usermission.enums.UserMissionStatus;
import com.app.replant.domain.usermission.repository.UserMissionRepository;
import com.app.replant.domain.badge.repository.UserBadgeRepository;
import com.app.replant.global.exception.CustomException;
import com.app.replant.global.exception.ErrorCode;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional(readOnly = true)
public class TodoListService {

        private final TodoListRepository todoListRepository;
        private final TodoListMissionRepository todoListMissionRepository;
        private final TodoListLikeRepository likeRepository;
        private final MissionRepository missionRepository;
        private final UserRepository userRepository;
        private final UserMissionRepository userMissionRepository;
        private final UserBadgeRepository userBadgeRepository;

        private static final int RANDOM_OFFICIAL_COUNT = 3; // 필수 공식 미션 개수

        /**
         * 투두리스트 초기화 - 랜덤 공식 미션 3개 조회
         * 사용자가 선호 카테고리를 선택한 경우 해당 카테고리 미션만 조회
         */
        public TodoListDto.InitResponse initTodoList(Long userId) {
                User user = userRepository.findById(userId)
                                .orElse(null);
                List<MissionCategory> preferredCategories = user != null ? user.getPreferredMissionCategories() : null;
                boolean useCategories = preferredCategories != null && !preferredCategories.isEmpty();

                List<Mission> randomMissions;
                if (useCategories) {
                        randomMissions = missionRepository
                                        .findRandomOfficialNonChallengeMissionsByCategories(RANDOM_OFFICIAL_COUNT, preferredCategories);
                        // 해당 카테고리 미션이 3개 미만이면 전체 공식 미션으로 보완
                        if (randomMissions.size() < RANDOM_OFFICIAL_COUNT) {
                                List<Mission> fallback = missionRepository
                                                .findRandomOfficialNonChallengeMissions(RANDOM_OFFICIAL_COUNT);
                                Set<Long> haveIds = randomMissions.stream().map(Mission::getId).collect(Collectors.toSet());
                                for (Mission m : fallback) {
                                        if (haveIds.size() >= RANDOM_OFFICIAL_COUNT) break;
                                        if (!haveIds.contains(m.getId())) {
                                                randomMissions.add(m);
                                                haveIds.add(m.getId());
                                        }
                                }
                        }
                } else {
                        randomMissions = missionRepository
                                        .findRandomOfficialNonChallengeMissions(RANDOM_OFFICIAL_COUNT);
                }

                if (randomMissions.size() < RANDOM_OFFICIAL_COUNT) {
                        log.warn("공식 미션이 {}개 미만입니다. 현재: {}개", RANDOM_OFFICIAL_COUNT, randomMissions.size());
                }

                return TodoListDto.InitResponse.builder()
                                .randomMissions(randomMissions.stream()
                                                .limit(RANDOM_OFFICIAL_COUNT)
                                                .map(TodoListDto.MissionSimpleResponse::from)
                                                .collect(Collectors.toList()))
                                .build();
        }

        /**
         * 랜덤 미션 리롤 - 기존 미션을 제외하고 새로운 랜덤 미션 1개 조회
         * 사용자 선호 카테고리가 있으면 해당 카테고리 미션만 대상 (없으면 전체에서 fallback)
         */
        public TodoListDto.MissionSimpleResponse rerollRandomMission(Long userId, List<Long> excludeMissionIds) {
                User user = userRepository.findById(userId).orElse(null);
                List<MissionCategory> preferredCategories = user != null ? user.getPreferredMissionCategories() : null;
                boolean useCategories = preferredCategories != null && !preferredCategories.isEmpty();

                Optional<Mission> opt = useCategories
                                ? missionRepository.findRandomOfficialNonChallengeMissionExcludingByCategories(excludeMissionIds, preferredCategories)
                                : missionRepository.findRandomOfficialNonChallengeMissionExcluding(excludeMissionIds);
                Mission newMission = opt.orElseGet(() ->
                                missionRepository.findRandomOfficialNonChallengeMissionExcluding(excludeMissionIds)
                                                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_NOT_FOUND,
                                                                "교체할 수 있는 공식 미션이 없습니다.")));

                return TodoListDto.MissionSimpleResponse.from(newMission);
        }

        /**
         * 커스텀 미션 도감 조회 (투두리스트 선택용)
         * onlyMine=true: 내가 만든 미션만 반환
         * onlyMine=false: 본인 것 + 다른 사람의 공개 커스텀 미션
         */
        public List<TodoListDto.MissionSimpleResponse> getSelectableMissions(Long userId, Boolean onlyMine, String searchQuery) {
                // 본인이 만든 커스텀 미션
                List<Mission> myMissions = missionRepository.findNonChallengeCustomMissionsByCreator(userId);
                if (Boolean.TRUE.equals(onlyMine)) {
                        return filterMissionsBySearchQuery(myMissions, searchQuery).stream()
                                        .map(TodoListDto.MissionSimpleResponse::from)
                                        .collect(Collectors.toList());
                }
                // 다른 사람들의 공개 커스텀 미션
                List<Mission> publicMissions = missionRepository.findAllPublicNonChallengeCustomMissions();

                // 중복 제거 (본인 것이 공개일 경우)
                java.util.Set<Long> myMissionIds = myMissions.stream()
                                .map(Mission::getId)
                                .collect(java.util.stream.Collectors.toSet());

                List<Mission> allMissions = new java.util.ArrayList<>(myMissions);
                publicMissions.stream()
                                .filter(m -> !myMissionIds.contains(m.getId()))
                                .forEach(allMissions::add);

                return filterMissionsBySearchQuery(allMissions, searchQuery).stream()
                                .map(TodoListDto.MissionSimpleResponse::from)
                                .collect(Collectors.toList());
        }

        /**
         * 검색어로 미션 필터링
         */
        private List<Mission> filterMissionsBySearchQuery(List<Mission> missions, String searchQuery) {
                if (searchQuery == null || searchQuery.trim().isEmpty()) {
                        return missions;
                }
                String query = searchQuery.toLowerCase().trim();
                return missions.stream()
                                .filter(mission -> 
                                        (mission.getTitle() != null && mission.getTitle().toLowerCase().contains(query)) ||
                                        (mission.getDescription() != null && mission.getDescription().toLowerCase().contains(query)) ||
                                        (mission.getCategory() != null && mission.getCategory().name().toLowerCase().contains(query))
                                )
                                .collect(Collectors.toList());
        }

        /**
         * 투두리스트 생성
         * 필수 공식 미션 3개 + 선택 커스텀 미션 (0개 이상)
         */
        @Transactional
        public TodoListDto.DetailResponse createTodoList(Long userId, TodoListDto.CreateRequest request) {
                User user = userRepository.findById(userId)
                                .orElseThrow(() -> new CustomException(ErrorCode.USER_NOT_FOUND));

                // 검증: 당일 이미 투두리스트가 생성되었는지 확인
                LocalDateTime now = LocalDateTime.now();
                LocalDateTime startOfDay = now.toLocalDate().atStartOfDay();
                LocalDateTime endOfDay = startOfDay.plusDays(1);
                if (todoListRepository.existsByCreatorAndCreatedDate(user, startOfDay, endOfDay)) {
                        throw new CustomException(ErrorCode.TODO_DUPLICATE_DATE);
                }

                // 검증: 필수 공식 미션 3개 필수
                if (request.getRandomMissionIds() == null
                                || request.getRandomMissionIds().size() != RANDOM_OFFICIAL_COUNT) {
                        throw new CustomException(ErrorCode.INVALID_REQUEST,
                                        "필수 공식 미션은 정확히 " + RANDOM_OFFICIAL_COUNT + "개여야 합니다.");
                }

                // 커스텀 미션은 0개 이상 허용 (null이면 빈 리스트로 처리)
                List<Long> customMissionIds = request.getCustomMissionIds() != null 
                                ? request.getCustomMissionIds() 
                                : java.util.Collections.emptyList();

                // 미션들 조회
                List<Mission> randomMissions = missionRepository.findByIdIn(request.getRandomMissionIds());
                List<Mission> customMissions = customMissionIds.isEmpty() 
                                ? java.util.Collections.emptyList()
                                : missionRepository.findByIdIn(customMissionIds);


                // 투두리스트 생성 (총 미션 수 = 필수 3개 + 커스텀 미션 개수)
                int totalMissionCount = RANDOM_OFFICIAL_COUNT + customMissions.size();
                TodoList todoList = TodoList.todoListBuilder()
                                .creator(user)
                                .title(request.getTitle() != null ? request.getTitle() : "나의 투두리스트")
                                .description(request.getDescription())
                                .totalCount(totalMissionCount)
                                .build();

                // 랜덤 공식 미션 추가
                int order = 0;
                LocalDateTime defaultDueDate = now.plusDays(7); // 기본 마감일 7일

                for (Mission mission : randomMissions) {
                        TodoListMission msm = TodoListMission.todoMissionBuilder()
                                        .todoList(todoList)
                                        .mission(mission)
                                        .displayOrder(order++)
                                        .missionSource(MissionSource.RANDOM_OFFICIAL)
                                        .build();
                        
                        if (request.getMissionSchedules() != null) {
                                TodoListDto.CreateRequest.MissionScheduleInfo schedule = 
                                                request.getMissionSchedules().get(mission.getId());
                                if (schedule != null && schedule.getStartTime() != null && schedule.getEndTime() != null) {
                                        if (!schedule.getStartTime().isBefore(schedule.getEndTime())) {
                                                throw new CustomException(ErrorCode.INVALID_REQUEST,
                                                                "미션 '" + mission.getTitle() + "'의 시작 시간은 종료 시간보다 이전이어야 합니다.");
                                        }
                                        msm.updateSchedule(schedule.getStartTime(), schedule.getEndTime());
                                }
                        }
                        
                        todoList.getMissions().add(msm);
                }

                for (Mission mission : customMissions) {
                        TodoListMission msm = TodoListMission.todoMissionBuilder()
                                        .todoList(todoList)
                                        .mission(mission)
                                        .displayOrder(order++)
                                        .missionSource(MissionSource.CUSTOM_SELECTED)
                                        .build();
                        
                        if (request.getMissionSchedules() != null) {
                                TodoListDto.CreateRequest.MissionScheduleInfo schedule = 
                                                request.getMissionSchedules().get(mission.getId());
                                if (schedule != null && schedule.getStartTime() != null && schedule.getEndTime() != null) {
                                        if (!schedule.getStartTime().isBefore(schedule.getEndTime())) {
                                                throw new CustomException(ErrorCode.INVALID_REQUEST,
                                                                "미션 '" + mission.getTitle() + "'의 시작 시간은 종료 시간보다 이전이어야 합니다.");
                                        }
                                        msm.updateSchedule(schedule.getStartTime(), schedule.getEndTime());
                                }
                        }
                        
                        todoList.getMissions().add(msm);
                }

                todoListRepository.save(todoList);

                // UserMission 생성 (todo_list_id 연결 → 투두리스트 Hard Delete 시 나의 미션/캘린더에서도 제거)
                for (TodoListMission msm : todoList.getMissions()) {
                        Mission mission = msm.getMission();
                        LocalDateTime dueDate = mission.getDurationDays() != null
                                        ? now.plusDays(mission.getDurationDays())
                                        : (mission.getDeadlineDays() != null ? now.plusDays(mission.getDeadlineDays())
                                                        : defaultDueDate);
                        UserMission userMission = UserMission.builder()
                                        .user(user)
                                        .mission(mission)
                                        .missionType(mission.getMissionType())
                                        .assignedAt(now)
                                        .dueDate(dueDate)
                                        .status(UserMissionStatus.ASSIGNED)
                                        .todoList(todoList)
                                        .build();
                        userMissionRepository.saveAndFlush(userMission);
                }

                log.info("투두리스트 생성 완료: id={}, userId={}, 필수 미션 {}개, 커스텀 미션 {}개, 총 {}개",
                                todoList.getId(), userId, RANDOM_OFFICIAL_COUNT, customMissions.size(), totalMissionCount);
                return TodoListDto.DetailResponse.from(todoList, userId, userMissionRepository);
        }

        /**
         * 내 투두리스트 목록 조회
         */
        public Page<TodoListDto.SimpleResponse> getMyTodoLists(Long userId, Pageable pageable) {
                User user = userRepository.findById(userId)
                                .orElseThrow(() -> new CustomException(ErrorCode.USER_NOT_FOUND));

                return todoListRepository.findTodoListsByCreator(user, pageable)
                                .map(TodoListDto.SimpleResponse::from);
        }

        /**
         * 활성 투두리스트 목록 조회
         */
        public List<TodoListDto.SimpleResponse> getActiveTodoLists(Long userId) {
                User user = userRepository.findById(userId)
                                .orElseThrow(() -> new CustomException(ErrorCode.USER_NOT_FOUND));

                return todoListRepository.findTodoListsByCreatorAndStatus(user, TodoListStatus.ACTIVE)
                                .stream()
                                .map(TodoListDto.SimpleResponse::from)
                                .collect(Collectors.toList());
        }

        /**
         * 공개 투두리스트 목록 조회
         */
        public Page<TodoListDto.SimpleResponse> getPublicTodoLists(Pageable pageable, String sortBy) {
                return todoListRepository.findPublicTodoLists(pageable, sortBy)
                                .map(todoList -> {
                                        TodoListDto.SimpleResponse response = TodoListDto.SimpleResponse.from(todoList);
                                        int likeCount = (int) likeRepository.countByTodoList(todoList);
                                        return TodoListDto.SimpleResponse.builder()
                                                        .id(response.getId())
                                                        .title(response.getTitle())
                                                        .description(response.getDescription())
                                                        .completedCount(response.getCompletedCount())
                                                        .totalCount(response.getTotalCount())
                                                        .progressRate(response.getProgressRate())
                                                        .canCreateNew(response.getCanCreateNew())
                                                        .status(response.getStatus())
                                                        .createdAt(response.getCreatedAt())
                                                        .creatorId(response.getCreatorId())
                                                        .creatorNickname(response.getCreatorNickname())
                                                        .likeCount(likeCount)
                                                        .build();
                                });
        }

        /**
         * 공개 투두리스트 검색
         */
        public Page<TodoListDto.SimpleResponse> searchPublicTodoLists(String keyword, Pageable pageable, String sortBy) {
                if (keyword == null || keyword.trim().isEmpty()) {
                        // 키워드가 없으면 일반 목록 조회
                        return getPublicTodoLists(pageable, sortBy);
                }
                return todoListRepository.searchPublicTodoLists(keyword.trim(), pageable, sortBy)
                                .map(todoList -> {
                                        TodoListDto.SimpleResponse response = TodoListDto.SimpleResponse.from(todoList);
                                        int likeCount = (int) likeRepository.countByTodoList(todoList);
                                        return TodoListDto.SimpleResponse.builder()
                                                        .id(response.getId())
                                                        .title(response.getTitle())
                                                        .description(response.getDescription())
                                                        .completedCount(response.getCompletedCount())
                                                        .totalCount(response.getTotalCount())
                                                        .progressRate(response.getProgressRate())
                                                        .canCreateNew(response.getCanCreateNew())
                                                        .status(response.getStatus())
                                                        .createdAt(response.getCreatedAt())
                                                        .creatorId(response.getCreatorId())
                                                        .creatorNickname(response.getCreatorNickname())
                                                        .likeCount(likeCount)
                                                        .build();
                                });
        }

        /**
         * 투두리스트 상세 조회
         */
        public TodoListDto.DetailResponse getTodoListDetail(Long todoListId, Long userId) {
                TodoList todoList = todoListRepository.findTodoListByIdWithMissions(todoListId)
                                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_SET_NOT_FOUND));

                // 본인만 조회 가능
                if (!todoList.isCreator(userId)) {
                        throw new CustomException(ErrorCode.ACCESS_DENIED);
                }

                return TodoListDto.DetailResponse.from(todoList, userId, userMissionRepository);
        }

        /**
         * 공개 투두리스트 상세 조회
         */
        public TodoListDto.DetailResponse getPublicTodoListDetail(Long todoListId, Long userId) {
                TodoList todoList = todoListRepository.findTodoListByIdWithMissions(todoListId)
                                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_SET_NOT_FOUND));

                // 공개된 투두리스트만 조회 가능
                Boolean isPublic = todoList.getIsPublic();
                if (isPublic == null || !isPublic) {
                        throw new CustomException(ErrorCode.ACCESS_DENIED);
                }

                int likeCount = (int) likeRepository.countByTodoList(todoList);
                boolean isLiked = userId != null && likeRepository.existsByTodoListAndUser(todoList, userRepository.findById(userId).orElse(null));

                TodoListDto.DetailResponse baseResponse = TodoListDto.DetailResponse.from(todoList, userId, userMissionRepository);
                return TodoListDto.DetailResponse.builder()
                                .id(baseResponse.getId())
                                .title(baseResponse.getTitle())
                                .description(baseResponse.getDescription())
                                .completedCount(baseResponse.getCompletedCount())
                                .totalCount(baseResponse.getTotalCount())
                                .progressRate(baseResponse.getProgressRate())
                                .canCreateNew(baseResponse.getCanCreateNew())
                                .status(baseResponse.getStatus())
                                .missions(baseResponse.getMissions())
                                .createdAt(baseResponse.getCreatedAt())
                                .updatedAt(baseResponse.getUpdatedAt())
                                .creatorId(baseResponse.getCreatorId())
                                .creatorNickname(baseResponse.getCreatorNickname())
                                .missionCount(baseResponse.getMissionCount() != null ? baseResponse.getMissionCount() : baseResponse.getTotalCount())
                                .likeCount(likeCount)
                                .isLiked(isLiked)
                                .build();
        }

        /**
         * 투두리스트 미션 완료 처리
         */
        @Transactional
        public TodoListDto.DetailResponse completeMission(Long todoListId, Long missionId, Long userId) {
                TodoList todoList = todoListRepository.findTodoListByIdWithMissions(todoListId)
                                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_SET_NOT_FOUND));

                // 본인만 완료 가능
                if (!todoList.isCreator(userId)) {
                        throw new CustomException(ErrorCode.ACCESS_DENIED);
                }

                // 미션 찾기
                TodoListMission targetMission = todoList.getMissions().stream()
                                .filter(msm -> msm.getMission().getId().equals(missionId))
                                .findFirst()
                                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_NOT_IN_SET));

                // 이미 완료된 미션인지 확인
                if (targetMission.isCompletedMission()) {
                        throw new CustomException(ErrorCode.INVALID_REQUEST, "이미 완료된 미션입니다.");
                }

                Mission mission = targetMission.getMission();
                
                // 공식 미션인 경우: 인증 필수 (UserMission이 COMPLETED 상태여야 함)
                if (mission.isOfficialMission()) {
                        // 중복이 있을 수 있으므로 첫 번째 결과만 사용
                        List<UserMission> userMissions = userMissionRepository.findByUserIdAndMissionId(userId, missionId);
                        if (userMissions.isEmpty()) {
                                throw new CustomException(ErrorCode.USER_MISSION_NOT_FOUND);
                        }
                        UserMission userMission = userMissions.get(0);
                        
                        // UserMission이 COMPLETED 상태가 아니면 인증이 완료되지 않은 것
                        if (userMission.getStatus() != UserMissionStatus.COMPLETED) {
                                throw new CustomException(ErrorCode.VERIFICATION_REQUIRED);
                        }
                }
                
                // 커스텀 미션인 경우: 인증 없이 바로 완료 처리 가능
                // 미션 완료 처리
                targetMission.complete();

                // UserMission도 완료 처리 (커스텀 미션의 경우 ASSIGNED 상태에서 바로 COMPLETED로 변경)
                if (mission.isCustomMission()) {
                        // 중복이 있을 수 있으므로 첫 번째 결과만 사용
                        List<UserMission> userMissions = userMissionRepository.findByUserIdAndMissionIdAndStatusAssigned(userId, missionId);
                        if (!userMissions.isEmpty()) {
                                userMissions.get(0).complete();
                        }
                }

                // 투두리스트 완료 카운트 증가
                todoList.incrementCompletedCount();

                log.info("투두리스트 미션 완료: todoListId={}, missionId={}, completedCount={}",
                                todoListId, missionId, todoList.getCompletedCount());

                return TodoListDto.DetailResponse.from(todoList, userId, userMissionRepository);
        }

        /**
         * 새 투두리스트 생성 가능 여부 확인
         * 개수 제한 없음 (신규 가입자 포함, 모든 사용자가 생성 가능)
         */
        public boolean canCreateNewTodoList(Long userId) {
                // 개수 제한 없음 - 항상 생성 가능
                return true;
        }

        /**
         * 활성 투두리스트 개수 조회
         */
        public long getActiveTodoListCount(Long userId) {
                User user = userRepository.findById(userId)
                                .orElseThrow(() -> new CustomException(ErrorCode.USER_NOT_FOUND));

                return todoListRepository.countActiveTodoListsByCreator(user);
        }

        /**
         * 투두리스트 보관처리
         */
        @Transactional
        public void archiveTodoList(Long todoListId, Long userId) {
                TodoList todoList = todoListRepository.findTodoListByIdWithMissions(todoListId)
                                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_SET_NOT_FOUND));

                // 본인만 보관 가능
                if (!todoList.isCreator(userId)) {
                        throw new CustomException(ErrorCode.ACCESS_DENIED);
                }

                todoList.archiveTodoList();
                log.info("투두리스트 보관 완료: todoListId={}, userId={}", todoListId, userId);
        }

        /**
         * 투두리스트 좋아요 추가
         * 본인 투두리스트에는 불가. 이미 좋아요한 경우 무시(200).
         */
        @Transactional
        public void likeTodoList(Long todoListId, Long userId) {
                TodoList todoList = todoListRepository.findById(todoListId)
                                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_SET_NOT_FOUND));

                if (todoList.isCreator(userId)) {
                        throw new CustomException(ErrorCode.INVALID_REQUEST, "자신의 투두리스트에는 좋아요를 누를 수 없습니다.");
                }

                User user = userRepository.findById(userId)
                                .orElseThrow(() -> new CustomException(ErrorCode.USER_NOT_FOUND));

                if (likeRepository.existsByTodoListAndUser(todoList, user)) {
                        return; // 이미 좋아요함 → 무시
                }

                TodoListLike like = TodoListLike.builder()
                                .todoList(todoList)
                                .user(user)
                                .build();
                likeRepository.save(like);
                log.info("투두리스트 좋아요: todoListId={}, userId={}", todoListId, userId);
        }

        /**
         * 투두리스트 좋아요 취소
         */
        @Transactional
        public void unlikeTodoList(Long todoListId, Long userId) {
                TodoList todoList = todoListRepository.findById(todoListId)
                                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_SET_NOT_FOUND));

                User user = userRepository.findById(userId)
                                .orElseThrow(() -> new CustomException(ErrorCode.USER_NOT_FOUND));

                likeRepository.deleteByTodoListAndUser(todoList, user);
                log.info("투두리스트 좋아요 취소: todoListId={}, userId={}", todoListId, userId);
        }

        /**
         * 투두리스트 수정
         */
        @Transactional
        public TodoListDto.DetailResponse updateTodoList(Long todoListId, Long userId,
                        TodoListDto.UpdateRequest request) {
                TodoList todoList = todoListRepository.findById(todoListId)
                                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_SET_NOT_FOUND));

                // 생성자만 수정 가능
                if (!todoList.isCreator(userId)) {
                        throw new CustomException(ErrorCode.ACCESS_DENIED);
                }

                todoList.update(request.getTitle(), request.getDescription());
                
                // 공개 여부 변경 (isPublic이 null이 아니면 업데이트)
                if (request.getIsPublic() != null) {
                        todoList.setPublic(request.getIsPublic());
                        log.info("투두리스트 공개 상태 변경: id={}, isPublic={}", todoListId, request.getIsPublic());
                }

                log.info("투두리스트 수정 완료: id={}, userId={}", todoListId, userId);
                return TodoListDto.DetailResponse.from(todoList, userId, userMissionRepository);
        }

        /**
         * 투두리스트 삭제 (진행 중(ACTIVE)만 허용, Hard Delete)
         * - DB에서 행을 실제 삭제함. setActive(false) 등 소프트 딜리트 사용하지 않음.
         * - 진행 중 탭에서만 삭제 버튼이 노출되며, 이 메서드만 삭제 진입점임.
         */
        @Transactional
        public void deleteTodoList(Long todoListId, Long userId) {
                log.info("투두리스트 삭제 요청 (Hard Delete 경로): todoListId={}, userId={}", todoListId, userId);
                TodoList todoList = todoListRepository.findById(todoListId)
                                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_SET_NOT_FOUND));

                if (!todoList.isCreator(userId)) {
                        throw new CustomException(ErrorCode.ACCESS_DENIED);
                }

                if (todoList.getTodolistStatus() != TodoListStatus.ACTIVE) {
                        throw new CustomException(ErrorCode.INVALID_REQUEST, "진행 중인 투두리스트만 삭제할 수 있습니다.");
                }

                // 미션을 한 번이라도 수행했으면 삭제 불가 (완전히 새로 만들고 잘못 만들었을 때만 삭제 가능)
                List<UserMission> todoListUserMissions = userMissionRepository.findByTodoList_Id(todoList.getId());
                boolean anyPerformed = todoListUserMissions.stream()
                                .anyMatch(um -> um.getStatus() != UserMissionStatus.ASSIGNED);
                if (anyPerformed) {
                        throw new CustomException(ErrorCode.INVALID_REQUEST,
                                        "미션을 수행한 투두리스트는 삭제할 수 없습니다. 새로 만들고 아직 미션을 하지 않았을 때만 삭제할 수 있습니다.");
                }

                userMissionRepository.deleteByTodoList_Id(todoList.getId());
                todoListRepository.delete(todoList);
                log.info("투두리스트 Hard Delete 완료 (DB에서 삭제됨, 해당 UserMission도 삭제): todoListId={}, userId={}", todoListId, userId);
        }

        /**
         * 투두리스트에 미션 추가
         */
        @Transactional
        public TodoListDto.DetailResponse addMissionToTodoList(Long todoListId, Long userId, TodoListDto.AddMissionRequest request) {
                TodoList todoList = todoListRepository.findTodoListByIdWithMissions(todoListId)
                                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_SET_NOT_FOUND));

                // 본인만 추가 가능
                if (!todoList.isCreator(userId)) {
                        throw new CustomException(ErrorCode.ACCESS_DENIED);
                }

                Mission mission = missionRepository.findById(request.getMissionId())
                                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_NOT_FOUND));

                // 이미 존재하는 미션인지 확인
                if (todoListMissionRepository.existsByTodoListAndMission(todoList, mission)) {
                        throw new CustomException(ErrorCode.INVALID_REQUEST, "이미 추가된 미션입니다.");
                }

                // 최대 순서 조회
                Integer maxOrder = todoListMissionRepository.findMaxDisplayOrderByTodoList(todoList);

                TodoListMission msm = TodoListMission.todoMissionBuilder()
                                .todoList(todoList)
                                .mission(mission)
                                .displayOrder(maxOrder + 1)
                                .missionSource(MissionSource.CUSTOM_SELECTED)
                                .build();

                todoList.addMission(msm);
                todoListMissionRepository.save(msm);

                log.info("투두리스트에 미션 추가: todoListId={}, missionId={}", todoListId, request.getMissionId());
                return TodoListDto.DetailResponse.from(todoList, userId, userMissionRepository);
        }

        /**
         * 투두리스트에서 미션 제거
         */
        @Transactional
        public TodoListDto.DetailResponse removeMissionFromTodoList(Long todoListId, Long missionId, Long userId) {
                TodoList todoList = todoListRepository.findTodoListByIdWithMissions(todoListId)
                                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_SET_NOT_FOUND));

                // 본인만 제거 가능
                if (!todoList.isCreator(userId)) {
                        throw new CustomException(ErrorCode.ACCESS_DENIED);
                }

                Mission mission = missionRepository.findById(missionId)
                                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_NOT_FOUND));

                TodoListMission msm = todoListMissionRepository.findByTodoListAndMission(todoList, mission)
                                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_NOT_IN_SET));

                todoList.removeMission(msm);
                todoListMissionRepository.delete(msm);

                log.info("투두리스트에서 미션 제거: todoListId={}, missionId={}", todoListId, missionId);
                return TodoListDto.DetailResponse.from(todoList, userId, userMissionRepository);
        }

        /**
         * 투두리스트 미션 순서 변경
         */
        @Transactional
        public TodoListDto.DetailResponse reorderMissions(Long todoListId, Long userId, TodoListDto.ReorderMissionsRequest request) {
                TodoList todoList = todoListRepository.findTodoListByIdWithMissions(todoListId)
                                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_SET_NOT_FOUND));

                // 본인만 순서 변경 가능
                if (!todoList.isCreator(userId)) {
                        throw new CustomException(ErrorCode.ACCESS_DENIED);
                }

                for (TodoListDto.ReorderMissionsRequest.MissionOrderItem item : request.getMissions()) {
                        todoList.getMissions().stream()
                                        .filter(msm -> msm.getMission().getId().equals(item.getMissionId()))
                                        .findFirst()
                                        .ifPresent(msm -> msm.updateDisplayOrder(item.getDisplayOrder()));
                }

                log.info("투두리스트 미션 순서 변경: todoListId={}", todoListId);
                return TodoListDto.DetailResponse.from(todoList, userId, userMissionRepository);
        }

        /**
         * 투두리스트 미션 시간대 설정
         */
        @Transactional
        public TodoListDto.DetailResponse updateMissionSchedule(Long todoListId, Long missionId, Long userId,
                        TodoListDto.UpdateMissionScheduleRequest request) {
                TodoList todoList = todoListRepository.findTodoListByIdWithMissions(todoListId)
                                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_SET_NOT_FOUND));

                // 본인만 시간 설정 가능
                if (!todoList.isCreator(userId)) {
                        throw new CustomException(ErrorCode.ACCESS_DENIED);
                }

                // 미션 찾기
                TodoListMission targetMission = todoList.getMissions().stream()
                                .filter(msm -> msm.getMission().getId().equals(missionId))
                                .findFirst()
                                .orElseThrow(() -> new CustomException(ErrorCode.MISSION_NOT_IN_SET));

                // 시간 검증: 시작 시간이 종료 시간보다 이전이어야 함
                if (request.getStartTime() != null && request.getEndTime() != null) {
                        if (!request.getStartTime().isBefore(request.getEndTime())) {
                                throw new CustomException(ErrorCode.INVALID_REQUEST,
                                                "시작 시간은 종료 시간보다 이전이어야 합니다.");
                        }
                }

                // 시간 설정
                targetMission.updateSchedule(request.getStartTime(), request.getEndTime());

                log.info("투두리스트 미션 시간 설정: todoListId={}, missionId={}, startTime={}, endTime={}",
                                todoListId, missionId, request.getStartTime(), request.getEndTime());

                return TodoListDto.DetailResponse.from(todoList, userId, userMissionRepository);
        }
}
