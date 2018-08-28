
package com.sam.shoppingonline.repository;

import com.sam.shoppingonline.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
    
}
