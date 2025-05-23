package com.electronics.dao;

import java.util.List;
import com.electronics.model.Products;

public interface ProductsDAO {
    void addProduct(Products product);
    void deleteProduct(int productId);
    List<Products> getByCategoryId(int categoryId);
}
