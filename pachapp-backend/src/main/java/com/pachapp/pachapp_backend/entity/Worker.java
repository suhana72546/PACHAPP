package com.pachapp.pachapp_backend.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "workers")
public class Worker {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false, unique = true)
    private User user;

    private String workerId;

    private String assignedWard;

    private String district;

    private String status;

    public Worker() {
    }

    public Worker(
            User user,
            String workerId,
            String assignedWard,
            String district,
            String status) {

        this.user = user;
        this.workerId = workerId;
        this.assignedWard = assignedWard;
        this.district = district;
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public User getUser() {
        return user;
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

    public void setId(Long id) {
        this.id = id;
    }

    public void setUser(User user) {
        this.user = user;
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