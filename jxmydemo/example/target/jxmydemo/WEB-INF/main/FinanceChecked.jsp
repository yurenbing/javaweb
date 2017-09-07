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
    <script src="ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerTip.js" type="text/javascript"></script>
    <script src="lib/jquery-validation/jquery.validate.min.js" type="text/javascript"></script>
    <script src="lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
</head>
<body>

<div class="item-main">
    <table>
        <tr>
            <td style="width:5px"></td>
            <td>项目名称:</td>
            <td><input type="text" style="width:100px" class="projetName"></input></td>
            <td style="width:5px"></td>
            <td><input type="button" value="查找" class="l-button" style="width:50px;color:red;" onclick="selectFinanceCheckedInfo()"></input></td>
            <td style="width:5px"></td>
            <td><input type="button" value="刷新" class="l-button" style="width:50px;color:#57b255;" onclick="refreshFinance()"></input></td>
        </tr>
    </table>
    <div class="container" align="center">

        <div id="FinanceChecked"></div>
    </div>
</div>

<script type="text/javascript">


    var financeChecked=$("#FinanceChecked").ligerGrid({
        width:'100%',
        height:'100%',
        rowHeight:30,
        headerRowHeight:30,
        rownumbers: true,

        columns: [
            { display: '操作', isSort: false, width: '5%', render: function
                (rowdata, rowindex, value)
            {
                var h = "";
                if (!rowdata._editing)
                {
                    h += "<a href='javascript:look("+rowdata.checkId+")'>查看</a> ";
                }
                return h;
            }
            },
            { name: 'empOwner', display: '申报人', width: '10%' },
            { name: 'empDep', display: '部门', width: '10%' },
            { name: 'projetName', display: '项目名称', width: '10%' },
            { name: 'projectInfo', display: '项目内容', width: '30%' } ,
            { name: 'projectMoney', display: '项目金额', width: '10%' } ,
            { name: 'projectDate', display: '申报时间', width: '15%' } ,
            { name: 'empCheck', display: '审批人', width: '25%' },
            { name: 'checkInfo', display: '审批意见', width: '25%' },
            { name: 'checkDate', display: '审批日期', width: '25%' },
            { name: 'financeNote', display: '备注', width: '25%' },
        ],
        dataAction:'local',
        url:"selectFinancechecked.do",
    });

    function look(data) {
        var tabid="financeChecked"+data;
        parent.f_addTab(tabid,"财务审批查看","FinanceCheckedForm.jsp?id="+data);
    }

    function refreshFinance() {
        financeChecked.set({url:'selectFinancechecked.do'});
        financeChecked.reload();
    }

    function selectFinanceCheckedInfo() {
        financeChecked.set({url:'selectFinanceCheckedInfo.do?projetName='+$(".projetName").val()});
        financeChecked.reload();
    }

</script>
</body>
</html>