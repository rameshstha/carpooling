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
import com.carpooling.service.UserService_old;

/**
 * Servlet implementation class Notification
 */
@WebServlet("/Notification")
public class Notification extends HttpServlet {
	private static final long serialVersionUID = 1L;
    JSONArray jsonArray=new JSONArray();
    JSONArray jsonArrayRide=new JSONArray();
    HttpSession session;
    int notification;
    UserService_old userService=new UserService_old();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Notification() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostService postService=new PostService();
			postService.updateStatus();
			
			//Object jsonArrayStr = session.getAttribute("jsonArray");
			//Object jsonArrayRide = session.getAttribute("jsonArray");
			
			//session.setAttribute("jsonArray", jsonArrayStr);
			//session.setAttribute("jsonArrayRide", jsonArrayRide);
			
			response.sendRedirect("home.jsp");
		}
	}
