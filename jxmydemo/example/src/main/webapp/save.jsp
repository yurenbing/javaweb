<%@ page language="java" import="java.util.*" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="com.jxmy.utils.ExcelOperationUtil" %>
<%@ page import="com.jxmy.dao.EmpDao" %>
<%@ page import="com.jxmy.pojo.tb_myemp" %>

<%	
	request.setCharacterEncoding("GBK");
	System.out.println(request.getSession().getServletContext().getRealPath("emp.xls"));
//	String filePath ="E:/javaweb/jxmydemo/example/src/main/webapp/emp.xls";
	String filePath =request.getSession().getServletContext().getRealPath("emp.xls");
	ExcelOperationUtil excelUtil = new ExcelOperationUtil();
	List<tb_myemp> list = excelUtil.readExcelFileToDB(filePath);
	boolean res = EmpDao.getInstance().saveData(list);
	if(res)
		out.println("<script>alert('±£´æ³É¹¦£¡');window.location.href = 'index.jsp';</script>");	
 %>