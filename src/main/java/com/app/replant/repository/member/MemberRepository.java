package com.app.replant.repository.member;

import com.app.replant.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Long>, MemberQueryDsl {

    Optional<Member> findByMemberId(String memberId);

    boolean existsByMemberId(String memberEmail);

    Optional<Member> findByMemberNameAndPhone(String name, String phone);
}
