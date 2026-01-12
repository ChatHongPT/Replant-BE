package com.app.replant.domain.user.repository;

import com.app.replant.domain.user.entity.UserOauth;
import com.app.replant.domain.user.enums.OAuthProvider;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserOauthRepository extends JpaRepository<UserOauth, Long> {

    Optional<UserOauth> findByProviderAndProviderId(OAuthProvider provider, String providerId);

    /**
     * OAuth 정보와 User 정보를 함께 조회 (N+1 문제 방지)
     * 기존 사용자 로그인 시 User 정보가 필요하므로 JOIN FETCH 사용
     */
    @Query("SELECT uo FROM UserOauth uo JOIN FETCH uo.user WHERE uo.provider = :provider AND uo.providerId = :providerId")
    Optional<UserOauth> findByProviderAndProviderIdWithUser(@Param("provider") OAuthProvider provider, @Param("providerId") String providerId);

    Optional<UserOauth> findByUserIdAndProvider(Long userId, OAuthProvider provider);

    boolean existsByProviderAndProviderId(OAuthProvider provider, String providerId);
}
