-- =====================================================
-- Post와 VerificationPost 통합 - 테이블 재생성
-- Version: 6
-- Description: 기존 데이터 백업 후 통합된 post 테이블 재생성
-- =====================================================

-- 1. 기존 데이터 백업 테이블 생성
CREATE TABLE IF NOT EXISTS `_backup_verification_post` AS SELECT * FROM `verification_post`;
CREATE TABLE IF NOT EXISTS `_backup_post` AS SELECT * FROM `post`;
CREATE TABLE IF NOT EXISTS `_backup_comment` AS SELECT * FROM `comment`;
CREATE TABLE IF NOT EXISTS `_backup_verification_vote` AS SELECT * FROM `verification_vote`;

-- 2. 기존 관련 테이블 삭제 (외래키 순서 고려)
DROP TABLE IF EXISTS verification_vote;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS verification_post;
DROP TABLE IF EXISTS post;

-- 3. 통합된 post 테이블 생성
CREATE TABLE `post` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `post_type` VARCHAR(20) NOT NULL DEFAULT 'GENERAL' COMMENT 'GENERAL, VERIFICATION',
    `user_id` BIGINT NOT NULL,
    `mission_id` BIGINT NULL,
    `custom_mission_id` BIGINT NULL,
    `user_mission_id` BIGINT NULL COMMENT '인증글용: 사용자 미션 ID',
    `title` VARCHAR(100) NULL COMMENT '커뮤니티용: 제목',
    `content` TEXT NOT NULL,
    `image_urls` JSON NULL,
    `has_valid_badge` BOOLEAN DEFAULT FALSE COMMENT '커뮤니티용: 인증 뱃지 보유',
    `del_flag` BOOLEAN NOT NULL DEFAULT FALSE,
    `status` VARCHAR(20) NULL COMMENT '인증글용: PENDING, APPROVED, REJECTED',
    `approve_count` INT DEFAULT 0 COMMENT '인증글용: 승인 수',
    `reject_count` INT DEFAULT 0 COMMENT '인증글용: 거절 수',
    `verified_at` TIMESTAMP NULL COMMENT '인증글용: 인증 완료 시간',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX `idx_post_type` (`post_type`),
    INDEX `idx_post_user_id` (`user_id`),
    INDEX `idx_post_status` (`status`),
    INDEX `idx_post_mission_id` (`mission_id`),
    INDEX `idx_post_user_mission_id` (`user_mission_id`),

    CONSTRAINT `fk_post_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_post_mission` FOREIGN KEY (`mission_id`) REFERENCES `mission` (`id`) ON DELETE SET NULL,
    CONSTRAINT `fk_post_custom_mission` FOREIGN KEY (`custom_mission_id`) REFERENCES `custom_mission` (`id`) ON DELETE SET NULL,
    CONSTRAINT `fk_post_user_mission` FOREIGN KEY (`user_mission_id`) REFERENCES `user_mission` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시글 (커뮤니티 + 인증글 통합)';

-- 4. comment 테이블 재생성 (post에만 연결)
CREATE TABLE `comment` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `post_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `parent_id` BIGINT NULL COMMENT '부모 댓글 ID (대댓글인 경우)',
    `content` TEXT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX `idx_comment_post_id` (`post_id`),
    INDEX `idx_comment_user_id` (`user_id`),
    INDEX `idx_comment_parent_id` (`parent_id`),

    CONSTRAINT `fk_comment_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_comment_parent` FOREIGN KEY (`parent_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='댓글';

-- 5. verification_vote 테이블 재생성 (post_id 사용)
CREATE TABLE `verification_vote` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `post_id` BIGINT NOT NULL COMMENT '인증 게시글 ID',
    `user_id` BIGINT NOT NULL,
    `vote_type` VARCHAR(20) NOT NULL COMMENT 'APPROVE, REJECT',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    UNIQUE KEY `uk_verification_vote` (`post_id`, `user_id`),
    INDEX `idx_verification_vote_post` (`post_id`),
    INDEX `idx_verification_vote_user` (`user_id`),

    CONSTRAINT `fk_verification_vote_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_verification_vote_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='인증 투표';

-- 6. 백업된 데이터 복원 (일반 게시글)
INSERT INTO `post` (
    `post_type`, `user_id`, `mission_id`, `custom_mission_id`, `title`, `content`,
    `image_urls`, `has_valid_badge`, `del_flag`, `created_at`, `updated_at`
)
SELECT
    'GENERAL', `user_id`, `mission_id`, `custom_mission_id`, `title`, `content`,
    `image_urls`, `has_valid_badge`, `del_flag`, `created_at`, `updated_at`
FROM `_backup_post`;

-- 7. 백업된 데이터 복원 (인증 게시글)
INSERT INTO `post` (
    `post_type`, `user_id`, `mission_id`, `custom_mission_id`, `user_mission_id`,
    `content`, `image_urls`, `status`, `approve_count`, `reject_count`,
    `verified_at`, `created_at`, `updated_at`
)
SELECT
    'VERIFICATION', vp.`user_id`, um.`mission_id`, um.`custom_mission_id`, vp.`user_mission_id`,
    vp.`content`, vp.`image_urls`, vp.`status`, vp.`approve_count`, vp.`reject_count`,
    vp.`verified_at`, vp.`created_at`, vp.`updated_at`
FROM `_backup_verification_post` vp
JOIN `user_mission` um ON vp.`user_mission_id` = um.`id`;

-- 8. 백업 테이블 유지 (나중에 수동 삭제)
-- 필요 시: DROP TABLE IF EXISTS _backup_verification_post, _backup_post, _backup_comment, _backup_verification_vote;
