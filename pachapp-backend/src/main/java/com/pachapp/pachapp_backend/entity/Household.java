package com.pachapp.pachapp_backend.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "households")
public class Household {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false, unique = true)
    private User user;

    private String address;

    private String ward;

    private String district;

    private Double latitude;

    private Double longitude;

    public Household() {
    }

    public Household(
            User user,
            String address,
            String ward,
            String district,
            Double latitude,
            Double longitude) {

        this.user = user;
        this.address = address;
        this.ward = ward;
        this.district = district;
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public Long getId() {
        return id;
    }

    public User getUser() {
        return user;
    }

    public String getAddress() {
        return address;
    }

    public String getWard() {
        return ward;
    }

    public String getDistrict() {
        return district;
    }

    public Double getLatitude() {
        return latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }
}