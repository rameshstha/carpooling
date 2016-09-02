package com.carpooling.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpooling.service.JSONArray;
import com.carpooling.service.PostService;

/**
 * Servlet implementation class LatitudeLongitude
 */
@WebServlet("/LatitudeLongitude")
public class LatitudeLongitude extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PostService postService=new PostService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LatitudeLongitude() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JSONArray jsonArray=new JSONArray();
		
		jsonArray=postService.getLatLong();
		PrintWriter out=response.getWriter();
		out.println(jsonArray);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
