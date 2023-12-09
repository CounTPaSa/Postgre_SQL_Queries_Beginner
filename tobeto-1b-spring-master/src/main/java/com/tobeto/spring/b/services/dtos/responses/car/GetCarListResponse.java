package com.tobeto.spring.b.services.dtos.responses.car;

import com.tobeto.spring.b.entities.Brand;
import com.tobeto.spring.b.services.dtos.responses.brand.GetBrandListResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GetCarListResponse {
    private int id;
    private int modelYear;
    private String  modelName;
    private GetBrandListResponse brand; // ctor 3.parameter
    // GetBrandListResponse yerine Brand entity kullanirsak
    // veritabanı tablosunu Disari acariz
}
