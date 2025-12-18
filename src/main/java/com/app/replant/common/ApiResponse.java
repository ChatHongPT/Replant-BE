package com.app.replant.common;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ApiResponse<T> {
    private final boolean success;
    private final T data;
    private final String message;
    private final Integer statusCode;

    public ApiResponse(boolean success, T data, String message) {
        this.success = success;
        this.data = data;
        this.message = message;
        this.statusCode = null;
    }

    public static <T> ApiResponse<T> success(T data) {
        return new ApiResponse<>(true, data, null);
    }

    public static <T> ApiResponse<T> success(T data, String message) {
        return new ApiResponse<>(true, data, message);
    }

    public static <T> ApiResponse<T> error(String message) {
        return new ApiResponse<>(false, null, message);
    }

    public static <T> ApiResponse<T> res(int statusCode, String message) {
        return new ApiResponse<>(statusCode >= 200 && statusCode < 300, null, message, statusCode);
    }

    public static <T> ApiResponse<T> res(int statusCode, String message, T data) {
        return new ApiResponse<>(statusCode >= 200 && statusCode < 300, data, message, statusCode);
    }
}
