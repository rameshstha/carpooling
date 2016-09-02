package com.carpooling.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.carpooling.service.JSONArray;
import com.carpooling.service.JSONObject;

public class PostDAO {
	ConnectManager cm;
	Connection con;
	Statement stmt,stmt1,stmt2,stmt3,stmt4;
	ResultSet rs,rs1,rs2;

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

			String sql = "Select u.userid,p.postid,fullname,source,destination,seat,dateandTime,post from users u,posts p where u.userid=p.userid and posttype='1' and status='1' order by postid desc";
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
	
	public boolean updateStatus() {
		try {
			String sql = "Update posts set status='1' where status='0'";
				
			stmt = con.createStatement();

			if (stmt.executeUpdate(sql) != 0)
				return true;
			return false;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean addComment(int userid, int postid, String comment) {
		try {
			String sql = "INSERT INTO comments(userid,postid,comment)VALUES('" + userid
					+ "','" + postid + "','" + comment + "');";

			stmt2 = con.createStatement();

			if (stmt2.executeUpdate(sql) != 0)
				return true;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@SuppressWarnings("static-access")
	public JSONArray getComment(int userid, int postid) {
		JSONArray jsonArrayRide = new JSONArray();
		try {

			String sql1 = "Select comment from comments where userid='"+userid+"' and postid='"+postid+"'";
			stmt3 = con.createStatement();
			rs2 = stmt3.executeQuery(sql1);

			if (rs2 == null) {
				return null;
			} else {
				return jsonArrayRide.convertResultSetIntoJSON(rs2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean getLike(int userid, int postid) {
		try {
			String sql = "INSERT INTO likes(userid,postid)VALUES('" + userid
					+ "','" + postid + "');";

			stmt4 = con.createStatement();

			if (stmt4.executeUpdate(sql) != 0)
				return true;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
