package com.tobeto.spring.b.services.concretes;

import com.tobeto.spring.b.entities.Brand;
import com.tobeto.spring.b.entities.Car;
import com.tobeto.spring.b.repositories.BrandRepository;
import com.tobeto.spring.b.repositories.CarRepository;
import com.tobeto.spring.b.services.abstracts.CarService;
import com.tobeto.spring.b.services.dtos.requests.brand.AddBrandRequest;
import com.tobeto.spring.b.services.dtos.requests.car.AddCarRequest;
import com.tobeto.spring.b.services.dtos.responses.brand.GetBrandListResponse;
import com.tobeto.spring.b.services.dtos.responses.car.GetCarListResponse;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@Service
public class CarManager implements CarService {
    private final CarRepository carRepository;

    private final BrandRepository brandRepository;

    @Override
    public void add(AddCarRequest request) {
        Car car = new Car();
        car.setModelName(request.getModelName());
        car.setModelYear(request.getModelYear());
        car.setBrand(convertToBrand(request.getBrandRequest()));
        this.carRepository.save(car);
    }

    @Override
    public List<GetCarListResponse> getAll() {
        return carRepository.getAll();
    }

    public Brand convertToBrand(AddBrandRequest addBrandRequest)
    {
        Brand brand = new Brand();
        brand.setName(addBrandRequest.getName());
        this.brandRepository.save(brand);
        return brand;
    }

}
