package com.electronics.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "products")
public class Products {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int productId;

    // Mapping the foreign key as an object reference to Category
    @ManyToOne
    @JoinColumn(name = "category_id")  // This maps the category_id column from DB to the Category object
    private Category category;  // Referencing the Category entity instead of using int for categoryId

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "price")
    private double price;

    @Column(name = "img_url")
    private String imgUrl;

    @Column(name = "ratings")
    private double ratings;

    // Default constructor
    public Products() {
        super();
    }

    // Constructor with all fields
    public Products(int productId, Category category, String name, String description, double price, String imgUrl, double ratings) {
        super();
        this.productId = productId;
        this.category = category;
        this.name = name;
        this.description = description;
        this.price = price;
        this.imgUrl = imgUrl;
        this.ratings = ratings;
    }

    // Getter and Setter methods
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
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

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public double getRatings() {
        return ratings;
    }

    public void setRatings(double ratings) {
        this.ratings = ratings;
    }

    // toString method
    @Override
    public String toString() {
        return productId + " " + category.getId() + " " + name + " " + description + " " + price + " " + imgUrl + " " + ratings;
    }
}
