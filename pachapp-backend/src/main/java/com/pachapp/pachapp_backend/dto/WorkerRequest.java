package com.pachapp.pachapp_backend.dto;

public class WorkerRequest {

    private String workerId;
    private String assignedWard;
    private String district;
    private String status;

    public WorkerRequest() {
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

    public void setWorkerId(String workerId) {
        this.workerId = workerId;
    }

    public void setAssignedWard(String assignedWard) {
        this.assignedWard = assignedWard;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}