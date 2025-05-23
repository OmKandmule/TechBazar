package com.electronics.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="user")  
public class User {
    
    @Id  
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")  
    private int id;
    
    @Column(name = "first_name")  
    private String firstName;     
    
    @Column(name = "last_name")   // Maps to the 'last_name' column
    private String lastName;    
    
    @Column(name = "mobile")      // Maps to the 'mobile' column
    private String mobile;
    
    @Column(name = "email")       // Maps to the 'email' column
    private String email;     
    
    @Column(name = "password")    // Maps to the 'password' column
    private String password;     
    

    public User() {
		super();
	}
        

	public User(int id, String firstName, String lastName, String mobile, String email, String password) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.mobile = mobile;
		this.email = email;
		this.password = password;
	}



	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    
    public String getMobile() {
		return mobile;
	}


	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }



	@Override
	public String toString() {
		return id + " " + firstName + " " + lastName + " " + mobile+ " " + email + " " + password ;
	}
    
    
    
}
