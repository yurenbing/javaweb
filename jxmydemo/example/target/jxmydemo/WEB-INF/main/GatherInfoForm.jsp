<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <link href="${pageContext.request.contextPath}/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/lib/jquery-validation/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
      <script src="../../../lib/ligerUI/js/core/base.js" type="text/javascript"></script>
      <script src="../../..//lib/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
      <script src="../../../lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
      <script src="../../../lib/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
      <script src="../../../lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
      <script src="../../../lib/ligerUI/js/plugins/ligerButton.js" type="text/javascript"></script>
      <script src="../../../lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
      <script src="../../../lib/ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
      <script src="../../../lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
      <script src="../../../lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script> 
      <script src="../../../lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
      <script src="../../../lib/ligerUI/js/plugins/ligerMenu.js" type="text/javascript"></script>
    <script src="../../../lib/json2.js" type="text/javascript"></script>
    <script src="../../../demos/grid/EmployeeData.js" type="text/javascript"></script>
    <script src="../../../demos/grid/DepartmentData.js" type="text/javascript"></script>
    <script src="../../../lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="../../../lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="../../../lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
    <script src="../../../lib/ligerUI/js/plugins/ligerFilter.js" type="text/javascript"></script>
    <script src="../../../lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
    <script src="../../../lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="../../../demos/filter/ligerGrid.showFilter.js" type="text/javascript"></script>
    <style type="text/css">
        html{
            background-color:#fff;
        }
        td{
            border:1px solid;
        }
        .line{
            height:40px;
        }
    </style>
    <%
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd ");
        Date current=new Date();
        String time=dateFormat.format(current);
    %>
</head>
<body>
<div class="line"></div>
<form action="insertGatherInfo.do"  method="post" id="GatherInfoForm" enctype="multipart/form-data">
    <p style="text-align: center;">
        <strong style="text-align: -webkit-center; white-space: normal;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="font-size: 24px;">工程款入账明细表</span> &nbsp; &nbsp; &nbsp;</strong>
    </p>
    <table style="width:720px;border:1px solid;border-collapse: collapse;" data-sort="sortDisabled" align="center">
        <tbody>
        <tr>
            <td align="center" colspan="1" rowspan="1" style="word-break: break-all;">
                <strong>项目名称</strong>
            </td>
            <td align="center" colspan="1" rowspan="1" style="word-break: break-all;">
                <strong><input type="text" style="width:98%;" class="wf_field projetName" name="projetName" otype="textfield" odata="{&#39;dataType&#39;:&#39;str&#39;,&#39;style&#39;:&#39;&#39;,&#39;width&#39;:&#39;100&#39;}" maxlength="undefined"/></strong>
            </td>
            <td align="center" colspan="1" rowspan="1" style="word-break: break-all;">
                <strong><strong style="text-align: -webkit-center; white-space: normal;">付款单位</strong></strong>
            </td>
            <td align="center" colspan="1" rowspan="1" style="word-break: break-all;">
                <strong><input type="text" class="wf_field projectMoney" name="payUnit" otype="select" odata="{&#39;dataType&#39;:&#39;str&#39;,&#39;dataItems&#39;:[{&#39;name&#39;:&#39;ͬ��&#39;,&#39;value&#39;:&#39;&#39;},{&#39;name&#39;:&#39;��ͬ��&#39;,&#39;value&#39;:&#39;&#39;}],&#39;width&#39;:&#39;100&#39;,&#39;style&#39;:&#39;0&#39;}" style="white-space: normal; width: 98%;"/></strong>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="1" rowspan="1" style="word-break: break-all;">
                <strong>收款金额</strong>
            </td>
            <td align="center" colspan="1" rowspan="1" style="word-break: break-all;">
                <strong><input type="text" style="width:98%;" class="wf_field projetName" name="totalMoney" otype="textfield" odata="{&#39;dataType&#39;:&#39;str&#39;,&#39;style&#39;:&#39;&#39;,&#39;width&#39;:&#39;100&#39;}" maxlength="undefined"/></strong>
            </td>
            <td align="center" colspan="1" rowspan="1" style="word-break: break-all;">
                <strong><strong style="text-align: -webkit-center; white-space: normal;">收款日期</strong></strong>
            </td>
            <td align="center" colspan="1" rowspan="1" style="word-break: break-all;">
                <strong><input type="text" value="<%=time%>" class="wf_field projectMoney" name="gatherDate" otype="select" odata="{&#39;dataType&#39;:&#39;str&#39;,&#39;dataItems&#39;:[{&#39;name&#39;:&#39;ͬ��&#39;,&#39;value&#39;:&#39;&#39;},{&#39;name&#39;:&#39;��ͬ��&#39;,&#39;value&#39;:&#39;&#39;}],&#39;width&#39;:&#39;100&#39;,&#39;style&#39;:&#39;0&#39;}" style="white-space: normal; width: 98%;"/></strong>
            </td>
        </tr>
        <tr>
            <td width="174" style="word-break: break-all;" align="center">
                <strong>项目内容</strong>
            </td>
            <td rowspan="1" colspan="3">
                <textarea name="projectInfo" rows="5" style="width: 99.8%;height:100%;"></textarea>
            </td>
        </tr>
        <tr>
            <td width="174" style="word-break: break-all;" align="center">
                <strong>备注</strong>
            </td>
            <td rowspan="1" colspan="3">
                <textarea rows="5" style="width: 100%;height: 100%" name="gatherNote" readonly="readonly"></textarea>
            </td>
        </tr>
        </tbody>
    </table>
    <p>
        <br/>
    </p>
    <table align="center">
        <tr>
            <td style="border:none"><input type="submit" value="提交" class="l-button" style="width:70px;color:red;font-size:10px"></input></td>
        </tr>
    </table>
</form>

</body>
</html>