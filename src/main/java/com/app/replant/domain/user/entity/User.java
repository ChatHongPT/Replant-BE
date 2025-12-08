package com.app.replant.domain.user.entity;

import com.app.replant.common.BaseEntity;
import com.app.replant.domain.user.enums.Gender;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class User extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false, length = 50)
    private String nickname;

    @Column(name = "birth_date")
    private LocalDate birthDate;

    @Enumerated(EnumType.STRING)
    @Column(length = 10)
    private Gender gender;

    @Column(name = "profile_img", length = 500)
    private String profileImg;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<UserOAuth> oauthList = new ArrayList<>();

    @Builder
    private User(String email, String nickname, LocalDate birthDate, Gender gender, String profileImg) {
        this.email = email;
        this.nickname = nickname;
        this.birthDate = birthDate;
        this.gender = gender;
        this.profileImg = profileImg;
    }

    public void updateProfile(String nickname, LocalDate birthDate, Gender gender, String profileImg) {
        if (nickname != null) {
            this.nickname = nickname;
        }
        if (birthDate != null) {
            this.birthDate = birthDate;
        }
        if (gender != null) {
            this.gender = gender;
        }
        if (profileImg != null) {
            this.profileImg = profileImg;
        }
    }
}
