package com.electronics.daoimpl;

import com.electronics.dao.OrderDAO;
import com.electronics.model.Order;
import com.electronics.model.OrderItem;
import com.electronics.model.Products;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDAOImpl implements OrderDAO {

    @Autowired
    private SessionFactory sessionFactory;

    // ✅ Save Order (First, save the order and get its ID)
    @Override
    public void saveOrder(Order order) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        
        session.save(order); // Saves order, generating an ID
        
        tx.commit();
        session.close();
    }

    // ✅ Save OrderItem (Stores individual items linked to an order)
    @Override
    public void saveOrderItem(OrderItem orderItem) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        
        session.save(orderItem);
        
        tx.commit();
        session.close();
    }

    // ✅ Get Order by ID
    @Override
    public Order getOrderById(int id) {
        Session session = sessionFactory.openSession();
        Order order = session.get(Order.class, id);
        session.close();
        return order;
    }

    // ✅ Get All Orders for a Specific User
    @Override
    public List<Order> getOrdersByUserId(int userId) {
        Session session = sessionFactory.openSession();
        List<Order> orders = session.createQuery("FROM Order WHERE user.id = :userId", Order.class)
                .setParameter("userId", userId)
                .getResultList();
        session.close();
        return orders;
    }

    // ✅ Get Product by ID (Required for OrderItem)
    @Override
    public Products getProductById(int productId) {
        Session session = sessionFactory.openSession();
        Products product = session.get(Products.class, productId);
        session.close();
        return product;
    }
}
