package com.carpooling.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserDAO {
	ConnectManager cm;
	Connection con;
	Statement stmt;
	ResultSet rs;

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
			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

	public boolean createUser(String fullname, int gender, String state, String city, String street, int zip,
			int birthyear, String email, String password) {
		try {
			String sql = "INSERT INTO users(fullName,gender,state,city,street,zipcode,birthyear,email,password)VALUES('"
					+ fullname + "','" + gender + "','" + state + "','" + city + "','" + street + "','" + zip
					+ "','"+birthyear+"','" + email + "','" + password + "');";

			System.out.println(sql);
			// Perform INSERT
			stmt = con.createStatement();

			if(stmt.executeUpdate(sql)!=0)
			return true;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
