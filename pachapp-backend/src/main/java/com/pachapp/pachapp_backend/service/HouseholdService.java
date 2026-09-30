package com.pachapp.pachapp_backend.service;

import com.pachapp.pachapp_backend.dto.HouseholdRequest;
import com.pachapp.pachapp_backend.dto.HouseholdResponse;
import com.pachapp.pachapp_backend.entity.Household;
import com.pachapp.pachapp_backend.entity.User;
import com.pachapp.pachapp_backend.repository.HouseholdRepository;
import org.springframework.stereotype.Service;

@Service
public class HouseholdService {

    private final HouseholdRepository householdRepository;

    public HouseholdService(HouseholdRepository householdRepository) {
        this.householdRepository = householdRepository;
    }

    public HouseholdResponse createHousehold(
            User user,
            HouseholdRequest request) {

        if (householdRepository.existsByUser(user)) {
            throw new RuntimeException(
                    "Household profile already exists"
            );
        }

        Household household = new Household();

        household.setUser(user);
        household.setAddress(request.getAddress());
        household.setWard(request.getWard());
        household.setDistrict(request.getDistrict());
        household.setLatitude(request.getLatitude());
        household.setLongitude(request.getLongitude());

        Household savedHousehold =
                householdRepository.save(household);

        return toResponse(savedHousehold);
    }

    public HouseholdResponse getHousehold(User user) {

        Household household =
                householdRepository.findByUser(user)
                        .orElseThrow(() ->
                                new RuntimeException(
                                        "Household profile not found"
                                )
                        );

        return toResponse(household);
    }

    private HouseholdResponse toResponse(Household household) {

        return new HouseholdResponse(
                household.getId(),
                household.getUser().getId(),
                household.getAddress(),
                household.getWard(),
                household.getDistrict(),
                household.getLatitude(),
                household.getLongitude()
        );
    }
}