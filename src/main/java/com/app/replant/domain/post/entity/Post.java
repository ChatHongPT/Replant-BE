package com.app.replant.domain.post.entity;

import com.app.replant.common.BaseEntity;
import com.app.replant.domain.custommission.entity.CustomMission;
import com.app.replant.domain.mission.entity.Mission;
import com.app.replant.domain.mission.enums.MissionSource;
import com.app.replant.domain.post.enums.PostType;
import com.app.replant.domain.user.entity.User;
import com.app.replant.domain.usermission.entity.UserMission;
import com.app.replant.domain.verification.enums.VerificationStatus;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "post", indexes = {
    @Index(name = "idx_post_type", columnList = "post_type"),
    @Index(name = "idx_post_user_id", columnList = "user_id"),
    @Index(name = "idx_post_status", columnList = "status")
})
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Post extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(name = "post_type", nullable = false, length = 20)
    private PostType postType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mission_id")
    private Mission mission;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "custom_mission_id")
    private CustomMission customMission;

    // 미션 출처 구분 (SYSTEM / CUSTOM)
    @Enumerated(EnumType.STRING)
    @Column(name = "mission_source")
    private MissionSource missionSource;

    // 커뮤니티 게시글 전용 필드
    @Column(length = 100)
    private String title;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String content;

    @Column(name = "image_urls", columnDefinition = "json")
    private String imageUrls;

    @Column(name = "has_valid_badge")
    private Boolean hasValidBadge;

    @Column(name = "del_flag", nullable = false)
    private Boolean delFlag = false;

    // 인증글 전용 필드
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_mission_id", unique = true)
    private UserMission userMission;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", length = 20)
    private VerificationStatus status;

    @Column(name = "approve_count")
    private Integer approveCount;

    @Column(name = "reject_count")
    private Integer rejectCount;

    @Column(name = "verified_at")
    private LocalDateTime verifiedAt;

    // 댓글 관계
    @OneToMany(mappedBy = "post", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Comment> comments = new ArrayList<>();

    // 일반 게시글 생성용 빌더
    @Builder(builderMethodName = "generalBuilder")
    public Post(User user, Mission mission, CustomMission customMission, String title, String content, String imageUrls, Boolean hasValidBadge) {
        this.postType = PostType.GENERAL;
        this.user = user;
        this.mission = mission;
        this.customMission = customMission;
        this.title = title;
        this.content = content;
        this.imageUrls = imageUrls;
        this.hasValidBadge = hasValidBadge != null ? hasValidBadge : false;
        this.delFlag = false;
    }

    // 인증글 생성용 빌더
    @Builder(builderMethodName = "verificationBuilder")
    public static Post createVerificationPost(User user, UserMission userMission, String content, String imageUrls, VerificationStatus status) {
        Post post = new Post();
        post.postType = PostType.VERIFICATION;
        post.user = user;
        post.userMission = userMission;
        post.content = content;
        post.imageUrls = imageUrls;
        post.status = status != null ? status : VerificationStatus.PENDING;
        post.approveCount = 0;
        post.rejectCount = 0;
        post.delFlag = false;
        post.hasValidBadge = false;

        // UserMission에서 미션 정보 가져오기
        if (userMission != null) {
            post.mission = userMission.getMission();
            post.customMission = userMission.getCustomMission();
        }

        return post;
    }

    // 커뮤니티 게시글 업데이트
    public void update(String title, String content, String imageUrls) {
        if (title != null) {
            this.title = title;
        }
        if (content != null) {
            this.content = content;
        }
        if (imageUrls != null) {
            this.imageUrls = imageUrls;
        }
    }

    // 인증글 콘텐츠 업데이트
    public void updateVerificationContent(String content, String imageUrls) {
        if (this.postType != PostType.VERIFICATION) {
            throw new IllegalStateException("인증글만 이 메서드로 수정할 수 있습니다.");
        }
        if (this.status != VerificationStatus.PENDING) {
            throw new IllegalStateException("인증 완료 후에는 수정할 수 없습니다.");
        }
        this.content = content;
        this.imageUrls = imageUrls;
    }

    public boolean isAuthor(Long userId) {
        return this.user.getId().equals(userId);
    }

    public void softDelete() {
        this.delFlag = true;
    }

    public void restore() {
        this.delFlag = false;
    }

    public boolean isDeleted() {
        return this.delFlag != null && this.delFlag;
    }

    // 인증 관련 메서드
    private static final int REQUIRED_APPROVE_COUNT = 1;
    private static final int REQUIRED_REJECT_COUNT = 3;

    public void addVote(boolean isApprove) {
        if (this.postType != PostType.VERIFICATION) {
            throw new IllegalStateException("인증글만 투표할 수 있습니다.");
        }

        if (isApprove) {
            this.approveCount++;
            if (this.approveCount >= REQUIRED_APPROVE_COUNT) {
                this.status = VerificationStatus.APPROVED;
                this.verifiedAt = LocalDateTime.now();
            }
        } else {
            this.rejectCount++;
            if (this.rejectCount >= REQUIRED_REJECT_COUNT) {
                this.status = VerificationStatus.REJECTED;
            }
        }
    }

    // 인증글 여부 확인
    public boolean isVerificationPost() {
        return this.postType == PostType.VERIFICATION;
    }

    // 일반 게시글 여부 확인
    public boolean isGeneralPost() {
        return this.postType == PostType.GENERAL;
    }

    // 미션 타입 반환 (인증글용) - 문자열 버전 (기존 API 호환)
    public String getMissionType() {
        MissionSource source = getMissionSource();
        return source != null ? source.name() : null;
    }

    // 미션 출처 반환 (Enum 버전)
    public MissionSource getMissionSource() {
        // 명시적으로 설정된 경우
        if (this.missionSource != null) {
            return this.missionSource;
        }
        // 기존 코드 호환: 필드 기반 추론
        if (this.mission != null) {
            return MissionSource.OFFICIAL;
        } else if (this.customMission != null) {
            return MissionSource.CUSTOM;
        }
        return null;
    }

    // 미션 제목 반환
    public String getMissionTitle() {
        if (this.mission != null) {
            return this.mission.getTitle();
        } else if (this.customMission != null) {
            return this.customMission.getTitle();
        }
        return null;
    }

    // 공식 미션 여부
    public boolean isOfficialMission() {
        return getMissionSource() == MissionSource.OFFICIAL;
    }

    // 커스텀 미션 여부
    public boolean isCustomMission() {
        return getMissionSource() == MissionSource.CUSTOM;
    }
}
