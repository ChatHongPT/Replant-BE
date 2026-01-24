package com.app.replant.domain.chat.service;

import com.app.replant.domain.chat.enums.ChatStatus;
import com.app.replant.domain.chat.enums.LLMProvider;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.chat.model.ChatResponse;
import org.springframework.ai.google.genai.GoogleGenAiChatModel;
import org.springframework.ai.openai.OpenAiChatModel;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * LLM 호출 서비스
 * Gemini (Primary) → Qwen (Fallback) 전략 구현
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class LLMService {

    private final GoogleGenAiChatModel geminiModel;
    private final OpenAiChatModel openAiModel;  // Qwen (vLLM) - OpenAI 호환

    /**
     * LLM 응답 결과를 담는 레코드
     */
    public record LLMResult(
            String response,
            LLMProvider provider,
            String modelName,
            ChatStatus status,
            Integer promptTokens,
            Integer responseTokens,
            Long responseTimeMs,
            String errorMessage
    ) {
        public static LLMResult success(String response, LLMProvider provider, String modelName,
                                        Integer promptTokens, Integer responseTokens, Long responseTimeMs) {
            return new LLMResult(response, provider, modelName, ChatStatus.SUCCESS,
                    promptTokens, responseTokens, responseTimeMs, null);
        }

        public static LLMResult fallback(String response, LLMProvider provider, String modelName,
                                         Integer promptTokens, Integer responseTokens, Long responseTimeMs) {
            return new LLMResult(response, provider, modelName, ChatStatus.FALLBACK,
                    promptTokens, responseTokens, responseTimeMs, null);
        }

        public static LLMResult error(String defaultResponse, String errorMessage) {
            return new LLMResult(defaultResponse, null, null, ChatStatus.ERROR,
                    null, null, null, errorMessage);
        }
    }

    /**
     * LLM 호출 (Gemini 우선, 실패 시 Qwen 폴백)
     */
    public LLMResult generate(String prompt, String defaultResponse) {
        // 1. Gemini 시도
        try {
            log.debug("Gemini 호출 시작");
            long startTime = System.currentTimeMillis();
            
            ChatClient geminiClient = ChatClient.create(geminiModel);
            String response = geminiClient.prompt()
                    .user(prompt)
                    .call()
                    .content();
            
            long responseTime = System.currentTimeMillis() - startTime;
            log.info("Gemini 응답 성공 ({}ms)", responseTime);
            
            return LLMResult.success(
                    response,
                    LLMProvider.GEMINI,
                    "gemini-2.0-flash",
                    null,  // TODO: 토큰 수 추출
                    null,
                    responseTime
            );
        } catch (Exception e) {
            log.warn("Gemini 호출 실패, Qwen으로 폴백: {}", e.getMessage());
            
            // 2. Qwen 폴백
            return callQwenFallback(prompt, defaultResponse, e.getMessage());
        }
    }

    /**
     * Qwen (vLLM) 폴백 호출
     */
    private LLMResult callQwenFallback(String prompt, String defaultResponse, String primaryError) {
        try {
            log.debug("Qwen 폴백 호출 시작");
            long startTime = System.currentTimeMillis();
            
            ChatClient qwenClient = ChatClient.create(openAiModel);
            String response = qwenClient.prompt()
                    .user(prompt)
                    .call()
                    .content();
            
            long responseTime = System.currentTimeMillis() - startTime;
            log.info("Qwen 폴백 응답 성공 ({}ms)", responseTime);
            
            return LLMResult.fallback(
                    response,
                    LLMProvider.QWEN,
                    "qwen2.5-7b",
                    null,
                    null,
                    responseTime
            );
        } catch (Exception e) {
            log.error("Qwen 폴백도 실패: {}", e.getMessage());
            
            // 모든 LLM 실패 시 기본 응답 반환
            return LLMResult.error(
                    defaultResponse,
                    "Primary: " + primaryError + " / Fallback: " + e.getMessage()
            );
        }
    }

    /**
     * Gemini만 호출 (폴백 없음)
     */
    public LLMResult generateWithGemini(String prompt) {
        try {
            long startTime = System.currentTimeMillis();
            
            ChatClient geminiClient = ChatClient.create(geminiModel);
            String response = geminiClient.prompt()
                    .user(prompt)
                    .call()
                    .content();
            
            long responseTime = System.currentTimeMillis() - startTime;
            
            return LLMResult.success(response, LLMProvider.GEMINI, "gemini-2.0-flash",
                    null, null, responseTime);
        } catch (Exception e) {
            return LLMResult.error(null, e.getMessage());
        }
    }

    /**
     * Qwen만 호출 (폴백 없음)
     */
    public LLMResult generateWithQwen(String prompt) {
        try {
            long startTime = System.currentTimeMillis();
            
            ChatClient qwenClient = ChatClient.create(openAiModel);
            String response = qwenClient.prompt()
                    .user(prompt)
                    .call()
                    .content();
            
            long responseTime = System.currentTimeMillis() - startTime;
            
            return LLMResult.success(response, LLMProvider.QWEN, "qwen2.5-7b",
                    null, null, responseTime);
        } catch (Exception e) {
            return LLMResult.error(null, e.getMessage());
        }
    }
}
