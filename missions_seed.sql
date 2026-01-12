-- Replant Mission 데이터 삽입 SQL
-- 생성일: 2026-01-11
-- 미션 수: 358

-- 기존 미션 데이터 삭제
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE mission_age_ranges;
TRUNCATE TABLE mission;
SET FOREIGN_KEY_CHECKS = 1;

-- Mission 테이블 INSERT

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 직무 분야 30분 리서치하고 공유하기', '관심있는 새로운 직무에 대해 조사한 내용을 커뮤니티에 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '두바이 쫀득쿠키 먹고 후기 공유하기', '요즘 유행하는 두바이 쫀득쿠키를 먹고 솔직한 후기 작성', 'DAILY_LIFE', 'COMMUNITY',
    10, 3, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'OUTDOOR', 'LEVEL1',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '내가 최근 배운 것 설명하기', '최근 일주일간 배운 것 중 가장 인상깊은 것을 다른 사람이 이해할 수 있게 설명', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '요즘 핫한 전시회 방문하고 인증하기', 'SNS에서 화제인 전시회를 방문하고 인증샷 공유', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '나만의 아침 루틴 공유하기', '내가 실천중인 아침 루틴을 상세하게 공유', 'HEALTH', 'COMMUNITY',
    10, 3, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '요즘 듣는 팟캐스트 추천하기', '최근 재밌게 듣는 팟캐스트와 이유를 공유', 'GROWTH', 'COMMUNITY',
    10, 3, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '우리 동네 숨은 맛집 공유하기', '동네에서 발견한 숨은 맛집 정보를 사진과 함께 공유', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'OUTDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '요즘 하는 사이드 프로젝트 소개하기', '진행중인 사이드 프로젝트나 취미 활동 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '이직 준비 체크리스트 공유하기', '이직을 위해 준비하고 있는 것들을 리스트로 정리해서 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '인플루언서 따라 챌린지 해보고 인증하기', 'SNS에서 유행하는 챌린지를 따라하고 인증', 'DAILY_LIFE', 'COMMUNITY',
    10, 3, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주말에 만든 요리 레시피 공유하기', '직접 만든 요리의 레시피와 팁을 사진과 함께 공유', 'DAILY_LIFE', 'COMMUNITY',
    20, 3, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '최근 본 영화 리뷰 작성하기', '최근 본 영화에 대한 솔직한 리뷰와 별점 공유', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '내가 사용하는 생산성 앱 추천하기', '업무나 공부에 도움되는 앱과 사용법 공유', 'GROWTH', 'COMMUNITY',
    10, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '이번달 독서 목록 공유하기', '이번달 읽을 책 리스트와 선정 이유 공유', 'STUDY', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업계 최신 트렌드 뉴스 공유하기', '내 관심 업계의 최신 뉴스를 요약해서 공유', 'GROWTH', 'COMMUNITY',
    20, 3, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '스터디 카페 투어하고 후기 남기기', '새로운 스터디 카페를 방문하고 분위기와 가격 후기 공유', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '요즘 배우는 온라인 강의 추천하기', '현재 수강중인 온라인 강의 리뷰와 추천 이유 공유', 'STUDY', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '점심시간 산책 루트 공유하기', '내가 자주 가는 점심 산책 코스를 사진과 함께 소개', 'HEALTH', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'OUTDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '나만의 스트레스 해소법 공유하기', '효과적인 나만의 스트레스 해소 방법 공유', 'HEALTH', 'COMMUNITY',
    10, 3, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '북카페 방문해서 독서하기', '북카페에서 책 읽는 시간 갖고 인증', 'STUDY', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '내 커리어 목표 공유하기', '1년 후 커리어 목표를 구체적으로 작성해서 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 회고 작성하고 공유하기', '이번 주 잘한 점과 개선할 점을 정리해서 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 취미 시작하고 공유하기', '이번주 새롭게 시작한 취미 활동 소개', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '요즘 관심있는 자격증 조사하기', '취득하고 싶은 자격증 정보를 조사해서 공유', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '오늘의 생산성 팁 공유하기', '오늘 실천한 생산성 향상 방법 공유', 'GROWTH', 'COMMUNITY',
    10, 3, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '동네 러닝 코스 개척하고 공유하기', '새로운 러닝 코스를 개척하고 경로 공유', 'EXERCISE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'OUTDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '최근 읽은 자기계발서 요약하기', '인상깊었던 자기계발서의 핵심 내용 요약 공유', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업무 자동화 팁 공유하기', '내가 사용하는 업무 자동화 방법이나 도구 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 베이커리 탐방하기', '요즘 핫한 베이커리를 방문하고 시그니처 메뉴 후기 공유', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '월간 목표 달성률 공유하기', '이번달 목표 달성 정도를 솔직하게 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '나만의 공부 환경 세팅 공유하기', '집중력 높이는 나만의 공부 환경 설정법 공유', 'STUDY', 'COMMUNITY',
    10, 7, 1, NOW(),
    'ENTRANCE_EXAM', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '팀 프로젝트 경험 공유하기', '최근 진행한 팀 프로젝트에서 배운 점 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '요즘 하는 운동 루틴 공유하기', '꾸준히 하고있는 운동 루틴과 효과 공유', 'EXERCISE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '브런치 맛집 탐방하기', '주말 브런치 맛집 방문하고 메뉴 추천', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '내가 참고하는 유튜브 채널 추천', '분야별로 도움되는 유튜브 채널 추천', 'GROWTH', 'COMMUNITY',
    10, 3, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '이력서 작성 팁 공유하기', '이력서 작성시 유용한 팁과 경험 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '요즘 빠진 음악 플레이리스트 공유', '최근 자주 듣는 음악 플레이리스트와 추천곡 공유', 'DAILY_LIFE', 'COMMUNITY',
    10, 3, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 카페 개척하고 리뷰하기', '처음 가보는 카페 방문해서 분위기와 메뉴 리뷰', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '포트폴리오 작업 진행상황 공유', '포트폴리오 제작 과정과 팁 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '오늘 배운 영어표현 공유하기', '새롭게 배운 영어 표현과 예문 공유', 'STUDY', 'COMMUNITY',
    10, 3, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업계 선배 인터뷰 내용 요약 공유', '유익했던 커리어 인터뷰 영상이나 글 요약 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '힐링되는 장소 추천하기', '스트레스 해소에 좋았던 장소 추천', 'HEALTH', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로 오픈한 팝업스토어 방문하기', '화제의 팝업스토어 방문하고 후기 공유', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '독서 모임 참여 경험 공유하기', '독서 모임 참여 후기와 읽은 책 소개', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업무 효율 높이는 단축키 공유', '자주 쓰는 유용한 단축키와 활용법 공유', 'GROWTH', 'COMMUNITY',
    10, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '오늘 실천한 자기계발 공유하기', '오늘 한 자기계발 활동 인증', 'GROWTH', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주말 나들이 코스 추천하기', '주말에 다녀온 나들이 코스 소개', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'OUTDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '네트워킹 이벤트 참석하고 공유', '업계 네트워킹 행사 참석 후기 공유', 'RELATIONSHIP', 'COMMUNITY',
    20, 7, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 루틴 도전하고 공유하기', '새벽 시간 활용법과 효과 공유', 'HEALTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '취미로 만든 작품 공유하기', '취미 활동으로 만든 결과물 사진 공유', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '요즘 즐기는 보드게임 추천', '최근 재밌게 한 보드게임 소개', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '직무 관련 아티클 요약 공유', '관심 직무 관련 유익한 아티클 요약', 'GROWTH', 'COMMUNITY',
    20, 3, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 감사일기 작성하기', '이번주 감사했던 일 3가지 공유', 'HEALTH', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 카페 음료 시도하기', '처음 먹어보는 카페 메뉴 도전하고 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 3, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '나만의 집중력 향상법 공유', '효과적인 집중력 관리 방법 공유', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '코워킹 스페이스 체험하기', '새로운 코워킹 스페이스 방문 후기', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '최근 들은 강연 내용 공유', '인상깊었던 강연이나 세미나 내용 요약', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '건강검진 받고 인증하기', '미루지 말고 건강검진 받기', 'HEALTH', 'COMMUNITY',
    20, 30, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 30, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '디저트 맛집 탐방하기', '화제의 디저트 카페 방문하고 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '이번주 배운 것 정리하기', '일주일간 배운 내용 정리해서 공유', 'STUDY', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '멘토링 경험 공유하기', '멘토링을 받거나 한 경험과 배운점 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 러닝 앱 사용 후기', '러닝 앱을 사용한 경험과 기록 공유', 'EXERCISE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업무 도구 활용 팁 공유', 'Notion Slack 등 업무 도구 활용법', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주말 전시회 관람하기', '전시회 방문하고 인상깊은 작품 소개', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '하루 물 2L 마시기 챌린지', '하루 물 섭취량 기록하고 인증', 'HEALTH', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 언어 학습 진행상황 공유', '배우고있는 외국어 학습 현황 공유', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업계 최신 기술 트렌드 공유', '관심 분야의 기술 트렌드 조사 및 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '반려동물 카페 방문하기', '동물 카페에서 힐링하고 인증', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '나만의 재테크 공부법 공유', '재테크 공부 방법과 유용한 자료 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '아침 명상 실천하기', '하루를 시작하는 명상 루틴 공유', 'HEALTH', 'TIME',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '커리어 관련 책 읽고 리뷰', '커리어 개발 도서 독후감 작성', 'STUDY', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '핫플레이스 맛집 방문하기', 'SNS에서 핫한 맛집 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '월간 재정 결산 공유하기', '이번달 지출 분석과 다음달 계획', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '공모전 정보 찾아서 공유하기', '참여할만한 공모전 정보 조사 및 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '요가 클래스 참여하기', '요가 수업 참여하고 후기 공유', 'EXERCISE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'FEMALE', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 분야 공부 시작하기', '관심있는 새 분야 학습 시작 인증', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업계 뉴스레터 구독하고 요약', '구독중인 뉴스레터 핵심 내용 공유', 'GROWTH', 'COMMUNITY',
    10, 3, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주말 홈카페 만들기', '집에서 카페 분위기 내고 사진 공유', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '운동 일지 작성하기', '오늘 한 운동 기록하고 공유', 'EXERCISE', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '온라인 강의 수강 인증', '진행중인 강의 진도율 공유', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '사이드프로젝트 아이디어 공유', '진행하고 싶은 사이드 프로젝트 기획', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 취미 클래스 참여하기', '원데이 클래스나 취미 수업 참여', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '아침 독서 루틴 만들기', '아침에 책 읽는 시간 갖기', 'STUDY', 'TIME',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '면접 준비 과정 공유하기', '면접 준비 노하우와 경험담 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '힙한 복합문화공간 방문하기', '새로운 문화공간 탐방하고 소개', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 학습 목표 설정하기', '이번주 공부 목표 세우고 공유', 'STUDY', 'COMMUNITY',
    10, 3, 1, NOW(),
    'ENTRANCE_EXAM', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '나만의 시간관리 방법 공유', '효과적인 시간관리 노하우 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '퇴근 후 루틴 공유하기', '저녁 시간 활용법 공유', 'HEALTH', 'COMMUNITY',
    10, 7, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 레스토랑 시도하기', '안 가본 음식점 도전하고 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업무 스킬 향상 계획 세우기', '업무 역량 개발 계획 수립 및 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주말 독서 마라톤하기', '주말에 책 집중해서 읽기', 'STUDY', 'TIME',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '셀프 사진관 체험하기', '셀프 사진관에서 인생샷 건지기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '포모도로 기법 실천하기', '25분 집중 공부법 실천하고 인증', 'STUDY', 'TIME',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업계 팟캐스트 청취하고 요약', '커리어 관련 팟캐스트 핵심 내용 공유', 'GROWTH', 'COMMUNITY',
    10, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '플리마켓 방문하기', '주말 플리마켓 구경하고 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'OUTDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 앱 사용 후기 공유', '유용한 신규 앱 발굴하고 리뷰', 'GROWTH', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '월간 목표 점검하기', '이번달 목표 달성도 체크 및 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '커피 원데이 클래스 참여', '바리스타 클래스 참여하고 후기', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '이력서 첨삭 받고 공유', '이력서 피드백 반영 과정 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '아침 요가 하루 시작하기', '아침 요가로 하루 시작하기', 'EXERCISE', 'TIME',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 베이글 맛집 찾기', '베이글 전문점 탐방하고 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '커리어 롤모델 조사하기', '존경하는 커리어 롤모델 분석 및 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 회고 노트 작성', '일주일 돌아보며 배운점 정리', 'GROWTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '공원에서 독서하기', '야외에서 책 읽는 시간 갖기', 'STUDY', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'OUTDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 프로그래밍 언어 공부 시작', '관심 언어 학습 시작하고 공유', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업무 프로세스 개선안 공유', '업무 효율화 아이디어 제안', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '소극장 공연 관람하기', '소규모 공연이나 연극 관람', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '하루 스크린타임 줄이기', '핸드폰 사용시간 줄이기 챌린지', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '직무 인터뷰 영상 시청 후기', '커리어 인터뷰 영상 보고 인사이트 공유', 'GROWTH', 'COMMUNITY',
    10, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '핫한 디저트 만들어보기', '유행하는 디저트 직접 만들고 후기', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 스터디 그룹 참여', '관심 분야 스터디 찾아서 참여', 'STUDY', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주말 자전거 라이딩', '자전거 타고 새로운 동네 탐험', 'EXERCISE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'OUTDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '기술 블로그 글 작성하기', '배운 내용 정리해서 블로그에 포스팅', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '채용공고 10개 분석하기', '관심 회사 채용공고 분석 및 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '루프탑 카페 방문하기', '전망 좋은 루프탑 카페 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 운동 시작하기', '해보지 않은 운동 도전하고 후기', 'EXERCISE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업무 자동화 스크립트 작성', '반복 업무 자동화하는 코드 작성 및 공유', 'GROWTH', 'COMMUNITY',
    30, 15, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL3',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '한강 산책하고 인증하기', '한강공원에서 산책하며 힐링', 'HEALTH', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'OUTDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '독서 챌린지 참여하기', '한달에 책 3권 읽기', 'STUDY', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 30, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 코딩 문제 풀기', '알고리즘 문제 풀고 풀이 공유', 'STUDY', 'COMMUNITY',
    20, 3, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '취업 박람회 참여하기', '채용 박람회 다녀온 후기 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 파스타 맛집 방문', '파스타 전문점 탐방하고 추천', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 재무 계획 세우기', '이번주 지출 계획 수립 및 공유', 'GROWTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '온라인 세미나 참여하기', '관심 분야 웨비나 참석 후기', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '나만의 아침 루틴 만들기', '효과적인 아침 습관 설계하고 실천', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '힙한 브런치 카페 찾기', '인스타그래머블한 브런치 카페 방문', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업계 컨퍼런스 참석하기', 'IT 마케팅 등 업계 행사 참여', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 쿠키 맛집 발굴', '수제 쿠키 가게 탐방하고 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 학습 일지 작성', '일주일간 공부한 내용 정리', 'STUDY', 'COMMUNITY',
    20, 0, 1, NOW(),
    'ENTRANCE_EXAM', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '사이드 프로젝트 진행상황 공유', '진행중인 프로젝트 업데이트', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 운동 시작하기', '새벽 운동 루틴 만들고 인증', 'EXERCISE', 'TIME',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '복합문화공간 투어하기', '새로 생긴 복합문화공간 탐방', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '커리어 발표 자료 만들기', '자기소개서나 포트폴리오 작업', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '명상 앱 사용 후기', '명상 앱 일주일 사용 경험 공유', 'HEALTH', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 와인바 방문', '와인바 탐방하고 추천 와인 공유', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 목표 달성 체크', '이번주 목표 달성도 점검', 'GROWTH', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업무 관련 자격증 공부', '자격증 시험 준비 진행상황 공유', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '핫플 디저트 카페 방문', 'SNS에서 화제인 디저트 카페 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '나만의 생산성 시스템 구축', '개인 생산성 관리 방법 설계 및 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '아침 저널링 하기', '아침에 일기 쓰며 하루 계획하기', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 스시 맛집 발굴', '스시 오마카세 체험하고 후기', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '포트폴리오 프로젝트 시작', '개인 프로젝트 시작하고 계획 공유', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '요가 홈트레이닝 하기', '집에서 요가 연습하고 인증', 'EXERCISE', 'TIME',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 갤러리 카페 방문', '갤러리 카페 탐방하고 전시 감상', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '기술 스택 공부 계획 세우기', '학습할 기술 로드맵 작성 및 공유', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주말 등산하기', '등산하며 자연 속에서 힐링', 'EXERCISE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'OUTDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업계 동향 리서치 공유', '최신 산업 트렌드 조사 및 정리', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 밀크티 카페 방문', '밀크티 전문점 탐방하고 추천', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '개인 목표 수정 및 점검', '분기별 목표 재설정하고 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 독서 챌린지', '새벽에 일어나 책 읽기', 'STUDY', 'TIME',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '힙한 이자카야 방문', '분위기 좋은 이자카야 탐방', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '면접 스터디 참여하기', '면접 스터디 그룹 참여 경험 공유', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 운동 계획 세우기', '이번주 운동 스케줄 짜고 공유', 'EXERCISE', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 베트남 쌀국수집 방문', '쌀국수 맛집 탐방하고 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '온라인 포트폴리오 제작', '개인 웹사이트나 노션 포트폴리오 만들기', 'GROWTH', 'COMMUNITY',
    20, 30, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 30, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '명상 루틴 만들기', '매일 명상하는 습관 만들기', 'HEALTH', 'TIME',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 타코 맛집 발굴', '타코 전문점 방문하고 추천 메뉴 공유', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업계 블로그 구독하고 요약', '유명 개발 마케팅 블로그 글 요약', 'GROWTH', 'COMMUNITY',
    10, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주말 필라테스 수업', '필라테스 클래스 참여하고 후기', 'EXERCISE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'FEMALE', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 펍 방문하기', '분위기 좋은 펍 탐방하고 추천', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '자기소개서 초안 작성', '지원 직무 자기소개서 작성하고 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '아침 스트레칭 루틴', '아침 스트레칭으로 하루 시작', 'EXERCISE', 'TIME',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 버거 맛집 탐방', '수제 버거 가게 방문하고 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', 'Git 공부하고 정리하기', 'Git 사용법 학습하고 정리', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 감사 노트 작성', '일주일간 감사한 일 기록하기', 'HEALTH', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 파인다이닝 체험', '고급 레스토랑 방문하고 후기', 'DAILY_LIFE', 'COMMUNITY',
    30, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL3',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '코딩테스트 준비하기', '알고리즘 문제 풀이 공유', 'STUDY', 'COMMUNITY',
    20, 3, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주말 홈트레이닝', '집에서 운동 루틴 실천', 'EXERCISE', 'TIME',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '핫한 피자집 방문', '화제의 피자 맛집 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업무 스킬 온라인 강의', '업무 관련 강의 수강 진행상황', 'STUDY', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 조깅 시작하기', '새벽 러닝으로 하루 시작', 'EXERCISE', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'OUTDOOR', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 맥주집 탐방', '크래프트 비어 바 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', 'LinkedIn 프로필 업데이트', '링크드인 프로필 최신화하고 공유', 'GROWTH', 'COMMUNITY',
    10, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 디지털 디톡스', '일주일간 SNS 사용 줄이기', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 일식당 방문', '일식당 탐방하고 추천 메뉴 공유', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '영어 공부 진행상황 공유', '영어 학습 방법과 진도 공유', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 글쓰기 루틴', '아침에 일어나 글쓰기 연습', 'GROWTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 삼겹살집 발굴', '맛있는 삼겹살집 찾아서 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업계 뉴스 스크랩하기', '주요 업계 뉴스 정리해서 공유', 'GROWTH', 'COMMUNITY',
    10, 3, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주말 사이클링', '자전거 타며 새로운 코스 개척', 'EXERCISE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'OUTDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 중식당 방문', '중식당 탐방하고 맛집 공유', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '데이터 분석 공부하기', '데이터 분석 학습 진행상황 공유', 'STUDY', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '아침 물 마시기 챌린지', '기상 후 물 한잔 마시기', 'HEALTH', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 태국음식점 방문', '태국 요리 전문점 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', 'GitHub 프로젝트 시작', '개인 프로젝트 깃허브에 올리기', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 책 읽기', '일주일에 책 1권 읽기', 'STUDY', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 프렌치 레스토랑 방문', '프렌치 레스토랑 탐방', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업무 자동화 도구 학습', '업무 효율화 도구 익히기', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 요가 루틴', '새벽 요가로 하루 시작하기', 'EXERCISE', 'TIME',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 카레집 발굴', '카레 전문점 방문하고 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업계 리포트 읽고 요약', '산업 분석 리포트 정리해서 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주말 수영하기', '수영장 방문해서 운동', 'EXERCISE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 샌드위치 카페 방문', '샌드위치 전문점 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '클라우드 서비스 공부', 'AWS GCP 학습 진행상황 공유', 'STUDY', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '아침 일기 쓰기', '모닝 페이지 작성하며 하루 시작', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 멕시칸 레스토랑 방문', '멕시칸 음식점 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '직무 관련 세미나 참석', '온라인 세미나 참여 후기', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 플랭크 챌린지', '매일 플랭크 시간 늘리기', 'EXERCISE', 'TIME',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 돈까스 맛집 발굴', '돈까스 전문점 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', 'UI UX 공부하기', '디자인 공부 진행상황 공유', 'STUDY', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 산책 루틴', '새벽 산책으로 하루 시작', 'EXERCISE', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'OUTDOOR', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 국밥집 방문', '국밥 맛집 탐방하고 추천', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '네트워킹 이벤트 정보 공유', '유용한 네트워킹 행사 정보 공유', 'RELATIONSHIP', 'COMMUNITY',
    10, 7, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 스쿼트 챌린지', '매일 스쿼트 개수 늘리기', 'EXERCISE', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 아시안 퓨전 레스토랑', '아시안 퓨전 레스토랑 탐방', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', 'SQL 공부하고 정리', '데이터베이스 학습 내용 정리', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 명상 루틴', '새벽 명상으로 하루 준비', 'HEALTH', 'TIME',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 떡볶이 맛집 발굴', '떡볶이 맛집 방문하고 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '프로젝트 관리 도구 학습', 'Jira Asana 사용법 익히기', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 독서 기록', '일주일간 읽은 책 정리', 'STUDY', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 스테이크하우스 방문', '스테이크 레스토랑 탐방', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '마케팅 트렌드 공부', '디지털 마케팅 학습 내용 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 스트레칭 루틴', '기상 후 스트레칭하기', 'EXERCISE', 'TIME',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 치킨집 발굴', '치킨 맛집 탐방하고 메뉴 추천', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', 'UX 라이팅 공부하기', 'UX 라이팅 학습 진행상황 공유', 'STUDY', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 걷기 챌린지', '매일 만보 걷기', 'EXERCISE', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'OUTDOOR', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 족발집 방문', '족발 맛집 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '업계 유명인 팔로우하고 분석', '롤모델 SNS 분석하며 인사이트 얻기', 'GROWTH', 'COMMUNITY',
    10, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 코딩 루틴', '새벽에 코딩 공부하기', 'STUDY', 'TIME',
    20, 0, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 찜닭집 발굴', '찜닭 맛집 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '디자인 툴 학습하기', 'Figma Sketch 공부 진행상황', 'STUDY', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 물 섭취 챌린지', '하루 2L 물 마시기', 'HEALTH', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 해물찜 맛집 방문', '해물찜 전문점 탐방', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '콘텐츠 마케팅 공부', '콘텐츠 제작 학습 내용 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 영어 공부 루틴', '새벽 영어 학습 시간 갖기', 'STUDY', 'TIME',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 보쌈집 발굴', '보쌈 맛집 방문하고 추천', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', 'SEO 공부하고 정리', '검색엔진 최적화 학습 내용 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 과일 섭취 챌린지', '매일 과일 먹기', 'HEALTH', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 곱창집 방문', '곱창 맛집 탐방', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '비즈니스 모델 분석', '성공한 비즈니스 모델 연구 및 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 독서 챌린지 시작', '새벽 독서로 하루 시작', 'STUDY', 'TIME',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 순대국밥집 발굴', '순대국 맛집 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '프레젠테이션 스킬 향상', 'PT 스킬 학습하고 정리', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 채소 섭취 챌린지', '매일 샐러드 먹기', 'HEALTH', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 감자탕집 방문', '감자탕 맛집 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '데이터 시각화 공부', '데이터 시각화 툴 학습 공유', 'STUDY', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 운동 루틴 만들기', '새벽 운동으로 하루 시작', 'EXERCISE', 'TIME',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 소곱창집 발굴', '소곱창 맛집 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '아침 신문 읽기 습관', '아침마다 경제 뉴스 읽기', 'GROWTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 칼국수집 방문', '칼국수 맛집 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '프로덕트 매니지먼트 공부', 'PM 역할 학습하고 정리', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 카페인 줄이기', '커피 섭취량 줄이기', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 냉면집 발굴', '냉면 맛집 방문하고 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '브랜딩 전략 공부', '브랜드 마케팅 학습 내용 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 글쓰기 습관', '매일 새벽 자유 글쓰기', 'GROWTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 순두부찌개집 방문', '순두부 맛집 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '앱 개발 공부 시작', '모바일 앱 개발 학습 공유', 'STUDY', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 설탕 줄이기 챌린지', '단 음식 섭취 줄이기', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 김치찌개집 발굴', '김치찌개 맛집 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '크리에이티브 라이팅 연습', '창의적 글쓰기 연습하고 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 플래닝 루틴', '새벽에 하루 계획 세우기', 'GROWTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 부대찌개집 방문', '부대찌개 맛집 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '성장 마케팅 공부', '그로스 해킹 학습 내용 정리', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 간식 조절 챌린지', '건강한 간식으로 대체하기', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 육개장집 발굴', '육개장 맛집 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '비즈니스 영어 공부', '비즈니스 영어 학습 진행상황', 'STUDY', 'COMMUNITY',
    20, 15, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 감사 일기 쓰기', '아침마다 감사한 일 기록', 'HEALTH', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 된장찌개집 방문', '된장찌개 맛집 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', 'UX 리서치 방법론 공부', '사용자 조사 방법 학습하고 공유', 'STUDY', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 배달음식 줄이기', '직접 요리해서 먹기', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 설렁탕집 발굴', '설렁탕 맛집 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '데이터 사이언스 공부', '데이터 분석 기법 학습 공유', 'STUDY', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 목표 점검 루틴', '아침마다 목표 확인하기', 'GROWTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 갈비탕집 방문', '갈비탕 맛집 탐방', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '서비스 기획 공부', '서비스 기획 프로세스 학습', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 야식 끊기 챌린지', '밤늦은 음식 섭취 자제하기', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 해장국집 발굴', '해장국 맛집 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '컨텐츠 기획 공부', '콘텐츠 전략 수립 학습하고 공유', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 비전보드 만들기', '아침에 목표 시각화 작업', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 곰탕집 방문', '곰탕 맛집 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '블록체인 기초 공부', '블록체인 기술 학습 내용 공유', 'STUDY', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 탄산음료 끊기', '물로 대체하기', 'HEALTH', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 추어탕집 발굴', '추어탕 맛집 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '인플루언서 마케팅 공부', '인플루언서 협업 전략 학습', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 긍정 확언 루틴', '아침마다 긍정 문구 읽기', 'HEALTH', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 닭한마리 맛집 방문', '닭한마리 전문점 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', 'AI ML 기초 공부', '인공지능 기초 학습하고 정리', 'STUDY', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 가공식품 줄이기', '신선한 재료로 요리하기', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 막국수집 발굴', '막국수 맛집 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '커뮤니티 매니지먼트 공부', '커뮤니티 운영 전략 학습', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 호흡 운동 루틴', '아침 호흡법 연습하기', 'HEALTH', 'TIME',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 수제비집 방문', '수제비 맛집 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '스타트업 생태계 공부', '스타트업 트렌드 분석하고 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 나트륨 줄이기 챌린지', '저염식 실천하기', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 빈대떡집 발굴', '빈대떡 맛집 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '린 스타트업 방법론 공부', '린 스타트업 원칙 학습하고 정리', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 체온 재기 루틴', '기상 후 건강 체크하기', 'HEALTH', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 콩나물국밥집 방문', '콩나물국밥 맛집 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '애자일 방법론 공부', '스크럼 칸반 학습 내용 공유', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 인스턴트 식품 줄이기', '집밥 먹기 챌린지', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 해물탕집 발굴', '해물탕 맛집 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', 'OKR 작성법 공부', '목표 설정 방법론 학습', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 스킨케어 루틴', '아침 피부 관리하기', 'HEALTH', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 낙지볶음집 방문', '낙지볶음 맛집 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '디자인 씽킹 공부', '디자인 사고 프로세스 학습', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 첨가물 줄이기', '유기농 식품 선택하기', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 아구찜집 발굴', '아구찜 맛집 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '고객 중심 사고 공부', '고객 경험 디자인 학습', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 비타민 섭취 루틴', '아침 영양제 챙겨먹기', 'HEALTH', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 대구탕집 방문', '대구탕 맛집 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '리더십 스킬 공부', '팀 리더십 역량 학습하고 공유', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 가당 음료 끊기', '무가당 음료 마시기', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 매운탕집 발굴', '매운탕 맛집 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '퍼실리테이션 스킬 공부', '회의 진행 기법 학습', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 체중 기록 루틴', '아침 체중 측정하고 기록', 'HEALTH', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 물회집 방문', '물회 맛집 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '협상 스킬 공부', '협상 전략 학습하고 정리', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 패스트푸드 줄이기', '건강한 대안 선택하기', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 황태해장국집 발굴', '황태해장국 맛집 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '타임 매니지먼트 공부', '시간관리 기법 학습', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 햇빛 쬐기 루틴', '아침 햇빛 쬐며 비타민D 합성', 'HEALTH', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'OUTDOOR', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 낙지탕집 방문', '낙지탕 맛집 탐방', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '문제해결 능력 향상 공부', '문제 해결 프레임워크 학습', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 튀김 음식 줄이기', '구이나 찜으로 대체하기', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 전복죽집 발굴', '전복죽 맛집 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '비판적 사고 공부', '논리적 사고력 향상 학습', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 스트레칭과 물 마시기', '기상 후 몸 풀고 수분 섭취', 'HEALTH', 'COMMUNITY',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 해물칼국수집 방문', '해물칼국수 맛집 탐방', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '창의적 문제해결 공부', '크리에이티브 씽킹 기법 학습', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 과식 조절 챌린지', '적당량 식사하기', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 손두부집 발굴', '손두부 맛집 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '감성 지능 향상 공부', '감정 지능 개발 방법 학습', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'RE_EMPLOYMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 심호흡과 기지개', '아침 깨어나기 루틴 만들기', 'HEALTH', 'TIME',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 꼬막무침집 방문', '꼬막 전문점 탐방', 'DAILY_LIFE', 'COMMUNITY',
    20, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '스토리텔링 스킬 공부', '효과적인 스토리텔링 기법 학습', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 음주 조절 챌린지', '주중 금주 실천하기', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 홍어삼합집 발굴', '홍어삼합 맛집 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    30, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL3',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '커뮤니케이션 스킬 향상', '효과적 소통 방법 학습', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'JOB_PREPARATION', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새벽 감사 명상 루틴', '아침 감사하는 마음 갖기', 'HEALTH', 'TIME',
    10, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 복어탕집 방문', '복어요리 전문점 탐방', 'DAILY_LIFE', 'COMMUNITY',
    30, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL3',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '회복탄력성 향상 공부', '멘탈 강화 방법 학습하고 공유', 'GROWTH', 'COMMUNITY',
    20, 15, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '주간 야채 위주 식단', '채식 위주 식사 실천', 'HEALTH', 'COMMUNITY',
    20, 0, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    1, 7, NULL, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '새로운 돌솥밥집 발굴', '돌솥밥 맛집 방문 후기', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'SELF_MANAGEMENT', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '진로 상담 받고 공유하기', '진로 상담 경험과 인사이트 공유', 'GROWTH', 'COMMUNITY',
    20, 7, 1, NOW(),
    'ADVANCEMENT', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '복학 선배와 커피챗하기', '복학 선배 만나서 조언 듣고 공유', 'RELATIONSHIP', 'COMMUNITY',
    20, 7, 1, NOW(),
    'RETURN_TO_SCHOOL', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '학과 학생회 활동 참여하기', '학생회 활동 경험 공유', 'RELATIONSHIP', 'COMMUNITY',
    20, 15, 1, NOW(),
    'RETURN_TO_SCHOOL', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '대학 도서관에서 공부하기', '학교 도서관 분위기 다시 적응하기', 'STUDY', 'COMMUNITY',
    10, 7, 1, NOW(),
    'RETURN_TO_SCHOOL', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '교수님께 메일 보내기', '교수님께 복학 인사 메일 작성 경험 공유', 'RELATIONSHIP', 'COMMUNITY',
    20, 7, 1, NOW(),
    'RETURN_TO_SCHOOL', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '학과 동아리 탐색하기', '관심 동아리 조사하고 정보 공유', 'RELATIONSHIP', 'COMMUNITY',
    10, 7, 1, NOW(),
    'RETURN_TO_SCHOOL', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '선후배 밥약 잡기', '선후배와 식사하며 근황 나누기', 'RELATIONSHIP', 'COMMUNITY',
    20, 7, 1, NOW(),
    'RETURN_TO_SCHOOL', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '학교 주변 스터디 카페 찾기', '학교 근처 공부하기 좋은 카페 탐방', 'STUDY', 'COMMUNITY',
    10, 7, 1, NOW(),
    'RETURN_TO_SCHOOL', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '전공 관련 유튜브 정주행', '전공 기초 다지기 위한 영상 추천', 'STUDY', 'COMMUNITY',
    10, 7, 1, NOW(),
    'RETURN_TO_SCHOOL', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '학점 계획 세우고 공유하기', '이번 학기 학점 목표 설정 및 공유', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'RETURN_TO_SCHOOL', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '전공 서적 구입하기', '필요한 전공책 구매하고 리뷰', 'STUDY', 'COMMUNITY',
    10, 7, 1, NOW(),
    'RETURN_TO_SCHOOL', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '학교 축제 참여하기', '대학 축제 다녀온 후기 공유', 'DAILY_LIFE', 'COMMUNITY',
    10, 7, 1, NOW(),
    'RETURN_TO_SCHOOL', 'ALL', 'ALL', 'OUTDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '학과 MT 참여 계획 세우기', 'MT 준비 과정 공유', 'RELATIONSHIP', 'COMMUNITY',
    10, 7, 1, NOW(),
    'RETURN_TO_SCHOOL', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '전공 스터디 그룹 만들기', '스터디 그룹 모집 및 운영 경험', 'STUDY', 'COMMUNITY',
    20, 15, 1, NOW(),
    'RETURN_TO_SCHOOL', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 15, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '학교 동아리방 방문하기', '동아리방 분위기 파악하고 공유', 'RELATIONSHIP', 'COMMUNITY',
    10, 7, 1, NOW(),
    'RETURN_TO_SCHOOL', 'ALL', 'ALL', 'INDOOR', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '입시 모의고사 후기 작성', '최근 본 모의고사 분석 및 공유', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'ENTRANCE_EXAM', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '수능 D-100 인증하기', '수능 카운트다운과 각오 공유', 'STUDY', 'COMMUNITY',
    10, 3, 1, NOW(),
    'ENTRANCE_EXAM', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '자습실 공부 루틴 공유', '효과적인 자습실 활용법 공유', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'ENTRANCE_EXAM', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '과목별 공부 시간 분석', '과목별 투자 시간 분석하고 공유', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'ENTRANCE_EXAM', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '학원 수업 복습 노트 정리', '학원 내용 정리하는 방법 공유', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'ENTRANCE_EXAM', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '오답노트 작성법 공유', '나만의 오답노트 정리 노하우', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'ENTRANCE_EXAM', 'ALL', 'ALL', 'HOME', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '입시 설명회 참석하기', '대학 입시 설명회 참석 후기', 'STUDY', 'COMMUNITY',
    20, 7, 1, NOW(),
    'ENTRANCE_EXAM', 'ALL', 'ALL', 'INDOOR', 'LEVEL2',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '수험생 식단 공유하기', '집중력 높이는 식단 공유', 'HEALTH', 'COMMUNITY',
    10, 7, 1, NOW(),
    'ENTRANCE_EXAM', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '수능 응원 메시지 받기', '친구들의 응원 메시지 모음', 'RELATIONSHIP', 'COMMUNITY',
    10, 3, 1, NOW(),
    'ENTRANCE_EXAM', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 3, NULL, 0
);

INSERT INTO mission (
    mission_type, title, description, category, verification_type,
    exp_reward, badge_duration_days, is_active, created_at,
    worry_type, gender_type, region_type, place_type, difficulty_level,
    is_challenge, challenge_days, deadline_days, is_public, is_promoted
) VALUES (
    'OFFICIAL', '학습 플래너 꾸미기', '공부 계획 세우는 플래너 소개', 'STUDY', 'COMMUNITY',
    10, 7, 1, NOW(),
    'ENTRANCE_EXAM', 'ALL', 'ALL', 'HOME', 'LEVEL1',
    0, NULL, 7, NULL, 0
);


-- Mission Age Ranges 테이블 INSERT

INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (1, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (2, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (3, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (4, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (5, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (6, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (7, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (8, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (9, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (10, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (11, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (12, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (13, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (14, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (15, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (16, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (17, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (18, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (19, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (20, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (21, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (22, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (23, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (24, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (25, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (26, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (27, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (28, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (29, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (30, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (31, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (32, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (33, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (34, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (35, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (36, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (37, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (38, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (39, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (40, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (41, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (42, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (43, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (44, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (45, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (46, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (47, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (48, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (49, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (50, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (51, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (52, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (53, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (54, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (55, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (56, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (57, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (58, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (59, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (60, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (61, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (62, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (63, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (64, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (65, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (66, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (67, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (68, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (69, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (70, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (71, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (72, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (73, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (74, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (75, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (76, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (77, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (78, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (79, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (80, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (81, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (82, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (83, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (84, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (85, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (86, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (87, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (88, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (89, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (90, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (91, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (92, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (93, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (94, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (95, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (96, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (97, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (98, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (99, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (100, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (101, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (102, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (103, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (104, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (105, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (106, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (107, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (108, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (109, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (110, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (111, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (112, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (113, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (114, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (115, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (116, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (117, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (118, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (119, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (120, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (121, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (122, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (123, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (124, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (125, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (126, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (127, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (128, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (129, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (130, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (131, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (132, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (133, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (134, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (135, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (136, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (137, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (138, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (139, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (140, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (141, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (142, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (143, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (144, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (145, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (146, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (147, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (148, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (149, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (150, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (151, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (152, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (153, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (154, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (155, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (156, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (157, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (158, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (159, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (160, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (161, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (162, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (163, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (164, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (165, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (166, 'EARLY_THIRTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (167, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (168, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (169, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (170, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (171, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (172, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (173, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (174, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (175, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (176, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (177, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (178, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (179, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (180, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (181, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (182, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (183, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (184, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (185, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (186, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (187, 'EARLY_THIRTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (188, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (189, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (190, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (191, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (192, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (193, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (194, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (195, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (196, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (197, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (198, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (199, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (200, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (201, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (202, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (203, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (204, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (205, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (206, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (207, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (208, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (209, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (210, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (211, 'EARLY_THIRTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (212, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (213, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (214, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (215, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (216, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (217, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (218, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (219, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (220, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (221, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (222, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (223, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (224, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (225, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (226, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (227, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (228, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (229, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (230, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (231, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (232, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (233, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (234, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (235, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (236, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (237, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (238, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (239, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (240, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (241, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (242, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (243, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (244, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (245, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (246, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (247, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (248, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (249, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (250, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (251, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (252, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (253, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (254, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (255, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (256, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (257, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (258, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (259, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (260, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (261, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (262, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (263, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (264, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (265, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (266, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (267, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (268, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (269, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (270, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (271, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (272, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (273, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (274, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (275, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (276, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (277, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (278, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (279, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (280, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (281, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (282, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (283, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (284, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (285, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (286, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (287, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (288, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (289, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (290, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (291, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (292, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (293, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (294, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (295, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (296, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (297, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (298, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (299, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (300, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (301, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (302, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (303, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (304, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (305, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (306, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (307, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (308, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (309, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (310, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (311, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (312, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (313, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (314, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (315, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (316, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (317, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (318, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (319, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (320, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (321, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (322, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (323, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (324, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (325, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (326, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (327, 'LATE_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (328, 'MID_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (329, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (330, 'EARLY_THIRTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (331, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (332, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (333, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (334, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (335, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (336, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (337, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (338, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (339, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (340, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (341, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (342, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (343, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (344, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (345, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (346, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (347, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (348, 'EARLY_TWENTIES');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (349, 'LATE_TEENS');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (350, 'LATE_TEENS');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (351, 'LATE_TEENS');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (352, 'LATE_TEENS');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (353, 'LATE_TEENS');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (354, 'LATE_TEENS');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (355, 'LATE_TEENS');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (356, 'LATE_TEENS');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (357, 'LATE_TEENS');
INSERT INTO mission_age_ranges (mission_id, age_range) VALUES (358, 'LATE_TEENS');

-- 완료