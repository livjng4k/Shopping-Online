package com.sam.shoppingonline.repository;

import com.sam.shoppingonline.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRepository extends JpaRepository<User, String>{
//    
//    @Query("SELECT CASE WHEN COUNT(username) > 0 THEN 'true' ELSE 'false' END FROM users WHERE username = ?1")
//    public Boolean existsByUsername(String username);
}
