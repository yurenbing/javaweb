package com.jxmy.dao;

import com.jxmy.pojo.Jxmy_gatheringinfo;
import com.jxmy.pojo.Jxmy_paymentinfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class StuInfoDao {
	public static Connection getConnection(){
		Connection con = null;
		String url = "jdbc:mysql://localhost:3306/jxminyu";
		String userName = "root";
		String pwd = "967468";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,userName,pwd);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return con;
	}
//	public List<String[]> findByAll(){
public List<Jxmy_gatheringinfo> findByAll(){
//		List<String[]> list = new ArrayList<String[]>();
		List<Jxmy_gatheringinfo> list = new ArrayList<Jxmy_gatheringinfo>();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			con = getConnection();
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM jxmy_gatheringinfo");
			SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
			while(rs.next()){
				Jxmy_gatheringinfo gatheringinfo=new Jxmy_gatheringinfo();
				gatheringinfo.setProjetName(rs.getString("Projet_Name"));
				gatheringinfo.setProjectInfo(rs.getString("Project_Info"));
				gatheringinfo.setPayUnit(rs.getString("Pay_Unit"));
				gatheringinfo.setTotalMoney(rs.getFloat("Total_money"));
				gatheringinfo.setGatherDate(rs.getDate("Gather_Date"));
				gatheringinfo.setGatherNote(rs.getString("Gather_Note"));
//				String[] stuInfo = new String[6];
//				stuInfo[0]=rs.getString("Projet_Name");
//				stuInfo[1]=rs.getString("Project_Info");
//				stuInfo[2]=rs.getString("Pay_Unit");
//				stuInfo[3]=rs.getFloat("Total_money")+"";
//				stuInfo[4]=dateFormat.format(rs.getDate("Gather_Date"));
//				stuInfo[5]=rs.getString("Gather_Note");
//				list.add(stuInfo);
				list.add(gatheringinfo);
			}
			rs.close();
			st.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
