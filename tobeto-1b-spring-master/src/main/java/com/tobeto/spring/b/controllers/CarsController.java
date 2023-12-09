package com.tobeto.spring.b.controllers;

import com.tobeto.spring.b.services.abstracts.CarService;
import com.tobeto.spring.b.services.dtos.requests.car.AddCarRequest;
import com.tobeto.spring.b.services.dtos.responses.car.GetCarListResponse;
import lombok.Data;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/cars")
@Data
public class CarsController {
    private final CarService carService;

    @GetMapping
    public List<GetCarListResponse> getAll(){
        return carService.getAll();
    }

    @PostMapping
    public void add(@RequestBody AddCarRequest addCarRequest)
    {
        this.carService.add(addCarRequest);
    }

}
