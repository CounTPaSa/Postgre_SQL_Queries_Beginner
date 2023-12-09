package com.tobeto.spring.b.services.abstracts;

import com.tobeto.spring.b.services.dtos.requests.car.AddCarRequest;
import com.tobeto.spring.b.services.dtos.responses.car.GetCarListResponse;

import java.util.List;

public interface CarService {

    void add (AddCarRequest request);
    List<GetCarListResponse> getAll();

}
