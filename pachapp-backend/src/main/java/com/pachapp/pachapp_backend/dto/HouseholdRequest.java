package com.pachapp.pachapp_backend.dto;

public class HouseholdRequest {

    private String address;
    private String ward;
    private String district;
    private Double latitude;
    private Double longitude;

    public HouseholdRequest() {
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