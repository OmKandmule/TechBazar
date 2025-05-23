package com.electronics.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.electronics.daoimpl.Cart;
import com.electronics.daoimpl.OrderDAOImpl;
import com.electronics.model.CartItem;
import com.electronics.model.Order;
import com.electronics.model.OrderItem;
import com.electronics.model.Products;
import com.electronics.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {

    @Autowired
    private OrderDAOImpl orderDao;

    @PostMapping("/placeOrder")
    public String placeOrder(HttpSession session, @RequestParam("paymentMethod") String paymentMethod, Model model) {
        // ✅ Check if user is logged in
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login"; // Redirect to login page if user is not logged in
        }

        // ✅ Retrieve cart from session
        Cart cart = (Cart) session.getAttribute("cart");
        List<CartItem> items = new ArrayList<>();
        if (cart != null && cart.getItems() != null) {
            items.addAll(cart.getItems().values()); // Convert HashMap values to List
        }

        // ✅ If cart is empty, return to cart page with an error message
        if (items.isEmpty()) {
            model.addAttribute("error", "Your cart is empty!");
            return "cart";
        }

        // ✅ Calculate total price
        double totalPrice = items.stream()
                .mapToDouble(item -> item.getPrice() * item.getQuantity())
                .sum();

        // ✅ 1️⃣ Save Order (First, generate order ID)
        Order order = new Order();
        order.setUser(user);
        order.setOrderDate(LocalDateTime.now());
        order.setTotalAmount(totalPrice);
        order.setStatus("Pending");
        order.setPaymentMethod(paymentMethod);
        
        orderDao.saveOrder(order); // Save order first

        // ✅ 2️⃣ Save OrderItem for each CartItem
        for (CartItem cartItem : items) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(order); // Associate orderItem with the saved order

            // 🔹 Fetch product details using product ID
            Products product = orderDao.getProductById(cartItem.getItemId());
            if (product == null) {
                System.out.println("⚠️ Product not found for ID: " + cartItem.getItemId());
                continue; // Skip this item if product not found
            }
            
            // 🔹 Set order item details
            orderItem.setProduct(product);
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setPrice(cartItem.getPrice());

            // 🔹 Save order item to the database
            orderDao.saveOrderItem(orderItem);
        }

        // ✅ 3️⃣ Clear cart after order placement
        session.removeAttribute("cart");

        System.out.println("✅ Order placed successfully! Order ID: " + order.getId());
        
        return "orderSuccess"; // Redirect to order confirmation page
    }
}
