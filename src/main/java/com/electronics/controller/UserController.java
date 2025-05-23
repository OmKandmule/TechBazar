package com.electronics.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.electronics.dao.UserDAO;
import com.electronics.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserDAO userDAO;

    // Register User (existing registration logic remains unchanged)
    @PostMapping("/register")
    public ModelAndView registerUser(@RequestParam("firstName") String firstName,
                                     @RequestParam("lastName") String lastName,
                                     @RequestParam("mobile") String mobile,
                                     @RequestParam("email") String email,
                                     @RequestParam("password") String password) {

        // Create a new User object from the form data
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setMobile(mobile);
        user.setEmail(email);
        user.setPassword(password);  // Store password as plain text (for now)

        // Try saving the user and check the result
        boolean isSaved = userDAO.saveUser(user);

        if (isSaved) {
            // Redirect to success page if user is saved
            return new ModelAndView("redirect:/RegisterSuccess");
        } else {
            // Redirect to error page if saving user fails
            return new ModelAndView("redirect:/RegisterFail");
        }
    }

    // Check Login Credentials
    @PostMapping("/login")
    public ModelAndView loginUser(@RequestParam("email") String email,
                                  @RequestParam("password") String password,
                                  HttpSession session) {

        // Check if the user exists by email
        User user = userDAO.getUserByEmailAndPassword(email, password);

        if (user == null) {
            // Email does not exist in the database
            return new ModelAndView("redirect:/loginError");
        } else {
            // Email exists, check the password
            if (user.getPassword().equals(password)) {
                // If password matches, login successful
                session.setAttribute("loggedInUser", user);  // Store user in session

                return new ModelAndView("redirect:/home");  // Redirect to home or dashboard page
            } else {
                // If password is wrong, show the "Wrong Password" message
                return new ModelAndView("redirect:/loginError");
            }            
        }
           
    }
    
    //logout user
    @GetMapping("/logout")
    public ModelAndView logOutUser(HttpSession session) {
        session.invalidate(); // ✅ clears the entire session
        return new ModelAndView("redirect:/");
    }

}
