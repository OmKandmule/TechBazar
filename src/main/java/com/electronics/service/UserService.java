package com.electronics.service;

import java.util.List;

import com.electronics.model.User;

public interface UserService {

	boolean saveUserInfo(User user);
    User getUserById(int id);
    List<User> getAllUsers();
    void deleteUserById(int id);
    
    User validateUserCredentials(String email, String password);

}
