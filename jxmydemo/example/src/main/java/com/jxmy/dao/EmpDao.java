package com.jxmy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jxmy.pojo.tb_myemp;

public class EmpDao {
	private static EmpDao instance = null;
	public static EmpDao getInstance(){
		if (instance == null) 
			instance = new EmpDao();
		return instance;
	}
	
	public boolean saveData(List<tb_myemp> list) throws SQLException{
		Connection conn = null;
		try{
			conn = DBCon.getConn();
			String sql = "insert into tb_myemp(name,sex,dept,duty,telephone) values(?,?,?,?,?);";	
			PreparedStatement stmt = conn.prepareStatement(sql);
			for(tb_myemp emp:list){
				stmt.setString(1, emp.getName());
				stmt.setString(2, emp.getSex());
				stmt.setString(3, emp.getDept());
				stmt.setString(4, emp.getDuty());
				stmt.setString(5, emp.getTelephone());
				stmt.addBatch();//��һ�������ӵ��� PreparedStatement ����������������С�
			}	
			stmt.executeBatch();
			return true;
		}catch(Exception ex){
			System.out.println("����Ա�������쳣��"+ex.getMessage());
			ex.printStackTrace();
			return false;
		}finally{
			conn.close();
		}
		
	}
}
