package com.electronics.service;

import com.electronics.dao.UserDAO;
import com.electronics.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    private final UserDAO userDAO;

    // Constructor injection for UserDAO
    @Autowired
    public UserServiceImpl(UserDAO userDAO) {
        this.userDAO = userDAO;  // Spring injects the UserDAO
    }

    @Override
    public boolean saveUserInfo(User user) {
        try {
            userDAO.saveUser(user);  // Call the DAO's save method
            return true;  // Successfully saved
        } catch (Exception e) {
            e.printStackTrace();
            return false;  // Error while saving
        }
    }

    
    

    @Override
    public User validateUserCredentials(String email, String password) {
        // Call the DAO layer to check if the user exists with the provided credentials
        return userDAO.getUserByEmailAndPassword(email, password);
    }
    
    
    
    
    
    @Override
    public User getUserById(int id) {
        return userDAO.getUserById(id);  // Call DAO method
    }

    @Override
    public List<User> getAllUsers() {
        return userDAO.getAllUsers();  // Call DAO method
    }

    @Override
    public void deleteUserById(int id) {
        userDAO.deleteUserById(id);  // Call DAO method
    }
}
