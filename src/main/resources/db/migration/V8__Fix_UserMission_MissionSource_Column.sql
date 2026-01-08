-- =====================================================
-- user_mission.mission_source 컬럼 크기 수정
-- Version: 8
-- Description: Data truncated 오류 수정을 위한 컬럼 크기 확장
-- =====================================================

-- mission_source 컬럼이 너무 작은 경우 확장
ALTER TABLE `user_mission` MODIFY COLUMN `mission_source` VARCHAR(20) NULL;

-- 기존 NULL 값을 OFFICIAL로 업데이트 (기본값)
UPDATE `user_mission`
SET `mission_source` = 'OFFICIAL'
WHERE `mission_source` IS NULL AND `mission_id` IS NOT NULL;
