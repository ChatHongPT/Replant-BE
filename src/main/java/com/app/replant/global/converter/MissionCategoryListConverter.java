package com.app.replant.global.converter;

import com.app.replant.domain.mission.enums.MissionCategory;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * DB TEXT 컬럼과 List&lt;MissionCategory&gt; 간 변환 (쉼표 구분 문자열)
 * 예: "DAILY_LIFE,EXERCISE,STUDY" &harr; [DAILY_LIFE, EXERCISE, STUDY]
 */
@Converter
public class MissionCategoryListConverter implements AttributeConverter<List<MissionCategory>, String> {

    @Override
    public String convertToDatabaseColumn(List<MissionCategory> attribute) {
        if (attribute == null || attribute.isEmpty()) {
            return null;
        }
        return attribute.stream()
                .map(Enum::name)
                .collect(Collectors.joining(","));
    }

    @Override
    public List<MissionCategory> convertToEntityAttribute(String dbData) {
        if (dbData == null || dbData.isBlank()) {
            return null;
        }
        return Arrays.stream(dbData.split(","))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .map(MissionCategory::valueOf)
                .collect(Collectors.toList());
    }
}
