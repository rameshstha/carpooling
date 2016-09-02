package com.carpooling.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpooling.service.UserService_old;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StringBuffer stringBuffer;

	/**
	 * Default constructor.
	 */
	public UserRegistration() {
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserService_old userService = new UserService_old();
		
		HttpSession session=request.getSession();
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

		MessageDigest messageDigest;
        try {
            messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(password.getBytes());
            byte[] messageDigestMD5 = messageDigest.digest();
            stringBuffer = new StringBuffer();
            for (byte bytes : messageDigestMD5) {
                stringBuffer.append(String.format("%02x", bytes & 0xff));
            }
           
        } catch (NoSuchAlgorithmException exception) {
     // TODO Auto-generated catch block
            exception.printStackTrace();
        }
		
			if (userService.createUser(fullname, gender, state, city, street, zip, birthyear, email, stringBuffer.toString())){
				session.setAttribute("username", email);
				response.sendRedirect("home.jsp");
			}	
			else
				response.sendRedirect("newProfile.jsp");

	}

}
