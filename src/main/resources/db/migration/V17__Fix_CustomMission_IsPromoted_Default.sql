-- V17: Fix custom_mission is_promoted column default value
-- 커스텀 미션 생성 시 is_promoted 기본값 오류 수정

ALTER TABLE custom_mission MODIFY COLUMN is_promoted BOOLEAN NOT NULL DEFAULT FALSE;
