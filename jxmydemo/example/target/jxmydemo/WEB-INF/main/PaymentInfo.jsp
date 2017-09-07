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
<style type="text/css">

</style>

<div class="item-main">
    <table>
        <tr>
            <td style="width:5px"></td>
            <td>项目名称:</td>
            <td><input type="text" style="width:100px" class="projetName"></input></td>
            <td style="width:5px"></td>
            <td><input type="button" value="查找" class="l-button" style="width:50px;color:red;" onclick="selectPayment()"></input></td>
            <td style="width:5px"></td>
            <td><input type="button" value="刷新" class="l-button" style="width:50px;color:#57b255;" onclick="refreshPayment()"></input></td>
        </tr>
    </table>
    <div class="container" align="center">

        <div id="PaymentInfo"></div>
    </div>
</div>

<script type="text/javascript">
        var payment=$("#PaymentInfo").ligerGrid({
            width:'100%',
            height:'100%',
            rowHeight:30,
            headerRowHeight:30,
            rownumbers: true,

            columns: [
                { display: '操作', isSort: false, width: 120, render: function
                    (rowdata, rowindex, value)
                {
                    var h = "";
                    if (!rowdata._editing)
                    {
                        h += "<a href='javascript:showInfo("+rowdata.paymentId+")'>查看</a> ";
                        h += "<a href='javascript:updateInfo("+rowdata.paymentId+")'>修改</a> ";
                    }
                    return h;
                }
                },
                { name: 'projetName', display: '项目名称', width: 180 },
                { name: 'projectInfo', display: '项目内容', width: 180 } ,
                { name: 'gatherUnit', display: '收款单位', width: 180 } ,
                { name: 'totalMoney', display: '付款金额', width: 180 } ,
                { name: 'paymentDate', display: '付款日期', width: 180 } ,
                { name: 'paymentNote', display: '备注', width: 180 },
            ],
            dataAction:'local',
            url:"selectPaymentAll.do",
        });

        function refreshPayment() {
            payment.set({url:'selectPaymentAll.do'});
            payment.reload();
        }

        function selectPayment() {
            payment.set({url:'selectPaymentInfo.do?projetName='+$(".projetName").val()});
            payment.reload();
        }

        function showInfo(data) {
            var tabid="paymentInfo"+data;
            parent.f_addTab(tabid,"工程款支付明细查看","ShowPaymentInfoForm.jsp?id="+data);
        }

        //更新信息
        function updateInfo(data) {
            var tabid="updatePaymentInfo"+data;
            parent.f_addTab(tabid,"工程款支付明细修改","UpdatePaymentInfo.jsp?id="+data);
        }

</script>
</body>
</html>