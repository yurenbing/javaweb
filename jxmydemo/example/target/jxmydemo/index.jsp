<%@ page language="java" import="java.util.*" pageEncoding="GBK" contentType="text/html; charset=GBK"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>读取Excel文件数据到数据库</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		table{
			font-size: 12px;
			color: maroon;		
			border:1px solid maroon;
		}
		input{
			font-size: 12px;
		}
	</style>
  </head>
  
  <body>
  	<form id="form1" action="uploadtest.do" method="post" enctype="multipart/form-data">
  	<input type="hidden" id="path" name="path" />
    <table  background="bg.jpg"  width="280">
    	<tr>
    		<td align="center" colspan="3" height="30"></td>
    	</tr>
    	<tr>
    		<td align="center" colspan="3">【读取Excel文件数据到数据库】</td>
    	</tr>
    	<tr>
    		<td align="center" colspan="3" height="10"><input type="file" name="name" value="提交"/></td>
    	</tr>   	   	
    	<tr>
    		<td width="5"></td>
    		<td align="center" colspan="2" valign="top">
    			<input type="submit" value="保存到数据库" name="submit">
    		</td>
    	</tr>
    	<tr>
    		<td align="center" colspan="3" height="8"></td>
    	</tr>
    </table>
    </form>
  </body>
</html>
