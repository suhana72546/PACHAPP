package com.pachapp.pachapp_backend.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/api/test")
    public String test() {
        return "PACHAPP Backend is running!";
    }

    @GetMapping("/api/test/household")
    public String householdTest() {
        return "HOUSEHOLD access granted!";
    }
}