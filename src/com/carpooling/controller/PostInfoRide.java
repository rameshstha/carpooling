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
 * Servlet implementation class PostInfoRide
 */
@WebServlet("/PostInfoRide")
public class PostInfoRide extends HttpServlet {
	private static final long serialVersionUID = 1L;

	int userid;

	JSONArray jsonArrayRide = new JSONArray();
	PostService postService = new PostService();
	HttpSession session;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session=request.getSession();
		UserService userService = new UserService();
		String username = (String) request.getSession().getAttribute("username");

		userid = userService.getUserId(username);

		String post = request.getParameter("postRide");
		String source = request.getParameter("fromRide");
		String destination = request.getParameter("toRide");
		String seat = request.getParameter("seatRide");
		String dateandTime = request.getParameter("dateandTimeRide");
		int posttype = Integer.parseInt(request.getParameter("posttypeRide"));

		if (postService.addPost(userid, post, source, destination, seat, dateandTime, posttype)) {
			jsonArrayRide = postService.getPostDetailsRide();
			if (jsonArrayRide == null)
				System.out.println("errorAskForRide");
			else {
				session.setAttribute("jsonArrayRide", jsonArrayRide);
				response.sendRedirect("home.jsp");
			}
		} else {
			session.setAttribute("errorAskForRide", "Cannot Post!! Try Again");
			response.sendRedirect("home.jsp");
		}
	}

}
