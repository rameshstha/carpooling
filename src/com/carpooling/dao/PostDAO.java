package com.carpooling.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.carpooling.service.JSONArray;
import com.carpooling.service.JSONObject;

public class PostDAO {
	ConnectManager cm;
	Connection con;
	Statement stmt,stmt1;
	ResultSet rs,rs1;

	public PostDAO() {
		try {
			con = ConnectManager.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean addPost(int userid, String post, String source, String destination, String seat, String dateandTime,
			int posttype) {
		try {
			String sql = "INSERT INTO posts(userid,post,source,destination,seat,dateandTime,posttype)VALUES('" + userid
					+ "','" + post + "','" + source + "','" + destination + "','" + seat + "','" + dateandTime + "','"
					+ posttype + "');";

			stmt = con.createStatement();

			if (stmt.executeUpdate(sql) != 0)
				return true;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@SuppressWarnings("static-access")
	public JSONArray getPostDetails() {

		JSONArray jsonArray = new JSONArray();
		try {

			String sql = "Select u.userid,p.postid,fullname,source,destination,seat,dateandTime,post from users u,posts p where u.userid=p.userid and posttype='1' order by postid desc";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs == null) {
				return null;
			} else {
				return jsonArray.convertResultSetIntoJSON(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
	
	@SuppressWarnings("static-access")
	public JSONArray getPostDetailsRide() {

		JSONArray jsonArrayRide = new JSONArray();
		try {

			String sql1 = "Select u.userid,p.postid,fullname,source,destination,seat,dateandTime,post from users u,posts p where u.userid=p.userid and posttype='0' order by postid desc";
			stmt1 = con.createStatement();
			rs1 = stmt1.executeQuery(sql1);

			if (rs1 == null) {
				return null;
			} else {
				return jsonArrayRide.convertResultSetIntoJSON(rs1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
}
