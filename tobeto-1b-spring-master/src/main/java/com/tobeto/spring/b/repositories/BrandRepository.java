package com.tobeto.spring.b.repositories;


import com.tobeto.spring.b.entities.Brand;
import com.tobeto.spring.b.services.dtos.responses.brand.GetBrandListResponse;
import jakarta.persistence.SqlResultSetMapping;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

// DATA JPA
// Generic
// Generic türler Reference Type olmak zorundadır.
public interface BrandRepository extends JpaRepository<Brand, Integer>
{
    // Derived Query Methods
    List<Brand> findByNameLikeOrIdEquals(String name, int id);

    boolean existsByName(String name);

    // Select * from brands
    // JPQL => SQL'dekinin tersine tablo ismi değil entity ismi kullanılır.
    @Query("SELECT b FROM Brand b Where b.name LIKE %:name%")
    List<Brand> search(String name);//KOTU KOD BOYLE YAZMA!

    @Query(value = "Select * from brands Where name LIKE %:name%", nativeQuery = true)
    List<Brand> search2(String name);//KOTU KOD BOYLE YAZMA!

    // b => Brand
    // expected => GetBrandListResponse
    @Query("SELECT new com.tobeto.spring.b.services.dtos.responses.brand.GetBrandListResponse(b.name) " +
            "FROM Brand b Where b.name LIKE %:name%")
    List<GetBrandListResponse> search3(String name);//IYI KOD BOYLE YAZ

}
