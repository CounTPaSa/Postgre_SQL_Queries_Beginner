package com.tobeto.tbto.jr_wshop.entities;

import jakarta.persistence.*;

@Table(name = "orders")
public class order
{
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "order_date")
    private String orderDate;

    @Column(name = "start_date")
    private String startDate;

    @Column(name = "end_date")
    private String endDate;

    @Column(name = "price")
    private String price;
}
