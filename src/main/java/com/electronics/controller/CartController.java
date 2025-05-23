package com.electronics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.electronics.daoimpl.Cart;
import com.electronics.model.CartItem;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class CartController{

    // Add item to the cart
	@PostMapping("/add")
	public String addToCart(@RequestParam("itemId") int itemId, 
	                        @RequestParam("typeId") int typeId, 
	                        @RequestParam("productName") String productName, 
	                        @RequestParam("price") double price, 
	                        @RequestParam("quantity") int quantity, 
	                        @RequestParam("imageUrl") String imageUrl, 
	                        HttpSession session) {

	    Cart cart = getCartFromSession(session);
	    CartItem item = new CartItem(itemId, typeId, productName, price, quantity, imageUrl);
	    cart.addItem(item);
	    session.setAttribute("cart", cart);

	    return "redirect:/cart";  // Redirect to the cart view page
	}


    // Increase item quantity
    @PostMapping("/increase")
    public String increaseQuantity(@RequestParam("itemId") int itemId, HttpSession session) {
        Cart cart = getCartFromSession(session);
        cart.increaseQuantity(itemId);
        session.setAttribute("cart", cart);
        return "redirect:/cart";
    }

    // Decrease item quantity
    @PostMapping("/decrease")
    public String decreaseQuantity(@RequestParam("itemId") int itemId, HttpSession session) {
        Cart cart = getCartFromSession(session);
        cart.decreaseQuantity(itemId);
        session.setAttribute("cart", cart);
        return "redirect:/cart";
    }

    // Remove item from the cart
    @PostMapping("/remove")
    public String removeFromCart(@RequestParam("itemId") int itemId, HttpSession session) {
        Cart cart = getCartFromSession(session);
        cart.removeItem(itemId);
        session.setAttribute("cart", cart);
        return "redirect:/cart";
    }

    // Display the cart
    @GetMapping
    public String viewCart(HttpSession session) {
        Cart cart = getCartFromSession(session);
        session.setAttribute("cart", cart);
        return "cart";  // Return cart.jsp
    }

    // Helper method to get cart from session, or create a new one if null
    
    private Cart getCartFromSession(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cartItems", cart);
        }
        return cart;
    }
}
