package repositories;


import com.tobeto.tbto.jr_wshop.entities.Brand;
import com.tobeto.tbto.jr_wshop.entities.Brand;
import org.springframework.data.jpa.repository.JpaRepository;

// DATA JPA
// Generic
// Generic türler Reference Type olmak zorundadır.
public interface BrandRepository extends JpaRepository<Brand, Integer>
{

}
