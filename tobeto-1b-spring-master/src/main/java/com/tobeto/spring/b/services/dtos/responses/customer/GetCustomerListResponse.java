package com.tobeto.spring.b.services.dtos.responses.customer;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GetCustomerListResponse
{
    private int id;

    private String getName;

    private String getSurName;

    private String getIdentityNo;


}
