package com.tobeto.spring.b.services.concretes;

import com.tobeto.spring.b.repositories.CustomerRepository;
import com.tobeto.spring.b.services.abstracts.CustomerService;
import com.tobeto.spring.b.services.dtos.responses.customer.GetCustomerListResponse;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@AllArgsConstructor
@Service
public class CustomerManager implements CustomerService
{
    private final CustomerRepository customerRepository;


    @Override
    public List<GetCustomerListResponse> getAll() {
    return customerRepository.getAll();
    }


}
