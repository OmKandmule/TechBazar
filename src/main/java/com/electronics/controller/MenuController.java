package com.electronics.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.electronics.daoimpl.ProductsDAOImpl;
import com.electronics.model.Products;

@Controller
public class MenuController {

    @Autowired
    private ProductsDAOImpl productsDao;  // Inject the DAO layer

    @Transactional
    @GetMapping("/menu")
    public String showMenuPage(@RequestParam("categoryId") int categoryId,
                               @RequestParam("categoryName") String categoryName,
                               Model model) {
        System.out.println("Menu servlet");

        // Fetch products based on categoryId using DAO layer
        List<Products> products = productsDao.getByCategoryId(categoryId);
        
        // Add attributes to model
        model.addAttribute("categoryName", categoryName);
        model.addAttribute("categoryId", categoryId);
        model.addAttribute("products", products);
        
        // Return the view name directly instead of redirect
        return "menu"; // This will render the 'menuPage.jsp' or corresponding view
    }
}
