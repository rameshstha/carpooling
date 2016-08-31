package com.carpooling.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpooling.service.JSONArray;
import com.carpooling.service.PostService;
import com.carpooling.service.UserService;

/**
 * Servlet implementation class PostInfo
 */
@WebServlet("/PostInfo")
public class PostInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int userid;

	JSONArray jsonArray = new JSONArray();
	PostService postService = new PostService();
	HttpSession session;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session=request.getSession();
		UserService userService = new UserService();
		String username = (String) request.getSession().getAttribute("username");

		userid = userService.getUserId(username);
		
		String post = request.getParameter("post");
		String source = request.getParameter("from");
		String destination = request.getParameter("to");
		String seat = request.getParameter("seat");
		String dateandTime = request.getParameter("dateandTime");
		int posttype = Integer.parseInt(request.getParameter("posttype"));

		if (postService.addPost(userid, post, source, destination, seat, dateandTime, posttype)) {
			
			jsonArray = postService.getPostDetails();
			if (jsonArray == null)
				System.out.println("errorJSON");
			else {
				session.setAttribute("userid", userid);
				session.setAttribute("jsonArray", jsonArray);
				response.sendRedirect("home.jsp");
			}
		} else {
			session.setAttribute("errorPosting", "Cannot Post!! Try Again");
			response.sendRedirect("home.jsp");
		}
	}

}
