package com.pachapp.pachapp_backend.controller;

import com.pachapp.pachapp_backend.dto.HouseholdRequest;
import com.pachapp.pachapp_backend.dto.HouseholdResponse;
import com.pachapp.pachapp_backend.entity.User;
import com.pachapp.pachapp_backend.service.HouseholdService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/households")
public class HouseholdController {

    private final HouseholdService householdService;

    public HouseholdController(HouseholdService householdService) {
        this.householdService = householdService;
    }

    @PostMapping
    public ResponseEntity<HouseholdResponse> createHousehold(
            @RequestBody HouseholdRequest request,
            Authentication authentication) {

        User user = (User) authentication.getPrincipal();

        HouseholdResponse response =
                householdService.createHousehold(user, request);

        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(response);
    }

    @GetMapping("/me")
    public ResponseEntity<HouseholdResponse> getMyHousehold(
            Authentication authentication) {

        User user = (User) authentication.getPrincipal();

        HouseholdResponse response =
                householdService.getHousehold(user);

        return ResponseEntity.ok(response);
    }
}