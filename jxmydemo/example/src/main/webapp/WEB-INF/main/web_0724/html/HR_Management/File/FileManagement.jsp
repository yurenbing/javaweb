<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link href="${pageContext.request.contextPath}/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css">
	<script src="${pageContext.request.contextPath}/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/lib/ligerUI/js/ligerui.all.js"></script>
	<script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerRadioList.js"></script>
    <script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerListBox.js"></script>
	<script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerFilter.js"></script>
    <script src="${pageContext.request.contextPath}/data/CustomersData2.js"></script>
    <script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
    <style type="text/css">
	body{
		text-align:center
		}
	.l-button{
		      width:900px; 
			  }	
	#domain{
				width:100%;
				height:80%}
	a{
		text-decoration:none;
	}
    </style>
</head>
<body>
<div class="l-loading" style="display:block" id="pageloading"></div>
 <a class="l-button" style="width:120px;float:left; margin-left:10px; display:none;" onClick="deleteRow()">删除选择的行</a>
 <div class="l-clear"></div>
 	<div style="margin:5px 5px 5px 5px">
        <table class="select">
            <tr>
                <td>姓名：</td>
                <td><input type="text" style="width:100px" class="empNameFind"></input></td>
                <td>性别：</td>
                <td>
                    <select class="empGenderFind">
                        <option value="男" selected="selected">男</option>
                        <option value="女">女</option>
                    </select>
                </td>
                <td>部门：</td>
                <td>
                    <select class="empDeptFind">
                        <option value="1" selected="selected">人事部</option>
                        <option value="2">财务部</option>
                        <option value="3">经营部</option>
                    </select>
                </td>
                <td>
                    <a class="l-button" style="width:50px;float:left; margin-left:6px; margin-top: 5px; color: red; font-size:15px" onclick="selectFindInfo()">查询</a>
                <td>
            </tr>
        </table>
    	<table class="select">
   			<tr>
				<td>
                	<a class="l-button" style="width:50px;float:left; margin-left:6px;  margin-top: 5px; color:#57b255; font-size:15px" onClick="refreshData()">刷新
                    </a>
                </td>
				<td>  
                	<a class="l-button" style="width:50px;float:left; margin-left:6px; margin-top: 5px; color:red; font-size:15px" onClick="deleteEmployee()">删除
                    </a>
                </td>
            </tr>
    </table>
  
    </div>
    <div id="domain"></div>
    
  <div style="display:none;"></div>


    </div>
</div>

</body>
</html>
<script type="text/javascript">

            $(".select").ligerForm();

                window['g'] = $.ligerui.defaults.Grid.headerRowHeight = 30;
                var employee=$("#domain").ligerGrid({
                    wdith:80,
                    height:50,
                    columns: [
                        { display: '操作', isSort: false, width: 120, render: function
                            (rowdata, rowindex, value)
                        {
                            var h = "";
                            if (!rowdata._editing)
                            {
                                h += "<a href='javascript:showInfo("+rowdata.empId+")'>查看</a> ";
                                h += "<a href='javascript:updateInfo("+rowdata.empId+")'>修改</a> ";
                            }
                            return h;
                        }
                        },
                        { display: '姓名', name: 'empName',  width: 50,align: 'center' },
                        { display: '性别', name: 'empGender', width: 30,align: 'center' },
                        { display: '编号', name: 'empNumber', width: 100,align: 'center' },
                        { display: '身份证', name: 'empIdnumber', width: 100, align: 'center' },
                        { display: '出生日期', name: 'empBirth', width: 100, align: 'center',type:'date',format:'yyyy-mm-dd HH:mm:ss' },
                        { display: '民族', name: 'empNation', width: 100, align: 'center' },
                        { display: '专业', name: 'empMaster', width: 100, align: 'center' },
                        { display: '政治面貌', name: 'empPoliticalstatus', width: 100, align: 'center' },
                        { display: '入党时间', name: 'empPartytime', width: 100, align: 'center' },
                        { display: '入团时间', name: 'empLeaguetime', width: 100, align: 'center' },
                        { display: '户口类型', name: 'empHukoutype', width: 100, align: 'center' },
                        { display: '员工类型', name: 'empTpye', width: 100, align: 'center' },
                        { display: '毕业时间', name: 'empGraduationtime', width: 100, align: 'center' },
                    ],
                    url:"selectAll.do",
                    pageSize:20,
                    height:'100%',
                    enabledEdit :true,
                    checkbox:true,
                    dataAction:'local',
                    dateFormat: "yyyy-MM-dd hh:mm:ss",
                    onCheckRow:f_onCheckRow,
                });

                function refreshData() {
                    employee.set({url:'selectAll.do'});
                    employee.reload();
                }

                function selectFindInfo() {
                    employee.set({url:'selectInfo.do?empName='+$(".empNameFind").val()+'&empGender='+$(".empGenderFind").val()+'&empDeptid='+$(".empDeptFind").val()});
                    employee.reload();
                }

                //查看详细信息
                function showInfo(data) {
                    var tabid="employeeInfo"+data;
                    parent.f_addTab(tabid,"人员基本信息查看","$SearchEmployee.jsp?id="+data);
                }

                //更新信息
                function updateInfo(data) {
                    var tabid="updateEmployeeInfo"+data;
                    parent.f_addTab(tabid,"人员信息修改","UpdateEmployee.jsp?id="+data);
                }

                function f_onCheckRow(checked,data,rowid,rowdata){
                    if(checked){
                       alert(data.empId);
                    }
                }

                function deleteEmployee() {
                    var rows=employee.getCheckedRows();
                    $(rows).each(function () {
                        alert(this.empId);
                        $.ajax({
                            type:"get",
                            url:"/deleteEmployee.do",
                            data:{
                                empId:this.empId,
                            },
                            success:function (data) {
                                alert(data);
                            }
                        });
                    });
                }

                $("#pageloading").hide();


 </script>
 
 