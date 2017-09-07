﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
	<link href="lib/ligerUI/skins/Aqua/css/ligerui-all-2.css" rel="stylesheet" type="text/css"> 
    <link href="lib/ligerUI/skins/Gray/css/all-2.css" rel="stylesheet" type="text/css"> 
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
    <script src="lib/ligerUI/js/plugins/ligerTip.js" type="text/javascript"></script>
    <script src="lib/jquery-validation/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="lib/jquery-validation/messages_cn.js" type="text/javascript"></script>	
    <script src="lib/date.js"></script>
	<script src="/scripts/2bc/_gg_980_90.js" type="text/javascript"></script>
	<script type="text/javascript"> 
		  
		  $(function(){
			var Linkdata = [ 
			{ MailSender: '经理', MainTitle: '工作总结书写规范' },
			
			]; 
	              $("#InBox").ligerGrid({
	                width:'92%', 
				height:'100%',
				rowHeight:30,
				headerRowHeight:30,
			columns: [ 
				{ name: 'MailSender', display: '发送人', width: 180 }, 
				{ name: 'MainTitle', display: '标题', width: 300 } 
				
			], 
			data: { Rows: Linkdata } ,
			
	              });
			  var Noticedata = [ 
			{ Notice1: '<a >需要大家注意的事项</a>' }
			
			]; 
			  
			  $("#Notice").ligerGrid({
	                width:'90%', 
				height:'100%',
				rowHeight:30,
				headerRowHeight:30,
			columns: [ 
				{ name: 'Notice1', display: '公告', width: 380 }
				
			], 
			data: { Rows: Noticedata } ,
			
	              });
	          });
	</script> 
    <style>
        *{
            margin: 0;
            padding: 0;
            list-style: none;
            border: none;
        }
        body
        {
            background: #fff;
        }
        .content
        {
            border: 3px solid #ddd;
            width: 405px;
            margin: 0px auto;
        }
        .datetable
        {
            border-top: 1px solid #ccc;
            border-left: 1px solid #ccc;
            background: #fff;
        }
        .datetable td
        {
            border-bottom: 1px solid #ccc;
            border-right: 1px solid #ccc;
            text-align: center;
        }
        .datetable thead
        {
            background: #3B7CBA;
        }
        .datetable thead td
        {
            padding: 10px 5px;
            font: normal 12px/normal 'microsoft yahei';
            color: #fff;
            text-align: center;
        }
        .datetable thead td span
        {
            padding: 0 5px;
        }
        .datetable tbody td
        {
            padding: 5px 3px;
            font-size: 12px;
        }
		table{
			align:center;
		}
		td{
			padding:5px;
			text-align:center;
		}
		#centerDiv{
			position:absolute;
			left:50%;
			margin-left:-510px;
		}
    </style>
</head>
<body onload="initial();">
	<div style="width:1020px;height:500px;" id="centerDiv">
	<div style="display:block;height:20px;width:1020px"></div>
	<table>
		<tr>
			<td style="width:20px"></td>
			<td style="width:20px"></td>
			<td style="vertical-align:top;">
			
				<img src="images/default.png"></img></br><a href="www.baidu.com">点此进入江西六丰信息科技有限公司官网</a>
				</br>
				</br>
				</br>
				</br>
				<iframe width="214" height="60" scrolling="no" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=42&icon=1&num=3"></iframe>
			</td>
			<td style="width:20px"></td>
			<td style="width:20px"></td>
			<td style="width:20px"></td>
			<td style="width:20px"></td>
			<td>
				<form name="CLD" class="content">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="datetable">
        <thead>
            <tr>
                <td colspan="7">
                    <span>公历</span>
                    <select name="SY" onchange="changeCld();" style="font-size: 9pt">
                        <script>
                            for (i = 1900; i < 2050; i++) document.write('<option>' + i);
                        </script>
                    </select><span>年</span>
                    <select name="SM" onchange="changeCld();" style="font-size: 9pt">
                        <script>
                            for (i = 1; i < 13; i++) document.write('<option>' + i);
                        </script>
                    </select><span>月</span> </font><span id="GZ"></span>
                </td>
            </tr>
        </thead>
        <tbody>
            <tr style="background: #eee;">
                <td width="54">
                    日
                </td>
                <td width="54">
                    一
                </td>
                <td width="54">
                    二
                </td>
                <td width="54">
                    三
                </td>
                <td width="54">
                    四
                </td>
                <td width="54">
                    五
                </td>
                <td width="54">
                    六
                </td>
            </tr>
            <script>
                var gNum;
                for (i = 0; i < 6; i++) {
                    document.write('<tr align="center">');
                    for (j = 0; j < 7; j++) {
                        gNum = i * 7 + j;
                        document.write('<td id="GD' + gNum + '"><font id="SD' + gNum + '" size=2 face="Arial Black"');
                        if (j == 0) document.write('color="red"');
                        if (j == 6) document.write('color="#000080"');
                        document.write('></font><br/><font id="LD' + gNum + '" size=2 style="font-size:9pt"></font></td>');
                    }
                    document.write('</tr>');
                }
            </script>
        </tbody>
    </table>
    </form>
			
		</tr>
	</table>
	<div style="display:block;height:30px;width:1020px"></div>
	<table>
		<tr>
			<td style="width:20px"></td>
			<td style="width:20px"></td>
			<td style="width:20px"></td>
			<td style="width:20px"></td>
			<td>
				<div style="width:381px;height:30px;text-align:left;color:#3B7CBA;border-top:4px solid #3B7CBA">公告</div>
				<div id="Notice" style="width:20px;height:30px;"></div>
			</td>
			<td>
				<div style="width:483px;height:30px;text-align:left;color:#3B7CBA;border-top:4px solid #3B7CBA">收件箱</div>
				<div id="InBox" style="width:20px;height:30px;"></div>
			</td>
			
		</tr>
	</table>
	</div>
</body>
</html>
