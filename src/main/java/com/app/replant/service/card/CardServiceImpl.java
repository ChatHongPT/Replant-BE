package com.app.replant.service.card;

import com.app.replant.controller.dto.CardResponseDto;
import com.app.replant.entity.Card;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 카드 서비스 구현
 */
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class CardServiceImpl implements CardService {

    @Override
    public List<CardResponseDto> getAllCards() {
        // TODO: 실제 구현 필요
        return new ArrayList<>();
    }

    @Override
    public Card getCardById(Long cardId) {
        // TODO: 실제 구현 필요
        throw new IllegalArgumentException("Card not found");
    }

    @Override
    public List<CardResponseDto> getUserCards(Long memberId) {
        // TODO: 실제 구현 필요
        return new ArrayList<>();
    }

    @Override
    public List<CardResponseDto> getRecommendedCards(Long memberId) {
        // TODO: 실제 구현 필요
        return new ArrayList<>();
    }
}
