package com.app.replant.domain.missionset.entity;

import com.app.replant.domain.user.entity.User;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 투두리스트 좋아요 엔티티
 * 사용자당 투두리스트당 1건만 존재 (유니크 제약)
 */
@Entity
@Table(name = "todolist_like", uniqueConstraints = {
        @UniqueConstraint(name = "uk_todolist_like_todolist_user", columnNames = { "todolist_id", "user_id" })
}, indexes = {
        @Index(name = "idx_todolist_like_todolist", columnList = "todolist_id"),
        @Index(name = "idx_todolist_like_user", columnList = "user_id")
})
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TodoListLike {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "todolist_id", nullable = false)
    private TodoList todoList;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @Builder
    private TodoListLike(TodoList todoList, User user) {
        this.todoList = todoList;
        this.user = user;
        this.createdAt = LocalDateTime.now();
    }
}
