package com.tobeto.tbto.jr_wshop.entities;


import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "brands")
public class Brand
{
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name")
    private  String modelname;

    @OneToMany(mappedBy = "brand")
    private List<Car> cars;
}
