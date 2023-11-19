package com.tobeto.tbto.jr_wshop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//localhost:8080/api/persons icin fonksiyon yazalim (endpoints)

//annotation '@'
//Atandigi argumana oellikler kazandirir
@SpringBootApplication
public class Application {

	public static void main(String[] args)
	{
		//springi devreye alir
		SpringApplication.run(Application.class, args);
	}

}
