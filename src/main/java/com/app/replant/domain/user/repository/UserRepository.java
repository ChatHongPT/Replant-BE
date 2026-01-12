package com.app.replant.domain.user.repository;

import com.app.replant.domain.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByEmail(String email);

    boolean existsByEmail(String email);

    Optional<User> findByNicknameAndPhone(String nickname, String phone);

    boolean existsByNickname(String nickname);

    /**
     * 모든 활성 사용자 조회 (알림 발송용)
     */
    @Query("SELECT u FROM User u WHERE u.status = 'ACTIVE'")
    List<User> findAllActiveUsers();
}
