package com.electronics.dao;

import com.electronics.model.User;
import java.util.List;

public interface UserDAO {
	boolean saveUser(User user);
	User getUserById(int id);
    List<User> getAllUsers();
    void deleteUserById(int id);
    
    User getUserByEmailAndPassword(String email, String password);
}
