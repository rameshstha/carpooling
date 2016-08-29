package com.carpooling.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpooling.dao.UserDAO;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public UserRegistration() {
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAO userDAO = new UserDAO();
		String fullname = request.getParameter("fullname");
		int gender = Integer.parseInt(request.getParameter("gender"));
		System.out.println(gender);
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String street = request.getParameter("street");
		int zip = Integer.parseInt(request.getParameter("zip"));
		int birthyear = Integer.parseInt(request.getParameter("birthyear"));
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		
			if (userDAO.createUser(fullname, gender, state, city, street, zip, birthyear, email, password)){
				request.setAttribute("username", email);
				response.sendRedirect("home.jsp");
			}	
			else
				response.sendRedirect("newProfile.jsp");

	}

}
