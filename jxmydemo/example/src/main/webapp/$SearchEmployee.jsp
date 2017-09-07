<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script type='text/javascript'>
        $(document).ready(function () {
            $.ajax({
                type:"get",
                url:"/selectEmployeeInfo.do",
                datatype:"text",
                data:{
                    empId:${param.id},
                },
                success:function (data) {
                    var info=JSON.parse(data);
                    $("#imgs").attr("src",info.empPhotourl);
                    $("#empName").html(info.empName);
                    $("#empGender").html(info.empGender);
                    $("#empNative").html(info.empNative);
                    $("#empNumber").html(info.empNumber);
                    $("#empIdnumber").html(info.empIdnumber);
                    if (info.empDeptid==1){
                        $("#empDeptid").html("人事部");
                    }else if(info.empDeptid==2){
                        $("#empDeptid").html("财务部");
                    }else if(info.empDeptid==3){
                        $("#empDeptid").html("经营部");
                    }
                    $("#empDeptid").html(info.empDeptid);
                    $("#empNation").html(info.empNation);
                    $("#empBirth").html(date(info.empBirth));
                    $("#empPoliticalstatus").html(info.empPoliticalstatus);
                    $("#empPartytime").html(date(info.empPartytime));
                    $("#empLeaguetime").html(date(info.empLeaguetime));
                    $("#empHiredate").html(date(info.empHiredate));
                    $("#empHukoutype").html(info.empHukoutype);
                    $("#empHukoulocation").html(info.empHukoulocation);
                    $("#empTpye").html(info.empTpye);
                    if (info.empTitle==1000){
                        $("#empTitle").html("助理");
                    }else if(info.empTitle==1001){
                        $("#empTitle").html("普通员工");
                    }else if(info.empTitle==1002){
                        $("#empTitle").html("主任");
                    }
                    $("#empSecuritynumber").html(info.empSecuritynumber);
                    $("#empPosition").html(info.empPosition);
                    $("#empMobilephone").html(info.empMobilephone);
                    $("#empPhone").html(info.empPhone);
                    $("#empQq").html(info.empQq);
                    $("#empHomeaddr").html(info.empHomeaddr);
                    $("#empAddr").html(info.empAddr);
                    $("#empEducationallevel").html(info.empEducationallevel);
                    $("#empDegree").html(info.empDegree);
                    $("#empGraduationtime").html(date(info.empGraduationtime));
                    $("#empGraduationschool").html(info.empGraduationschool);
                    $("#empMaster").html(info.empMaster);
                    $("#empComputerlevel").html(info.empComputerlevel);
                    $("#empLanguage1").html(info.empLanguage1);
                    $("#empLanguage2").html(info.empLanguage2);
                    $("#empLanguage3").html(info.empLanguage3);
                    $("#empSpecialties").html(info.empSpecialties);
                    $("#empStatus").html(info.empStatus);
                    $("#empSocialsecurity").html(info.empSocialsecurity);
                    $("#empSecuritynumber").html(info.empSecuritynumber);
                    $("#empSalary").html(info.empSalary);
                },
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
</head>

<body class="bodycolor" topmargin="5">
<div style="height: 20px;display: block"></div>

<table class="TableBlock" width="70%" align="center" style="border: solid 1px" id="employeeInfo">
    <tr>
        <td nowrap class="TableHeader " colspan="6" style="border: solid 1px"><b>&nbsp;基本信息</b></td>
    </tr>
    <tr id="content">
        <td nowrap align="left"   class="TableContent" style="border: solid 1px">姓名</td>
        <td nowrap align="left" class="TableData" id="empName" width="180" style="border: solid 1px"></td>
        <td nowrap align="left" class="TableContent" style="border: solid 1px">部门</td>
        <td class="TableData" id="empDeptid" colspan="2"></td>
        <td class="TableData" align="center" rowspan="6" colspan="1">
            <center><img src="" id="imgs" height="100%" width="100%"></center>
        </td>
    </tr>
    <tr>
        <td nowrap align="left" width="120" class="TableContent">编号</td>
        <td nowrap align="left" id="empNumber" class="TableData" width="180"></td>
        <td nowrap align="left" width="120" class="TableContent">出生日期</td>
        <td class="TableData" width="180" colspan="2" id="empBirth"></td>
    </tr>
    <tr>
        <td nowrap align="left" width="120" class="TableContent">性别</td>
        <td class="TableData" width="180" id="empGender">男</td>
        <td nowrap align="left" width="120" class="TableContent">员工类型</td>
        <td class="TableData" width="180" colspan="2" id="empTpye"></td>
    </tr>
    <tr>
        <td nowrap align="left" width="120" class="TableContent">身份证号</td>
        <td class="TableData" width="180" id="empIdnumber" ></td>
        <td nowrap align="left" width="120" class="TableContent">民族</td>
        <td class="TableData" width="180" colspan="2" id="empNation"></td>
    </tr>
    <tr>
        <td nowrap align="left" width="120" class="TableContent">政治面貌</td>
        <td class="TableData" width="180" id="empPoliticalstatus"></td>
        <td nowrap align="left" width="120" class="TableContent">入党时间</td>
        <td class="TableData" width="180" colspan="2" id="empPartytime"></td>
    </tr>
    <tr>
        <td nowrap align="left" width="120" class="TableContent">籍贯</td>
        <td class="TableData" width="180" id="empNative"></td>
        <td nowrap align="left" width="120" class="TableContent">入团时间</td>
        <td class="TableData" width="180" colspan="2" id="empLeaguetime"></td>
    </tr>
    <tr>
        <td nowrap align="left" width="120" class="TableContent">户口类别</td>
        <td class="TableData"  width="180" id="empHukoutype"></td>
        <td nowrap align="left" width="120" class="TableContent">户口所在地</td>
        <td class="TableData"  width="180" colspan="3" id="empHukoulocation"></td>
    </tr>
    <tr>
        <td nowrap class="TableHeader" colspan="6"><b>&nbsp;人员扩展信息</b></td>
    </tr>
    <tr>
    <td nowrap align="left" class="TableContent" >社保号</td>
    <td colspan="5" class="TableData" id="empSecuritynumber"></td>
    </tr>
    <tr>
        <td nowrap align="left" class="TableContent" >社保缴纳情况</td>
        <td colspan="5" class="TableData" id="empSocialsecurity"></td>
    </tr>
    <tr>
    <td nowrap class="TableHeader" colspan="6"><b>&nbsp;职位情况及联系方式</b></td>
    </tr>
    <tr>
        <td nowrap align="left" width="120" class="TableContent">入职时间</td>
        <td class="TableData" colspan="6" id="empHiredate"></td>
    </tr>
    <tr>
        <td nowrap align="left" width="120" class="TableContent">职务</td>
        <td class="TableData"  width="180" id="empTitle"></td>
        <td nowrap align="left" width="120" class="TableContent">职称</td>
        <td class="TableData"  width="180" id="empPosition"></td>
        <td nowrap align="left" width="120" class="TableContent">薪水</td>
        <td class="TableData"  width="180" id="empSalary"></td>
    </tr>
    <tr>
        <td nowrap align="left" width="120" class="TableContent">手机号码</td>
        <td class="TableData"  width="180" id="empMobilephone"></td>
        <td nowrap align="left" width="120" class="TableContent">联系电话</td>
        <td class="TableData"  width="180" id="empPhone"></td>
        <td nowrap align="left" width="120" class="TableContent">QQ</td>
        <td class="TableData"  width="180" id="empQq"></td>
    </tr>
    <tr>
        <td nowrap align="left" width="120" class="TableContent">家庭地址</td>
        <td class="TableData"  width="180" colspan="5" id="empHomeaddr"></td>
    </tr>
    <tr>
        <td nowrap align="left" width="120" class="TableContent">联系地址</td>
        <td class="TableData"  width="180" colspan="5" id="empAddr"></td>
    </tr>
    <tr>
        <td nowrap class="TableHeader" colspan="6"><b>&nbsp;教育背景</b></td>
    </tr>
    <tr>
        <td nowrap align="left" width="120" class="TableContent">学历</td>
        <td class="TableData"  width="180" id="empEducationallevel"></td>
        <td nowrap align="left" width="120" class="TableContent">学位</td>
        <td class="TableData"  width="180" id="empDegree"></td>
        <td nowrap align="left" width="120" class="TableContent">毕业时间</td>
        <td class="TableData"  width="180" id="empGraduationtime"></td>
    </tr>
    <tr>
        <td nowrap align="left" width="120" class="TableContent" id="empGraduationschool">毕业学校</td>

        <td class="TableData"  width="180"></td>

        <td nowrap align="left" width="120" class="TableContent" id="empMaster">专业</td>

        <td class="TableData"  width="180"></td>

        <td nowrap align="left" width="120" class="TableContent" id="empComputerlevel">计算机水平</td>

        <td class="TableData"  width="180"></td>

    </tr>

    <tr>

        <td nowrap align="left" width="120" class="TableContent">外语语种1</td>

        <td class="TableData"  width="180" id="empLanguage1"></td>

        <td nowrap align="left" width="120" class="TableContent">外语语种2</td>

        <td class="TableData"  width="180" id="empLanguage2"></td>

        <td nowrap align="left" width="120" class="TableContent">外语语种3</td>

        <td class="TableData"  width="180" id="empLanguage3"></td>

    </tr>

    <tr>

        <td nowrap align="left" width="120" class="TableContent">特长</td>

        <td class="TableData"  width="180"  colspan="5" id="empSpecialties"></td>

    </tr>

    <tr>

        <td nowrap align="left" colspan="1" class="TableHeader">职务情况</td>
        <td colspan="5" class="TableData" id="empStatus"></td>

    </tr>

</table>

<div style="height: 20px;display: block"></div>
<style type="text/css">
    body{padding:0;margin:0;}
    td{
        border: solid 1px;
    }
    table{
        border-collapse: collapse;
    }
    #ipadtbar{height:30px; background: -webkit-gradient(linear, left top, left bottom, from(#F5F6F8), to(#DDDDDD));line-height:30px;text-indent:10px;margin-bottom:10px;}
</style>
</body>

</html>