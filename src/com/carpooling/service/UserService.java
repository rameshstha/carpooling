package com.carpooling.service;

import com.carpooling.dao.UserDAO;

public class UserService { 
	UserDAO userDAO = new UserDAO();

	public boolean isUser(String email, String password) {
		return userDAO.isUser(email, password);
	}

	public boolean createUser(String fullname, int gender, String state, String city, String street, int zip,
			int birthyear, String email, String password) {
		return userDAO.createUser(fullname, gender, state, city, street, zip, birthyear, email, password);
	}
}
