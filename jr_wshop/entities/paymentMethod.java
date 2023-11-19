package com.tobeto.tbto.jr_wshop.entities;

import jakarta.persistence.*;

import java.util.List;

@Table(name = "payment_method")
@Entity
public class paymentMethod
{
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "ccnumber")
    private String ccNumber;

    @Column(name = "cvv")
    private String cvv;

    @Column(name = "ccexdate")
    private String ccexDate;

    @OneToMany(mappedBy = "paymentMethod")
    List<Customer> customers;
}
