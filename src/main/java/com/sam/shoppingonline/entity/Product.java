
package com.sam.shoppingonline.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Products")
public class Product implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "name")
    private String name;
    @Column(name = "description")
    private String description;
    @Column(name = "price")
    private double price;
    @Column(name = "thumnail")
    private String thumnail;
    @ManyToOne
    @JoinColumn(name = "cateId")
    private Category category;

    public Product() {
    }

    public Product(int id, String name, String description, double price, String thumnail, Category category) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.thumnail = thumnail;
        this.category = category;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getThumnail() {
        return thumnail;
    }

    public void setThumnail(String thumnail) {
        this.thumnail = thumnail;
    }
 

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
    
    
}
