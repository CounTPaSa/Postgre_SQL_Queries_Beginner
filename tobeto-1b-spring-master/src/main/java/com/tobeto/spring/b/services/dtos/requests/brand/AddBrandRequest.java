package com.tobeto.spring.b.services.dtos.requests.brand;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AddBrandRequest
{
    @NotBlank(message = "Marka adi bos birakilamaz.")
    @Size(min = 3, max = 20, message = "Marka adi 3 karakterden az ve 20 karakterden fazla olamaz")
    private String name;
}
