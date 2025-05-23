package com.electronics.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.electronics.dao.ProductsDAO;
import com.electronics.model.Products;

import jakarta.persistence.EntityManagerFactory;

@Repository
public class ProductsDAOImpl implements ProductsDAO {

    private final SessionFactory sessionFactory;

    @Autowired
    public ProductsDAOImpl(EntityManagerFactory entityManagerFactory) {
        this.sessionFactory = entityManagerFactory.unwrap(SessionFactory.class);
    }

    // Add Product
    @Override
    public void addProduct(Products product) {
        Session session = sessionFactory.getCurrentSession();
        session.save(product);
    }

    // Delete Product
    @Override
    public void deleteProduct(int productId) {
        Session session = sessionFactory.getCurrentSession();
        Products product = session.get(Products.class, productId);
        if (product != null) {
            session.delete(product);
        }
    }

    // Get Products by Category ID
    @Override
    public List<Products> getByCategoryId(int categoryId) {
        Session session = sessionFactory.getCurrentSession();
        
        String hql = "FROM Products WHERE category.id = :categoryId";        
        Query<Products> query = session.createQuery(hql, Products.class);
        query.setParameter("categoryId", categoryId);
        
        return query.getResultList();
    }
}

