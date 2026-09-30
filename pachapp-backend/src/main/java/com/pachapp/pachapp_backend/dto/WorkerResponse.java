package com.pachapp.pachapp_backend.dto;

public class WorkerResponse {

    private Long id;
    private Long userId;
    private String workerId;
    private String assignedWard;
    private String district;
    private String status;

    public WorkerResponse() {
    }

    public WorkerResponse(
            Long id,
            Long userId,
            String workerId,
            String assignedWard,
            String district,
            String status) {

        this.id = id;
        this.userId = userId;
        this.workerId = workerId;
        this.assignedWard = assignedWard;
        this.district = district;
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public Long getUserId() {
        return userId;
    }

    public String getWorkerId() {
        return workerId;
    }

    public String getAssignedWard() {
        return assignedWard;
    }

    public String getDistrict() {
        return district;
    }

    public String getStatus() {
        return status;
    }
}