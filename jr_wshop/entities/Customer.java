package com.tobeto.tbto.jr_wshop.entities;

import jakarta.persistence.*;

import java.util.List;

@Table(name = "customer")
@Entity
public class Customer
{
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "surname")
    private String startDate;

    @Column(name = "identityno")
    private String price;

    @ManyToOne
    @JoinColumn(name = "payment")
    private  paymentMethod paymentMethod;
}
