package com.pachapp.pachapp_backend.service;

import com.pachapp.pachapp_backend.dto.WorkerRequest;
import com.pachapp.pachapp_backend.dto.WorkerResponse;
import com.pachapp.pachapp_backend.entity.User;
import com.pachapp.pachapp_backend.entity.Worker;
import com.pachapp.pachapp_backend.repository.WorkerRepository;
import org.springframework.stereotype.Service;

@Service
public class WorkerService {

    private final WorkerRepository workerRepository;

    public WorkerService(WorkerRepository workerRepository) {
        this.workerRepository = workerRepository;
    }

    public WorkerResponse createWorker(
            User user,
            WorkerRequest request) {

        if (workerRepository.existsByUser(user)) {
            throw new RuntimeException(
                    "Worker profile already exists"
            );
        }

        Worker worker = new Worker();

        worker.setUser(user);
        worker.setWorkerId(request.getWorkerId());
        worker.setAssignedWard(request.getAssignedWard());
        worker.setDistrict(request.getDistrict());
        worker.setStatus(request.getStatus());

        Worker savedWorker =
                workerRepository.save(worker);

        return toResponse(savedWorker);
    }

    public WorkerResponse getWorker(User user) {

        Worker worker =
                workerRepository.findByUser(user)
                        .orElseThrow(() ->
                                new RuntimeException(
                                        "Worker profile not found"
                                )
                        );

        return toResponse(worker);
    }

    private WorkerResponse toResponse(Worker worker) {

        return new WorkerResponse(
                worker.getId(),
                worker.getUser().getId(),
                worker.getWorkerId(),
                worker.getAssignedWard(),
                worker.getDistrict(),
                worker.getStatus()
        );
    }
}