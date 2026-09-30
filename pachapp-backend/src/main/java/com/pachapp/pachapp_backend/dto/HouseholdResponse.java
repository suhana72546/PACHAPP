package com.pachapp.pachapp_backend.dto;

public class HouseholdResponse {

    private Long id;
    private Long userId;
    private String address;
    private String ward;
    private String district;
    private Double latitude;
    private Double longitude;

    public HouseholdResponse() {
    }

    public HouseholdResponse(
            Long id,
            Long userId,
            String address,
            String ward,
            String district,
            Double latitude,
            Double longitude) {

        this.id = id;
        this.userId = userId;
        this.address = address;
        this.ward = ward;
        this.district = district;
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public Long getId() {
        return id;
    }

    public Long getUserId() {
        return userId;
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
}