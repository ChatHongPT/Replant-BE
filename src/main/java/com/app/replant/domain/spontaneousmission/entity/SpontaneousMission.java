package com.app.replant.domain.spontaneousmission.entity;

import com.app.replant.domain.spontaneousmission.enums.SpontaneousMissionType;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "spontaneous_mission")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class SpontaneousMission {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(name = "mission_type", nullable = false, length = 20)
    private SpontaneousMissionType missionType;

    @Column(nullable = false, length = 100)
    private String title;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String description;

    @Builder
    public SpontaneousMission(SpontaneousMissionType missionType, String title, String description) {
        this.missionType = missionType;
        this.title = title;
        this.description = description;
    }
}
