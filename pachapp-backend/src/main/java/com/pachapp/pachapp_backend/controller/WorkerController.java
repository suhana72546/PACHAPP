package com.pachapp.pachapp_backend.controller;

import com.pachapp.pachapp_backend.dto.WorkerRequest;
import com.pachapp.pachapp_backend.dto.WorkerResponse;
import com.pachapp.pachapp_backend.entity.User;
import com.pachapp.pachapp_backend.service.WorkerService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/workers")
public class WorkerController {

    private final WorkerService workerService;

    public WorkerController(WorkerService workerService) {
        this.workerService = workerService;
    }

    @PostMapping
    public ResponseEntity<WorkerResponse> createWorker(
            @RequestBody WorkerRequest request,
            Authentication authentication) {

        User user = (User) authentication.getPrincipal();

        WorkerResponse response =
                workerService.createWorker(user, request);

        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(response);
    }

    @GetMapping("/me")
    public ResponseEntity<WorkerResponse> getMyWorkerProfile(
            Authentication authentication) {

        User user = (User) authentication.getPrincipal();

        WorkerResponse response =
                workerService.getWorker(user);

        return ResponseEntity.ok(response);
    }
}