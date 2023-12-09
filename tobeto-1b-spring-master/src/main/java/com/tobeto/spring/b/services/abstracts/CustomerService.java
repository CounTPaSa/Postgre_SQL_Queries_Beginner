package com.tobeto.spring.b.services.abstracts;

import com.tobeto.spring.b.services.dtos.responses.customer.GetCustomerListResponse;

import java.util.List;

public interface CustomerService
{
    List<GetCustomerListResponse> getAll();
}
