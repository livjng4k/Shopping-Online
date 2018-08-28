package com.sam.shoppingonline.repository;

import com.sam.shoppingonline.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Integer>{
    
}
