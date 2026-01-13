package com.app.replant.domain.notification.repository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Repository;

import java.time.Duration;
import java.util.Optional;

/**
 * Redis 기반 FCM 토큰 저장소
 * Key: fcm:token:{userId}
 * Value: FCM 토큰 문자열
 * TTL: 90일 (FCM 토큰 유효기간 고려)
 */
@Repository
@RequiredArgsConstructor
@Slf4j
public class RedisFcmTokenRepository {

    private static final String KEY_PREFIX = "fcm:token:";
    private static final Duration TTL = Duration.ofDays(90); // FCM 토큰 유효기간

    private final StringRedisTemplate redisTemplate;

    /**
     * FCM 토큰 저장
     * @param userId 사용자 ID
     * @param token FCM 토큰
     */
    public void save(Long userId, String token) {
        try {
            String key = getKey(userId);
            redisTemplate.opsForValue().set(key, token, TTL);
            log.info("[Redis] FCM 토큰 저장 - userId: {}, TTL: {}일", userId, TTL.toDays());
        } catch (Exception e) {
            log.error("[Redis] FCM 토큰 저장 실패 - userId: {}", userId, e);
            throw new RuntimeException("FCM 토큰 저장 실패", e);
        }
    }

    /**
     * FCM 토큰 조회
     * @param userId 사용자 ID
     * @return FCM 토큰 (없으면 Empty)
     */
    public Optional<String> findByUserId(Long userId) {
        try {
            String key = getKey(userId);
            String token = redisTemplate.opsForValue().get(key);

            if (token != null) {
                log.debug("[Redis] FCM 토큰 조회 성공 - userId: {}", userId);
                return Optional.of(token);
            } else {
                log.debug("[Redis] FCM 토큰 없음 - userId: {}", userId);
                return Optional.empty();
            }
        } catch (Exception e) {
            log.error("[Redis] FCM 토큰 조회 실패 - userId: {}", userId, e);
            return Optional.empty();
        }
    }

    /**
     * FCM 토큰 삭제
     * @param userId 사용자 ID
     */
    public void deleteByUserId(Long userId) {
        try {
            String key = getKey(userId);
            Boolean deleted = redisTemplate.delete(key);

            if (Boolean.TRUE.equals(deleted)) {
                log.info("[Redis] FCM 토큰 삭제 성공 - userId: {}", userId);
            } else {
                log.warn("[Redis] FCM 토큰 삭제 실패 (키 없음) - userId: {}", userId);
            }
        } catch (Exception e) {
            log.error("[Redis] FCM 토큰 삭제 실패 - userId: {}", userId, e);
        }
    }

    /**
     * FCM 토큰 존재 여부 확인
     * @param userId 사용자 ID
     * @return 존재 여부
     */
    public boolean existsByUserId(Long userId) {
        try {
            String key = getKey(userId);
            Boolean exists = redisTemplate.hasKey(key);
            return Boolean.TRUE.equals(exists);
        } catch (Exception e) {
            log.error("[Redis] FCM 토큰 존재 확인 실패 - userId: {}", userId, e);
            return false;
        }
    }

    /**
     * FCM 토큰 TTL 갱신
     * @param userId 사용자 ID
     */
    public void refreshTTL(Long userId) {
        try {
            String key = getKey(userId);
            redisTemplate.expire(key, TTL);
            log.debug("[Redis] FCM 토큰 TTL 갱신 - userId: {}", userId);
        } catch (Exception e) {
            log.error("[Redis] FCM 토큰 TTL 갱신 실패 - userId: {}", userId, e);
        }
    }

    /**
     * Redis 키 생성
     * @param userId 사용자 ID
     * @return Redis 키
     */
    private String getKey(Long userId) {
        return KEY_PREFIX + userId;
    }
}
