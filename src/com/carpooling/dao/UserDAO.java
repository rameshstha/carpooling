package com.carpooling.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.carpooling.service.JSONArray;

public class UserDAO {
	ConnectManager cm;
	Connection con;
	Statement stmt, stmt1,stmt2;
	ResultSet rs, rs1;

	public UserDAO() {
		try {
			con = ConnectManager.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean isUser(String email, String password) {
		try {
			String sql = "SELECT email, password FROM users where email = '" + email + "' and password = '" + password
					+ "'";

			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs == null)
				return false;
			if (rs.next())
				return true;
			return false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

	@SuppressWarnings("unused")
	public JSONArray userEdit(String email) {
		JSONArray jsonArray = new JSONArray();
		try {
			String sql1 = "SELECT * FROM users where email='" + email + "'";
			stmt1 = con.createStatement();
			rs1 = stmt1.executeQuery(sql1);
			if (rs1 == null) {
				return null;
			}
			return JSONArray.convertResultSetIntoJSON(rs1);
			/*
			 * if (rs1.next()) {
			 * System.out.println("sadfasdfasdf====="+rs1.getString(1)); return
			 * JSONArray.convertResultSetIntoJSON(rs1); }
			 */

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean createUser(String fullname, int gender, String state, String city, String street, int zip,
			int birthyear, String email, String password) {
		try {
			String sql = "INSERT INTO users(fullName,gender,state,city,street,zipcode,birthyear,email,password)VALUES('"
					+ fullname + "','" + gender + "','" + state + "','" + city + "','" + street + "','" + zip + "','"
					+ birthyear + "','" + email + "','" + password + "');";

			stmt = con.createStatement();

			if (stmt.executeUpdate(sql) != 0)
				return true;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean userEdit(int userid, String fullname, int gender, String state, String city, String street,
			int zip, int birthyear, String email, String password) {
		try {
			Statement	stmtUpdateProfile;
			String sql1 = "update users set fullname='" + fullname + "',gender='" + gender + "',state='" + state
					+ "',city='" + city + "',street='" + street + "',zipcode='" + zip + "',birthyear='"
					+ birthyear + "',email='" + email + "',password='" + password + "' where userid='"+userid+"'";
            
			System.out.println("userEdit sql"+sql1);
			stmtUpdateProfile = con.createStatement();

			if (stmtUpdateProfile.executeUpdate(sql1) != 0)
				return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
