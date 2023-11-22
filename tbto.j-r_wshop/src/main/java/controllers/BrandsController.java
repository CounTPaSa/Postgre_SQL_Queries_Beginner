package controllers;

import com.tobeto.tbto.jr_wshop.entities.Brand;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/brands")
public class BrandsController {

    @GetMapping
    public List<Brand> getAll()
    {
        return null;
    }

}
