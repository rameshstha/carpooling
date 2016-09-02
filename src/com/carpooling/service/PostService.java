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

public boolean updateStatus(){
	return postDAO.updateStatus();
}

public boolean addComment(int userid, int postid, String comment){
	return postDAO.addComment(userid, postid,comment);
}

public JSONArray getComment(int userid, int postid){
	return postDAO.getComment(userid,postid);
}
public boolean addLike(int userid, int postid) {
	return postDAO.getLike(userid,postid);
	
}
public JSONArray getLatLong() {
	return postDAO.getLatLong();
}

}
