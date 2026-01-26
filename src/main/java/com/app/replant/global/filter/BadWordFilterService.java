package com.app.replant.global.filter;

import jakarta.annotation.PostConstruct;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Pattern;

/**
 * 비속어 필터링 서비스
 * badwords.txt 파일에서 단어 목록을 읽어옴
 */
@Slf4j
@Service
public class BadWordFilterService {

    private static final String BAD_WORDS_FILE = "badwords.txt";
    private static final Pattern WHITESPACE_PATTERN = Pattern.compile("\\s+");
    
    private Set<String> badWords;

    @PostConstruct
    public void init() {
        badWords = new HashSet<>();
        loadBadWords();
        log.info("BadWordFilterService 초기화 완료 - 등록된 단어 수: {}", badWords.size());
    }

    private void loadBadWords() {
        try {
            ClassPathResource resource = new ClassPathResource(BAD_WORDS_FILE);
            try (BufferedReader reader = new BufferedReader(
                    new InputStreamReader(resource.getInputStream(), StandardCharsets.UTF_8))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    line = line.trim();
                    // 빈 줄이나 주석(#) 무시
                    if (!line.isEmpty() && !line.startsWith("#")) {
                        badWords.add(line.toLowerCase());
                    }
                }
            }
        } catch (Exception e) {
            log.warn("badwords.txt 파일을 읽을 수 없습니다: {}", e.getMessage());
        }
    }

    /**
     * 비속어 포함 여부 확인
     */
    public boolean containsBadWord(String text) {
        if (text == null || text.isEmpty()) {
            return false;
        }
        String lowerText = text.toLowerCase();
        for (String badWord : badWords) {
            if (lowerText.contains(badWord)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 비속어 포함 여부 확인 (띄어쓰기 무시)
     */
    public boolean containsBadWordIgnoreBlank(String text) {
        if (text == null || text.isEmpty()) {
            return false;
        }
        String noSpaceText = WHITESPACE_PATTERN.matcher(text).replaceAll("");
        return containsBadWord(noSpaceText) || containsBadWord(text);
    }

    /**
     * 비속어를 *로 마스킹
     */
    public String filter(String text) {
        if (text == null || text.isEmpty()) {
            return text;
        }
        String result = text;
        for (String badWord : badWords) {
            String mask = "*".repeat(badWord.length());
            result = result.replaceAll("(?i)" + Pattern.quote(badWord), mask);
        }
        return result;
    }

    /**
     * 등록된 비속어 개수
     */
    public int getBadWordCount() {
        return badWords.size();
    }
}
