package com.app.replant.controller.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * 공통 API 응답 DTO
 */
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApiResponse<T> {

    private Integer code;
    private boolean success;
    private String message;
    private T data;
    private String error;

    public static <T> ApiResponse<T> success(T data) {
        return ApiResponse.<T>builder()
                .code(200)
                .success(true)
                .data(data)
                .build();
    }

    public static <T> ApiResponse<T> success(String message, T data) {
        return ApiResponse.<T>builder()
                .code(200)
                .success(true)
                .message(message)
                .data(data)
                .build();
    }

    public static <T> ApiResponse<T> res(int code, String message) {
        return ApiResponse.<T>builder()
                .code(code)
                .success(code >= 200 && code < 300)
                .message(message)
                .build();
    }

    public static <T> ApiResponse<T> res(int code, String message, T data) {
        return ApiResponse.<T>builder()
                .code(code)
                .success(code >= 200 && code < 300)
                .message(message)
                .data(data)
                .build();
    }

    public static <T> ApiResponse<T> error(String error) {
        return ApiResponse.<T>builder()
                .code(500)
                .success(false)
                .error(error)
                .build();
    }

    public static <T> ApiResponse<T> error(int code, String error) {
        return ApiResponse.<T>builder()
                .code(code)
                .success(false)
                .error(error)
                .build();
    }

    public static <T> ApiResponse<T> error(int code, String message, String error) {
        return ApiResponse.<T>builder()
                .code(code)
                .success(false)
                .message(message)
                .error(error)
                .build();
    }

    public static <T> ApiResponse<T> error(String message, String error) {
        return ApiResponse.<T>builder()
                .code(500)
                .success(false)
                .message(message)
                .error(error)
                .build();
    }
}
