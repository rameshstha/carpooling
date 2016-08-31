package com.carpooling.service;

import com.carpooling.dao.PostDAO;

public class PostService {
	PostDAO postDAO=new PostDAO();
public boolean addPost(int userid,String post,String source,String destination,String seat,String dateandTime,int posttype){
	return postDAO.addPost(userid, post,source,destination,seat,dateandTime,posttype);
}
public JSONArray getPostDetails(){
	return postDAO.getPostDetails();
}
public JSONArray getPostDetailsRide(){
	return postDAO.getPostDetailsRide();
}
}
