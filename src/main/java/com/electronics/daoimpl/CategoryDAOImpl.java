package com.electronics.daoimpl;

import com.electronics.model.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class CategoryDAOImpl {

    private SessionFactory sessionFactory;

    public CategoryDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

     public List<Category> getAllCategories() {
        Session session = sessionFactory.openSession();
        Transaction transaction = null;
        List<Category> categories = null;

        try 
        {
            transaction = session.beginTransaction();
            categories = session.createQuery("FROM Category", Category.class).list();
            transaction.commit();
        } 
        catch (Exception e) 
        {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } 

        return categories;
    }
}
