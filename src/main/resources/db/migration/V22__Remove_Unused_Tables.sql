-- V22: 미사용 테이블 및 컬럼 삭제
-- 삭제된 엔티티: Card, MemberCard, Goal, Member, Chat, CustomMission (Mission으로 통합), QnA

-- 1. QnA 관련 테이블 삭제
DROP TABLE IF EXISTS mission_qna_answer;
DROP TABLE IF EXISTS mission_qna;

-- 2. Chat 관련 테이블 삭제
DROP TABLE IF EXISTS chat_message;
DROP TABLE IF EXISTS chat_room;

-- 3. Card 관련 테이블 삭제
DROP TABLE IF EXISTS member_card;
DROP TABLE IF EXISTS card;

-- 4. Goal 테이블 삭제
DROP TABLE IF EXISTS goal;

-- 5. Member 테이블 삭제 (User 테이블로 통합됨)
DROP TABLE IF EXISTS member;

-- 6. custom_mission 테이블 삭제 전 외래키 제약조건 제거
-- 프로시저를 사용하여 외래키가 존재하는 경우에만 삭제

DELIMITER //

-- post 테이블에서 custom_mission 외래키 제거
DROP PROCEDURE IF EXISTS drop_fk_post_custom_mission//
CREATE PROCEDURE drop_fk_post_custom_mission()
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.TABLE_CONSTRAINTS 
        WHERE CONSTRAINT_SCHEMA = DATABASE() 
        AND TABLE_NAME = 'post' 
        AND CONSTRAINT_NAME = 'FKmrirodmqdhwon255kdalqta8a'
    ) THEN
        ALTER TABLE post DROP FOREIGN KEY FKmrirodmqdhwon255kdalqta8a;
    END IF;
    IF EXISTS (
        SELECT 1 FROM information_schema.COLUMNS 
        WHERE TABLE_SCHEMA = DATABASE() 
        AND TABLE_NAME = 'post' 
        AND COLUMN_NAME = 'custom_mission_id'
    ) THEN
        ALTER TABLE post DROP COLUMN custom_mission_id;
    END IF;
END//
CALL drop_fk_post_custom_mission()//
DROP PROCEDURE IF EXISTS drop_fk_post_custom_mission//

-- user_mission 테이블에서 custom_mission 외래키 제거
DROP PROCEDURE IF EXISTS drop_fk_user_mission_custom_mission//
CREATE PROCEDURE drop_fk_user_mission_custom_mission()
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.TABLE_CONSTRAINTS 
        WHERE CONSTRAINT_SCHEMA = DATABASE() 
        AND TABLE_NAME = 'user_mission' 
        AND CONSTRAINT_NAME = 'FK8snk47negmlfgnt5ekgfr3exw'
    ) THEN
        ALTER TABLE user_mission DROP FOREIGN KEY FK8snk47negmlfgnt5ekgfr3exw;
    END IF;
    IF EXISTS (
        SELECT 1 FROM information_schema.COLUMNS 
        WHERE TABLE_SCHEMA = DATABASE() 
        AND TABLE_NAME = 'user_mission' 
        AND COLUMN_NAME = 'custom_mission_id'
    ) THEN
        ALTER TABLE user_mission DROP COLUMN custom_mission_id;
    END IF;
END//
CALL drop_fk_user_mission_custom_mission()//
DROP PROCEDURE IF EXISTS drop_fk_user_mission_custom_mission//

-- user_badge 테이블에서 custom_mission 외래키 제거
DROP PROCEDURE IF EXISTS drop_fk_user_badge_custom_mission//
CREATE PROCEDURE drop_fk_user_badge_custom_mission()
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.TABLE_CONSTRAINTS 
        WHERE CONSTRAINT_SCHEMA = DATABASE() 
        AND TABLE_NAME = 'user_badge' 
        AND CONSTRAINT_NAME = 'FKer7bwtc0ecc4mln50vld8p7u3'
    ) THEN
        ALTER TABLE user_badge DROP FOREIGN KEY FKer7bwtc0ecc4mln50vld8p7u3;
    END IF;
    IF EXISTS (
        SELECT 1 FROM information_schema.COLUMNS 
        WHERE TABLE_SCHEMA = DATABASE() 
        AND TABLE_NAME = 'user_badge' 
        AND COLUMN_NAME = 'custom_mission_id'
    ) THEN
        ALTER TABLE user_badge DROP COLUMN custom_mission_id;
    END IF;
END//
CALL drop_fk_user_badge_custom_mission()//
DROP PROCEDURE IF EXISTS drop_fk_user_badge_custom_mission//

-- user_recommendation 테이블에서 custom_mission 외래키 제거
DROP PROCEDURE IF EXISTS drop_fk_user_recommendation_custom_mission//
CREATE PROCEDURE drop_fk_user_recommendation_custom_mission()
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.COLUMNS 
        WHERE TABLE_SCHEMA = DATABASE() 
        AND TABLE_NAME = 'user_recommendation' 
        AND COLUMN_NAME = 'custom_mission_id'
    ) THEN
        ALTER TABLE user_recommendation DROP COLUMN custom_mission_id;
    END IF;
END//
CALL drop_fk_user_recommendation_custom_mission()//
DROP PROCEDURE IF EXISTS drop_fk_user_recommendation_custom_mission//

DELIMITER ;

-- 7. CustomMission 테이블 삭제 (이제 외래키가 모두 제거되었으므로 안전하게 삭제 가능)
DROP TABLE IF EXISTS custom_mission;

-- 8. mission_age_ranges 테이블은 유지 (Mission 엔티티에서 사용 중)
