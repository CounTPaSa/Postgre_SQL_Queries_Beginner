package com.tobeto.spring.b.repositories;

import com.tobeto.spring.b.entities.Customer;
import com.tobeto.spring.b.services.dtos.responses.customer.GetCustomerListResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CustomerRepository extends JpaRepository<Customer, Integer>
{
    @Query("SELECT new com.tobeto.spring.b.services.dtos.responses.customer.GetCustomerListResponse(c.id, c.name, c.surName, c.identityNo) FROM Customer c")
    List<GetCustomerListResponse> getAll();


}
