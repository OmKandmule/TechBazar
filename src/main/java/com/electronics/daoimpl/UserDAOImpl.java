package com.electronics.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.electronics.dao.UserDAO;
import com.electronics.model.User;

@Repository
public class UserDAOImpl implements UserDAO {

    private final SessionFactory sessionFactory;

    // Spring will inject the SessionFactory here
    @Autowired
    public UserDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Transactional
    @Override
    public boolean saveUser(User user) {
    	try {
            Session session = sessionFactory.getCurrentSession();
            session.saveOrUpdate(user); // Save or update user
            return true;  // Return true if successful
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Return false if an error occurs
        }

    }
    
    
    @Transactional
    @Override
    public User getUserByEmailAndPassword(String email, String password) {
        // Get the current session from the SessionFactory
        Session session = sessionFactory.getCurrentSession();

        // Query to find the user by username and password
        Query<User> query = session.createQuery("FROM User WHERE email = :email AND password = :password", User.class);
        query.setParameter("email", email);
        query.setParameter("password", password);

        // Return the user if found
        return query.uniqueResult();
    }
    
    
    
    
    
    
    

    @Transactional
    @Override
    public User getUserById(int id) {
        // Session is automatically provided by Spring
        Session session = sessionFactory.getCurrentSession();
        return session.get(User.class, id);  // Fetch user by ID
    }

    @Transactional
    @Override
    public List<User> getAllUsers() {
        // Session is automatically provided by Spring
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("FROM User", User.class).list();  // Get all users
    }

    @Transactional
    @Override
    public void deleteUserById(int id) {
        // Session is automatically provided by Spring
        Session session = sessionFactory.getCurrentSession();
        User user = session.get(User.class, id);
        if (user != null) {
            session.delete(user);  // Delete user by ID
        }
    }
}
