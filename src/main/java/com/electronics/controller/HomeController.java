package com.electronics.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.electronics.daoimpl.CategoryDAOImpl;
import com.electronics.model.Category;

@Controller
public class HomeController {

	@RequestMapping("/")
    public String landingPage() {
        return "index";  // The view name "home.jsp"
        
    }
    
    // Registration page
	@RequestMapping("/register")
    public String register() {
        return "register";  // The view name "register.jsp"
    }
	
	// Login page
	@RequestMapping("/login")
	public String loginPage() {
		return "login";  // The view name "register.jsp"
	}
	
	
	
	// RegistrationSuccess page
	@RequestMapping("/RegisterSuccess")
	public String registrationSuccess() {
		return "RegisterSuccess";  // The view name "register.jsp"
	}
	
	
	
	// RegistrationSuccess page
	@RequestMapping("/RegisterFail")
	public String registrationFail() {
		return "RegisterFail";  // The view name "register.jsp"
	}
	
	
	// home page
	@Autowired
    private CategoryDAOImpl categoryDAO;

    @RequestMapping("/home")
    public String showHomePage(Model model) {
        List<Category> categories = categoryDAO.getAllCategories();
        model.addAttribute("categories", categories);
        return "home"; // Loads home.jsp
    }
    
    
    // Login page
 	@RequestMapping("/menu")
 	public String menuPage() {	
 		return "menu";  // The view name "register.jsp"
 	}
 	
 	@RequestMapping("/checkout")
 	public String checkoutPage() {	
 		return "checkout";  // The view name "cart.jsp"
 	}
 	
 	
 	@RequestMapping("/loginError")
 	public String loginErrorPage() {	
 		return "loginError";  // The view name "loginError.jsp"
 	}
	
}
