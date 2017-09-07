<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
    <script src="lib/ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script> 
	<script src="lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script> 
    <script src="lib/ligerUI/js/plugins/ligerTip.js" type="text/javascript"></script>
    <script src="lib/jquery-validation/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
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
</head>
<body>
<div class="line"></div>
<form id="formcheck">
	<p style="text-align: center;">
    <strong style="text-align: -webkit-center; white-space: normal;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="font-size: 24px;">财务申请单</span> &nbsp; &nbsp; &nbsp;</strong>
</p>
<table style="width:720px;border:1px solid;border-collapse: collapse;" data-sort="sortDisabled" align="center">
    <tbody>
    <input name="checkId" class="checkId" style="display: none">
    <tr class="firstRow">
        <td width="174" style="word-break: break-all;" align="center">
            <strong>姓名</strong>
        </td>
        <td width="206" style="word-break: break-all;">
            <input type="text" class="wf_field empOwner" readonly="readonly" name="empOwner" otype="macro" value="" style="width:98%;border-width:" odata="{&#39;dataType&#39;:&#39;loginname&#39;,&#39;width&#39;:&#39;150&#39;,&#39;height&#39;:&#39;200&#39;,&#39;style&#39;:&#39;&#39;}"/>
        </td>
        <td width="142" style="word-break: break-all;" align="center">
            <strong>部门</strong>
        </td>
        <td width="174" style="word-break: break-all;">
            <input type="text" class="wf_field empDep" readonly="readonly" name="empDep" otype="macro" style="width:98%;border-width:" odata="{&#39;dataType&#39;:&#39;logindept&#39;,&#39;width&#39;:&#39;150&#39;,&#39;height&#39;:&#39;16&#39;,&#39;style&#39;:&#39;&#39;}"/>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="1" rowspan="1" style="word-break: break-all;">
            <strong>项目名称</strong>
        </td>
        <td align="center" colspan="1" rowspan="1" style="word-break: break-all;">
            <strong><input type="text" style="width:98%;" readonly="readonly" class="wf_field projetName" name="projetName" otype="textfield" odata="{&#39;dataType&#39;:&#39;str&#39;,&#39;style&#39;:&#39;&#39;,&#39;width&#39;:&#39;100&#39;}" maxlength="undefined"/></strong>
        </td>
        <td align="center" colspan="1" rowspan="1" style="word-break: break-all;">
            <strong><strong style="text-align: -webkit-center; white-space: normal;">项目金额</strong></strong>
        </td>
        <td align="center" colspan="1" rowspan="1" style="word-break: break-all;">
            <strong><input type="text" class="wf_field projectMoney" readonly="readonly" name="projectMoney" otype="select" odata="{&#39;dataType&#39;:&#39;str&#39;,&#39;dataItems&#39;:[{&#39;name&#39;:&#39;ͬ��&#39;,&#39;value&#39;:&#39;&#39;},{&#39;name&#39;:&#39;��ͬ��&#39;,&#39;value&#39;:&#39;&#39;}],&#39;width&#39;:&#39;100&#39;,&#39;style&#39;:&#39;0&#39;}" style="white-space: normal; width: 98%;"/></strong>
        </td>
    </tr>
    <tr>
        <td width="174" style="word-break: break-all;" align="center">
            <strong>申报时间</strong>
        </td>
        <td style="word-break: break-all;" rowspan="1" colspan="3">
            <strong>
                <input type="text" class="wf_field projectDate"  readonly="readonly" name="projectDate"  otype="select" odata="{&#39;dataType&#39;:&#39;str&#39;,&#39;dataItems&#39;:[{&#39;name&#39;:&#39;ͬ��&#39;,&#39;value&#39;:&#39;&#39;},{&#39;name&#39;:&#39;��ͬ��&#39;,&#39;value&#39;:&#39;&#39;}],&#39;width&#39;:&#39;100&#39;,&#39;style&#39;:&#39;0&#39;}" style="white-space: normal; width: 35%;" readonly="readonly"/>
            </strong>
        </td>
    </tr>
    <tr>
        <td width="174" style="word-break: break-all;" align="center">
            <strong>项目内容</strong>
        </td>
        <td rowspan="1" colspan="3">
            <textarea name="projectInfo" rows="5" style="width: 99.8%;height:100%;" readonly="readonly" class="projectInfo"></textarea>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="1" rowspan="1" style="word-break: break-all;">
            <strong>财务审核意见</strong>
        </td>
        <td align="center" colspan="1" rowspan="1" style="word-break: break-all;" disabled="disabled">
            <strong>
                <input name="checkInfo" class="checkInfo" style="width: 98%;"></input>
            </strong>
        </td>
        <td align="center" colspan="1" rowspan="1" style="word-break: break-all;">
            <strong><strong style="text-align: -webkit-center; white-space: normal;">审核人</strong></strong>
        </td>
        <td align="center" colspan="1" rowspan="1" style="word-break: break-all;">
            <strong><input type="text" class="wf_field empCheck" name="empCheck" otype="select" odata="{&#39;dataType&#39;:&#39;str&#39;,&#39;dataItems&#39;:[{&#39;name&#39;:&#39;ͬ��&#39;,&#39;value&#39;:&#39;&#39;},{&#39;name&#39;:&#39;��ͬ��&#39;,&#39;value&#39;:&#39;&#39;}],&#39;width&#39;:&#39;100&#39;,&#39;style&#39;:&#39;0&#39;}" style="white-space: normal; width: 98%;"  readonly="readonly"/></strong>
        </td>
    </tr>
    <tr>
        <td width="174" style="word-break: break-all;" align="center">
            <strong>审核日期</strong>
        </td>
        <td style="word-break: break-all;" rowspan="1" colspan="3">
            <strong>
                <input type="text" class="wf_field checkDate" name="checkDate"  otype="select" odata="{&#39;dataType&#39;:&#39;str&#39;,&#39;dataItems&#39;:[{&#39;name&#39;:&#39;ͬ��&#39;,&#39;value&#39;:&#39;&#39;},{&#39;name&#39;:&#39;��ͬ��&#39;,&#39;value&#39;:&#39;&#39;}],&#39;width&#39;:&#39;100&#39;,&#39;style&#39;:&#39;0&#39;}" style="white-space: normal; width: 35%;"  readonly="readonly"/>
            </strong>
        </td>
    </tr>
    <tr>
        <td width="174" style="word-break: break-all;" align="center">
            <strong>备注</strong>
        </td>
        <td rowspan="1" colspan="3">
            <textarea rows="5" style="width: 100%;height: 100%" name="financeNote" readonly="readonly" class="financeNote"></textarea>
        </td>
    </tr>
    </tbody>
</table>
<p>
    <br/>
</p>
</form>

<script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            type:"get",
            data:{
                checkId:${param.id},
            },
            datatype:"text",
            url:"selectFinancecheckByPrimaryKey.do",
            success:function (data) {
                alert(data);
                var info=JSON.parse(data);
                $(".checkId").val(info.checkId);
                $(".empOwner").val(info.empOwner);
                $(".empDep").val(info.empDep);
                $(".projetName").val(info.projetName);
                $(".projectInfo").val(info.projectInfo);
                $(".projectMoney").val(info.projectMoney);
                $(".projectDate").val(date(info.projectDate));
                $(".empCheck").val(info.empCheck);
                $(".checkInfo").val(info.checkInfo);
                if(typeof(info.checkDate) == "undefined"){
                    $(".checkDate").val("");
                }else {
                    $(".checkDate").val(date(info.checkDate));
                }
                $(".financeNote").val(info.financeNote);
            }
        });

        function date(date) {
            var d=new Date(date);
            var year=d.getFullYear();
            var mouth=d.getMonth()+1;
            var day=d.getDate();
            var result=year+"-"+(mouth<10?"0"+mouth:mouth)+"-"+(day<10?"0"+day:day);
            return result;
        }
    });
</script>
</body>
</html>