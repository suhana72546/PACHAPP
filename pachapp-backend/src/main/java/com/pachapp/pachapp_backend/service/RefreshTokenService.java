package com.pachapp.pachapp_backend.service;

import com.pachapp.pachapp_backend.entity.RefreshToken;
import com.pachapp.pachapp_backend.entity.User;
import com.pachapp.pachapp_backend.repository.RefreshTokenRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.UUID;

@Service
public class RefreshTokenService {

    private final RefreshTokenRepository refreshTokenRepository;

    // Refresh token remains valid for 30 days
    private static final long REFRESH_TOKEN_DAYS = 30;

    public RefreshTokenService(RefreshTokenRepository refreshTokenRepository) {
        this.refreshTokenRepository = refreshTokenRepository;
    }

    public RefreshToken createRefreshToken(User user) {

        String token = UUID.randomUUID().toString();

        Instant createdAt = Instant.now();

        Instant expiresAt = createdAt.plus(
                REFRESH_TOKEN_DAYS,
                ChronoUnit.DAYS
        );

        RefreshToken refreshToken = new RefreshToken(
                token,
                user,
                expiresAt,
                createdAt
        );

        return refreshTokenRepository.save(refreshToken);
    }

    public RefreshToken verifyExpiration(RefreshToken refreshToken) {

        if (refreshToken.getExpiresAt().isBefore(Instant.now())) {

            refreshTokenRepository.delete(refreshToken);

            throw new RuntimeException("Refresh token has expired");
        }

        return refreshToken;
    }

    public RefreshToken findByToken(String token) {

        return refreshTokenRepository.findByToken(token)
                .orElseThrow(() ->
                        new RuntimeException("Refresh token not found")
                );
    }

    @Transactional
    public void deleteByToken(String token) {

        refreshTokenRepository.deleteByToken(token);
    }

    @Transactional
    public RefreshToken rotateRefreshToken(RefreshToken oldToken) {

        User user = oldToken.getUser();

        refreshTokenRepository.delete(oldToken);

        return createRefreshToken(user);
    }
}