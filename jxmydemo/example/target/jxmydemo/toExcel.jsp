<%@ page language="java" contentType="text/html" pageEncoding="GBK"%>
<%@ page import="org.apache.poi.hssf.usermodel.*" %>
<%@ page import="org.apache.poi.hssf.util.CellRangeAddress" %>
<%@ page import="java.io.*" %>
<%@ page import="com.jxmy.impl.GatherServiceImpl" %>
<%@ page import="com.jxmy.pojo.Jxmy_gatheringinfo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.jxmy.dao.StuInfoDao" %>
<%@ page import="com.jxmy.service.IGatherService" %>
<%@ page import="javax.annotation.Resource" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>'index.jsp'</title>
    <meta charset="utf-8">
    <link href="lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css">
    <link href="lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css">
    <link href="css/style-item.css" rel="stylesheet" media="all" />
    <script src="lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerButton.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerTip.js" type="text/javascript"></script>
    <script src="lib/jquery-validation/jquery.validate.min.js" type="text/javascript"></script>
    <script src="lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
    <!--
	<link rel="stylesheet" type="text/css" href="styles.css">
    -->
</head>
<body>
<%--<script type="text/javascript">--%>
    <%--$.ajax({--%>
        <%--type:"get",--%>
        <%--datatype:"text",--%>
        <%--url:"/exportGather.do",--%>
    <%--});--%>
<%--</script>--%>
<body>
<%--<form action="http://localhost:8080/uploadDemo/rest/file/upload" method="post" enctype="multipart/form-data">--%>
    <%--选择文件:<input type="file" name="file" width="120px">--%>
    <%--<input type="submit" value="上传">--%>
<%--</form>--%>
<%--<hr>--%>
<%--<form action="exportGather.do" method="get">--%>
    <%--<input type="submit" value="下载">--%>
<%--</form>--%>
<%
    out.clear();
    out = pageContext.pushBody();
    response.setHeader("Content-Disposition","attachment;filename=gatherInfo.xls");
    response.setContentType("application/x-download; charset=utf-8");
//    java.util.List<String[]> list = new StuInfoDao().findByAll();
//    IGatherService gatherService;
    List<Jxmy_gatheringinfo> list = new StuInfoDao().findByAll();
    HSSFWorkbook workBook = new HSSFWorkbook();		//创建 一个excel文档对象
    HSSFSheet sheet = workBook.createSheet();			//创建一个工作薄对象
    SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
    //设置样式
    HSSFCellStyle titleStyle = workBook.createCellStyle();	//创建样式对象
    titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER_SELECTION);	//水平居中
    titleStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);	//垂直居中
    // 设置字体
    HSSFFont titleFont = workBook.createFont();			//创建字体对象
    titleFont.setFontHeightInPoints((short) 15);			//设置字体大小
    titleFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);	//设置粗体
    titleFont.setFontName("黑体");	//设置为黑体字
    titleStyle.setFont(titleFont);
    // 合并单元格操作
    sheet.addMergedRegion(new CellRangeAddress(0, 1, 0, 5));
    HSSFRow row = null;
    HSSFCell cell = null;
    row = sheet.createRow(0);
    cell = row.createCell(0);
    cell.setCellStyle(titleStyle);
    cell.setCellValue(new HSSFRichTextString("工程款入账明细表"));
    System.out.println("test7");
    // 设置表文样式
    HSSFCellStyle tableStyle = workBook.createCellStyle();
    tableStyle.setBorderBottom((short)1);
    tableStyle.setBorderTop((short)1);
    tableStyle.setBorderLeft((short)1);
    tableStyle.setBorderRight((short)1);
    tableStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    // 设置表文字体
    HSSFFont tableFont = workBook.createFont();
    tableFont.setFontHeightInPoints((short) 12); 		//设置字体大小
    tableFont.setFontName("宋体"); 				//设置为黑体字
    tableStyle.setFont(tableFont);
    String[] title = {"项目名称","项目内容","收款单位","付款金额","付款日期","备注"};
    row = sheet.createRow(2);
    for (int i = 0; i < title.length; i++) {
        cell = row.createCell(i);
        cell.setCellStyle(tableStyle);
        cell.setCellValue(new HSSFRichTextString(title[i]));
    }
    System.out.println("test10");
    for (int i = 0; i < list.size(); i++) {
        row = sheet.createRow(i+3);
//        String[] stuInfo = list.get(i);
        String[] stuInfo =
                {list.get(i).getProjetName(),list.get(i).getProjectInfo(),list.get(i).getPayUnit(),
                        String.valueOf(list.get(i).getTotalMoney()),dateFormat.format(list.get(i).getGatherDate()),list.get(i).getGatherNote()};
        for (int j = 0; j < stuInfo.length; j++) {
            cell = row.createCell(j);
            cell.setCellStyle(tableStyle);
            cell.setCellValue(new HSSFRichTextString(stuInfo[j]));
        }
    }
    // 文件输出流
    workBook.write(response.getOutputStream()); 		//将文档对象写入文件输出流
%>
</body>
</html>
