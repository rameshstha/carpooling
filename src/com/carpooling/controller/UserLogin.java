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

import com.carpooling.service.JSONArray;
import com.carpooling.service.PostService;
import com.carpooling.service.UserService_old;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    JSONArray jsonArray=new JSONArray();
    JSONArray jsonArrayRide=new JSONArray();
    HttpSession session;
    int notification;
    UserService_old userService = new UserService_old();
    MessageDigest md;
    PostService postService=new PostService();
    StringBuffer stringBuffer;
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		session=request.getSession();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		MessageDigest messageDigest;
		        try {
		            messageDigest = MessageDigest.getInstance("MD5");
		            messageDigest.update(password.getBytes());
		            byte[] messageDigestMD5 = messageDigest.digest();
		            stringBuffer = new StringBuffer();
		            for (byte bytes : messageDigestMD5) {
		                stringBuffer.append(String.format("%02x", bytes & 0xff));
		            }
		           System.out.println( stringBuffer.toString());
		        } catch (NoSuchAlgorithmException exception) {
	         // TODO Auto-generated catch block
		            exception.printStackTrace();
		        }
		        
		if(userService.isUser(username, stringBuffer.toString())){
			session.setAttribute("username", username);
			
			jsonArray = postService.getPostDetails();
			jsonArrayRide = postService.getPostDetailsRide();
			
			notification=userService.getNotification();
			if(notification!=0)
				session.setAttribute("notification", notification);
			
			if (jsonArray == null||jsonArrayRide==null)
				System.out.println("errorJSON");
			else {
				session.setAttribute("jsonArray", jsonArray);
				session.setAttribute("jsonArrayRide", jsonArrayRide);
				
				
				response.sendRedirect("home.jsp");
			}
			
		}
		else{
			session.setAttribute("error", "Incorrect Username or Password");
			response.sendRedirect("index.jsp");
		}
			
	}
}
