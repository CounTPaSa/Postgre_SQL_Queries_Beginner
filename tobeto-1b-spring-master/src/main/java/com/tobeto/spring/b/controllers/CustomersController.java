package com.tobeto.spring.b.controllers;

import com.tobeto.spring.b.services.abstracts.CustomerService;
import com.tobeto.spring.b.services.dtos.responses.customer.GetCustomerListResponse;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/customers")
@AllArgsConstructor
public class CustomersController
{
    private final CustomerService customerService;

    @GetMapping
    public List<GetCustomerListResponse> getAll()
    {
        return customerService.getAll();
    }

}
