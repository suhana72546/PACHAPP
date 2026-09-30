package com.pachapp.pachapp_backend.controller;

import com.pachapp.pachapp_backend.dto.AuthResponse;
import com.pachapp.pachapp_backend.dto.RegisterRequest;
import com.pachapp.pachapp_backend.entity.User;
import com.pachapp.pachapp_backend.service.AuthService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.pachapp.pachapp_backend.dto.LoginRequest;
import com.pachapp.pachapp_backend.security.JwtService;
import org.springframework.security.core.Authentication;
import com.pachapp.pachapp_backend.service.RefreshTokenService;
import com.pachapp.pachapp_backend.dto.TokenResponse;
import com.pachapp.pachapp_backend.entity.RefreshToken;
import com.pachapp.pachapp_backend.service.RefreshTokenService;
import com.pachapp.pachapp_backend.dto.RefreshTokenRequest;
import com.pachapp.pachapp_backend.dto.LogoutRequest;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthService authService;
    private final JwtService jwtService;
    private final RefreshTokenService refreshTokenService;

    public AuthController(
            AuthService authService,
            JwtService jwtService,
            RefreshTokenService refreshTokenService) {

        this.authService = authService;
        this.jwtService = jwtService;
        this.refreshTokenService = refreshTokenService;
    }

    @PostMapping("/register")
    public ResponseEntity<AuthResponse> register(
            @RequestBody RegisterRequest request) {

        User user = authService.register(request);

        AuthResponse response = new AuthResponse(
                "Registration successful",
                user.getId(),
                user.getName(),
                user.getEmail(),
                user.getRole(),
                null
        );

        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(response);
    }

    @PostMapping("/login")
    public ResponseEntity<TokenResponse> login(
            @RequestBody LoginRequest request) {

        User user = authService.login(request);

        String accessToken = jwtService.generateToken(user);

        RefreshToken refreshToken =
                refreshTokenService.createRefreshToken(user);

        TokenResponse response = new TokenResponse(
                accessToken,
                refreshToken.getToken()
        );

        return ResponseEntity.ok(response);
    }

    @PostMapping("/refresh")
    public ResponseEntity<TokenResponse> refreshToken(
            @RequestBody RefreshTokenRequest request) {

        // Find the old refresh token
        RefreshToken oldToken =
                refreshTokenService.findByToken(request.getRefreshToken());

        // Check whether it has expired
        refreshTokenService.verifyExpiration(oldToken);

        // Get the user associated with the token
        User user = oldToken.getUser();

        // Generate a new access token
        String newAccessToken = jwtService.generateToken(user);

        // Delete old refresh token and create a new one
        RefreshToken newRefreshToken =
                refreshTokenService.rotateRefreshToken(oldToken);

        // Return both new tokens
        TokenResponse response = new TokenResponse(
                newAccessToken,
                newRefreshToken.getToken()
        );

        return ResponseEntity.ok(response);
    }

    @PostMapping("/logout")
    public ResponseEntity<String> logout(
            @RequestBody LogoutRequest request) {

        refreshTokenService.deleteByToken(
                request.getRefreshToken()
        );

        return ResponseEntity.ok("Logged out successfully");
    }

    @GetMapping("/me")
    public ResponseEntity<AuthResponse> getCurrentUser(
            Authentication authentication) {

        User user = (User) authentication.getPrincipal();

        AuthResponse response = new AuthResponse(
                "Authenticated user",
                user.getId(),
                user.getName(),
                user.getEmail(),
                user.getRole(),
                null
        );

        return ResponseEntity.ok(response);
    }
}