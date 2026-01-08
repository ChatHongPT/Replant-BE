-- =====================================================
-- Mission과 CustomMission 통합 - 테이블 재생성
-- Version: 7
-- Description: 기존 데이터 백업 후 통합된 mission 테이블 재생성
-- =====================================================

-- 1. 기존 데이터 백업 테이블 생성
CREATE TABLE IF NOT EXISTS `_backup_mission` AS SELECT * FROM `mission`;
CREATE TABLE IF NOT EXISTS `_backup_custom_mission` AS SELECT * FROM `custom_mission`;
CREATE TABLE IF NOT EXISTS `_backup_mission_age_ranges` AS SELECT * FROM `mission_age_ranges`;

-- 2. 기존 외래키 의존 테이블 업데이트 (user_mission의 custom_mission_id를 mission_id로 통합)
-- user_mission 백업
CREATE TABLE IF NOT EXISTS `_backup_user_mission` AS SELECT * FROM `user_mission`;

-- 3. 기존 테이블 삭제 (외래키 순서 고려)
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `mission_age_ranges`;
DROP TABLE IF EXISTS `custom_mission`;
DROP TABLE IF EXISTS `mission`;
SET FOREIGN_KEY_CHECKS = 1;

-- 4. 통합된 mission 테이블 생성
CREATE TABLE `mission` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `mission_source` VARCHAR(20) NOT NULL COMMENT 'OFFICIAL, CUSTOM',
    `creator_id` BIGINT NULL COMMENT '커스텀 미션 생성자 (CUSTOM인 경우만)',
    `title` VARCHAR(100) NOT NULL,
    `description` TEXT NOT NULL,
    `type` VARCHAR(20) NOT NULL COMMENT 'DAILY, WEEKLY, MONTHLY',
    `verification_type` VARCHAR(20) NOT NULL COMMENT 'TIMER, GPS, COMMUNITY',
    `gps_latitude` DECIMAL(10, 8) NULL,
    `gps_longitude` DECIMAL(11, 8) NULL,
    `gps_radius_meters` INT DEFAULT 100,
    `required_minutes` INT NULL,
    `exp_reward` INT NOT NULL DEFAULT 10,
    `badge_duration_days` INT NOT NULL DEFAULT 3,
    `is_active` BOOLEAN NOT NULL DEFAULT TRUE,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- 공식 미션용 사용자 맞춤 필드들
    `worry_type` VARCHAR(20) NULL,
    `gender_type` VARCHAR(10) NULL DEFAULT 'ALL',
    `region_type` VARCHAR(30) NULL DEFAULT 'ALL',
    `place_type` VARCHAR(10) NULL DEFAULT 'HOME',
    `difficulty_level` VARCHAR(10) NULL DEFAULT 'LEVEL1',

    -- 커스텀 미션용 필드들
    `duration_days` INT NULL,
    `is_public` BOOLEAN NULL DEFAULT FALSE,

    INDEX `idx_mission_source` (`mission_source`),
    INDEX `idx_mission_creator` (`creator_id`),
    INDEX `idx_mission_is_active` (`is_active`),
    INDEX `idx_mission_worry_type` (`worry_type`),

    CONSTRAINT `fk_mission_creator` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='미션 (공식 + 커스텀 통합)';

-- 5. mission_age_ranges 테이블 재생성
CREATE TABLE `mission_age_ranges` (
    `mission_id` BIGINT NOT NULL,
    `age_range` VARCHAR(20) NOT NULL,

    INDEX `idx_mission_age_ranges_mission` (`mission_id`),
    CONSTRAINT `fk_mission_age_ranges_mission` FOREIGN KEY (`mission_id`) REFERENCES `mission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 6. 백업된 데이터 복원 (공식 미션)
INSERT INTO `mission` (
    `id`, `mission_source`, `title`, `description`, `type`, `verification_type`,
    `gps_latitude`, `gps_longitude`, `gps_radius_meters`, `required_minutes`,
    `exp_reward`, `badge_duration_days`, `is_active`, `created_at`,
    `worry_type`, `gender_type`, `region_type`, `place_type`, `difficulty_level`
)
SELECT
    `id`, 'OFFICIAL', `title`, `description`, `type`, `verification_type`,
    `gps_latitude`, `gps_longitude`, `gps_radius_meters`, `required_minutes`,
    `exp_reward`, `badge_duration_days`, `is_active`, `created_at`,
    `worry_type`, `gender_type`, `region_type`, `place_type`, `difficulty_level`
FROM `_backup_mission`;

-- 7. 백업된 연령대 데이터 복원
INSERT INTO `mission_age_ranges` (`mission_id`, `age_range`)
SELECT `mission_id`, `age_range` FROM `_backup_mission_age_ranges`;

-- 8. 커스텀 미션 데이터 복원 (새 ID로 삽입)
-- 먼저 커스텀 미션 최대 ID + 기존 미션 최대 ID 이후부터 시작하도록 설정
INSERT INTO `mission` (
    `mission_source`, `creator_id`, `title`, `description`, `type`, `verification_type`,
    `gps_latitude`, `gps_longitude`, `gps_radius_meters`, `required_minutes`,
    `exp_reward`, `badge_duration_days`, `is_active`, `created_at`,
    `worry_type`, `difficulty_level`, `duration_days`, `is_public`
)
SELECT
    'CUSTOM', `creator_id`, `title`, `description`,
    COALESCE(`mission_type`, 'DAILY'), `verification_type`,
    `gps_latitude`, `gps_longitude`, `gps_radius_meters`, `required_minutes`,
    `exp_reward`, `badge_duration_days`, `is_active`, `created_at`,
    `worry_type`, `difficulty_level`, `duration_days`, `is_public`
FROM `_backup_custom_mission`;

-- 9. user_mission 테이블의 custom_mission_id를 mission_id로 통합
-- 임시 매핑 테이블 생성 (custom_mission old_id -> mission new_id)
CREATE TEMPORARY TABLE `_temp_custom_mission_mapping` AS
SELECT
    cm.id AS old_custom_id,
    m.id AS new_mission_id
FROM `_backup_custom_mission` cm
JOIN `mission` m ON m.mission_source = 'CUSTOM'
    AND m.creator_id = cm.creator_id
    AND m.title = cm.title
    AND m.created_at = cm.created_at;

-- user_mission의 custom_mission_id가 있는 경우 mission_id로 업데이트
UPDATE `user_mission` um
JOIN `_temp_custom_mission_mapping` map ON um.custom_mission_id = map.old_custom_id
SET um.mission_id = map.new_mission_id
WHERE um.custom_mission_id IS NOT NULL;

-- custom_mission_id 컬럼 제거는 별도 마이그레이션에서 처리

-- 10. post 테이블의 custom_mission_id도 통합
UPDATE `post` p
JOIN `_temp_custom_mission_mapping` map ON p.custom_mission_id = map.old_custom_id
SET p.mission_id = map.new_mission_id
WHERE p.custom_mission_id IS NOT NULL;

-- 11. 임시 테이블 삭제
DROP TEMPORARY TABLE IF EXISTS `_temp_custom_mission_mapping`;

-- 12. 백업 테이블 유지 (나중에 수동 삭제)
-- 필요 시: DROP TABLE IF EXISTS _backup_mission, _backup_custom_mission, _backup_mission_age_ranges, _backup_user_mission;
