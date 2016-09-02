package com.carpooling.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpooling.service.UserService;

/**
 * Servlet implementation class UpdateProfile
 */
@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		UserService userService = new UserService();
		int userid=Integer.parseInt(request.getParameter("userid"));
		String fullname = request.getParameter("fullname");
		int gender = Integer.parseInt(request.getParameter("gender"));
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String street = request.getParameter("street");
		int zip = Integer.parseInt(request.getParameter("zip"));
		int birthyear = Integer.parseInt(request.getParameter("birthyear"));
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		
			if (userService.editUpdate(userid,fullname, gender, state, city, street, zip, birthyear, email, password)){
				response.sendRedirect("home.jsp");
			}	
			else
				response.sendRedirect("editprofile.jsp");

	}

}
