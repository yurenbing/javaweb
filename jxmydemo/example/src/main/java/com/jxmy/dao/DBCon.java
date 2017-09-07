package com.jxmy.dao;
import java.sql.*;
public class DBCon {
	private static Connection conn = null;
	private static DBCon instance = null;
	private static String driverClass = "com.mysql.jdbc.Driver";
	private static String URL = "jdbc:mysql://localhost:3306/jxminyu";
	private static String user = "root";
	private static String pwd = "967468";
	public static DBCon getInstance(){
		if(instance == null)
			instance = new DBCon();
		return instance;
	}
	public static Connection getConn(){
		try{
			Class.forName(driverClass);
			conn = DriverManager.getConnection(URL, user, pwd);
		}catch(Exception ex){
			System.out.println("���ݿ������쳣��"+ex.getMessage());
			ex.printStackTrace();
		}
		return conn;
	}
}
