package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dao.Users;

@Repository
public class DatabaseControl {

	static final String JDBC_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	static final String DB_URL = "jdbc:sqlserver://10.20.14.70:1433";

	static final String USER = "sa";
	static final String PASS = "admin@1234";

	Connection connection;
	Statement statement;

	public Map<Integer,Integer> connect() throws SQLException {
		Map<Integer,Integer> m = new HashMap<>();
		int count_less_than_12,count_teenagers,count_20_to_30,count_30_to_50,count_50_and_above;
		count_less_than_12=count_teenagers=count_20_to_30=count_30_to_50=count_50_and_above=0;
		try {
			Class.forName(JDBC_DRIVER);
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();

			ResultSet resultSet = statement.executeQuery("select * from [AngularTestDB].[dbo].[users_info]");
			
			while (resultSet.next()) {
				Users users = new Users();
				users.setUser_id(resultSet.getInt("user_id"));
				users.setUser_age(resultSet.getInt("user_age"));
				users.setUser_name(resultSet.getString("user_name"));
				users.setUser_contact(resultSet.getString("user_contact"));
				
				if(users.getUser_age()<=12){
					count_less_than_12++;
				}
				else if(users.getUser_age()>=13 && users.getUser_age()<=19){
					count_teenagers++;
				}
				else if(users.getUser_age()>=20 && users.getUser_age()<=30){
					count_20_to_30++;
				}
				else if(users.getUser_age()>=30 && users.getUser_age()<=50){
					count_30_to_50++;
				}
				else if(users.getUser_age()>50){
					count_50_and_above++;
				}
				 
//				System.out.println(users.getUser_id());
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (statement != null)
				statement.close();
		}
		
		m.put(1, count_less_than_12);
		m.put(2, count_teenagers);
		m.put(3, count_20_to_30);
		m.put(4, count_30_to_50);
		m.put(5, count_50_and_above);
		
		return m;

	}
}
