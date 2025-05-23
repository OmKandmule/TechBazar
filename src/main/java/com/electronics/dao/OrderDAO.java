package com.electronics.dao;

import com.electronics.model.Order;
import com.electronics.model.OrderItem;
import com.electronics.model.Products;

import java.util.List;

public interface OrderDAO {
    void saveOrder(Order order);
    Order getOrderById(int id);
    List<Order> getOrdersByUserId(int userId);
	void saveOrderItem(OrderItem orderItem);
	Products getProductById(int productId);
}
