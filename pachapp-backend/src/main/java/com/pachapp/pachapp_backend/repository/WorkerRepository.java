package com.pachapp.pachapp_backend.repository;

import com.pachapp.pachapp_backend.entity.User;
import com.pachapp.pachapp_backend.entity.Worker;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface WorkerRepository extends JpaRepository<Worker, Long> {

    Optional<Worker> findByUser(User user);

    Optional<Worker> findByUserId(Long userId);

    boolean existsByUser(User user);

    Optional<Worker> findByWorkerId(String workerId);
}