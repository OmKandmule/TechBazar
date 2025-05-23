package com.electronics.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.electronics.daoimpl.OrderDAOImpl;
import com.electronics.daoimpl.ProductsDAOImpl;
import com.electronics.model.Order;
import com.electronics.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class MyOrdersController {
     
	@Autowired
	OrderDAOImpl orderDAOImpl;
	ProductsDAOImpl productsDAOImpl;
	
	
	@GetMapping("/MyOrders")
	public String showMyOrders(HttpSession session,Model model)
	{
		User user = (User) session.getAttribute("loggedInUser");
	    
	    if (user == null) {
	        return "redirect:/login"; // redirect if user is not logged in
	    }

	    List<Order> orders = orderDAOImpl.getOrdersByUserId(user.getId());
	    model.addAttribute("orders", orders); // add to model
	    
	    return "myOrders";
	}
}
