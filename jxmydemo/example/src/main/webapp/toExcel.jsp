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
    <%--ѡ���ļ�:<input type="file" name="file" width="120px">--%>
    <%--<input type="submit" value="�ϴ�">--%>
<%--</form>--%>
<%--<hr>--%>
<%--<form action="exportGather.do" method="get">--%>
    <%--<input type="submit" value="����">--%>
<%--</form>--%>
<%
    out.clear();
    out = pageContext.pushBody();
    response.setHeader("Content-Disposition","attachment;filename=gatherInfo.xls");
    response.setContentType("application/x-download; charset=utf-8");
//    java.util.List<String[]> list = new StuInfoDao().findByAll();
//    IGatherService gatherService;
    List<Jxmy_gatheringinfo> list = new StuInfoDao().findByAll();
    HSSFWorkbook workBook = new HSSFWorkbook();		//���� һ��excel�ĵ�����
    HSSFSheet sheet = workBook.createSheet();			//����һ������������
    SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
    //������ʽ
    HSSFCellStyle titleStyle = workBook.createCellStyle();	//������ʽ����
    titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER_SELECTION);	//ˮƽ����
    titleStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);	//��ֱ����
    // ��������
    HSSFFont titleFont = workBook.createFont();			//�����������
    titleFont.setFontHeightInPoints((short) 15);			//���������С
    titleFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);	//���ô���
    titleFont.setFontName("����");	//����Ϊ������
    titleStyle.setFont(titleFont);
    // �ϲ���Ԫ�����
    sheet.addMergedRegion(new CellRangeAddress(0, 1, 0, 5));
    HSSFRow row = null;
    HSSFCell cell = null;
    row = sheet.createRow(0);
    cell = row.createCell(0);
    cell.setCellStyle(titleStyle);
    cell.setCellValue(new HSSFRichTextString("���̿�������ϸ��"));
    System.out.println("test7");
    // ���ñ�����ʽ
    HSSFCellStyle tableStyle = workBook.createCellStyle();
    tableStyle.setBorderBottom((short)1);
    tableStyle.setBorderTop((short)1);
    tableStyle.setBorderLeft((short)1);
    tableStyle.setBorderRight((short)1);
    tableStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    // ���ñ�������
    HSSFFont tableFont = workBook.createFont();
    tableFont.setFontHeightInPoints((short) 12); 		//���������С
    tableFont.setFontName("����"); 				//����Ϊ������
    tableStyle.setFont(tableFont);
    String[] title = {"��Ŀ����","��Ŀ����","�տλ","������","��������","��ע"};
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
    // �ļ������
    workBook.write(response.getOutputStream()); 		//���ĵ�����д���ļ������
%>
</body>
</html>
