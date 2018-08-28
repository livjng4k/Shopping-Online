
package com.sam.shoppingonline.repository;

import com.sam.shoppingonline.entity.Product;
import java.util.List;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ProductRepository extends JpaRepository<Product, Integer>{

    @Query(value = "SELECT p FROM Product p")
    public List<Product> paging(Pageable pageable);
    
    @Query(value = "SELECT p FROM Product p where LOWER(p.name) LIKE CONCAT('%', LOWER(:name), '%')")
    public List<Product> findAndPaging(@Param("name") String name, Pageable pageable);
    
    @Query(value = "SELECT COUNT(p) FROM Product p where LOWER(p.name) LIKE CONCAT('%', LOWER(:name), '%')")
    public int countByName(@Param("name") String name);
    
    @Query(value = "SELECT p FROM Product p WHERE p.category.id = (:cateId)")
    public List<Product> findByCate(@Param("cateId")int cateId, Pageable pageabe);
    
    @Query(value = "SELECT COUNT(p) FROM Product p WHERE p.category.id = (:cateId)")
    public int countByCate(@Param("cateId")int cateId);
}
