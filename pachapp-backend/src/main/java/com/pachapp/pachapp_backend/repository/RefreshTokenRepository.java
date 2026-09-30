package com.pachapp.pachapp_backend.repository;

import com.pachapp.pachapp_backend.entity.RefreshToken;
import com.pachapp.pachapp_backend.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RefreshTokenRepository extends JpaRepository<RefreshToken, Long> {

    Optional<RefreshToken> findByToken(String token);

    void deleteByToken(String token);

    void deleteAllByUser(User user);
}