package com.pachapp.pachapp_backend.repository;

import com.pachapp.pachapp_backend.entity.Household;
import com.pachapp.pachapp_backend.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface HouseholdRepository extends JpaRepository<Household, Long> {

    Optional<Household> findByUser(User user);

    Optional<Household> findByUserId(Long userId);

    boolean existsByUser(User user);
}