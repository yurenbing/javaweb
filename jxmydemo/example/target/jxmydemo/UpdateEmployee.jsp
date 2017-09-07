<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link href="${pageContext.request.contextPath}/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css">
      <script src="${pageContext.request.contextPath}/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
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
    <style type="text/css">
        * {
            font-size:12px;
            margin:0;
            padding:0;
        }
        fieldset.myField {
            padding:10px;
            margin:10px;
            width:50%;
            color:#333;
            border:#06c solid 1px;
            text-align:right;
        }
        legend {
            color:#06c;
            padding:5px 10px;
            font-weight:800;
            /*background:white;*/
        }
        .c_f1_top_l{
            float:left;
        }
        .c
        .c_f1_top_l input{	margin:5px 5px 5px 5px;
            width:120px;}/*控制文本框的上下左右的边*/
        select{margin: 5px 5px 5px 5px;
            width:120px}
        b{font-family:Verdana, Geneva, sans-serif;
            color:#999;
        }
        .iType{
            margin:5px 5px 5px 5px;
        }
        .iType2{
            margin: 5px 5px 5px 5px;
            width:135px
        }

    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            alert(${param.id});
           $.ajax({
               type:"get",
               url:"/selectEmployeeInfo.do",
               datatype:"text",
               data:{
                   empId:${param.id},
               },
               success:function (data) {
                   alert(data);
                   var info=JSON.parse(data);
                   $("#photo").attr("src",info.empPhotourl);
                   $(".empId").val(info.empId);
                   $(".empName").val(info.empName);
                   $(".empGender").val(info.empGender);
                   $(".empNative").val(info.empNative);
                   $(".empNumber").val(info.empNumber);
                   $(".empIdnumber").val(info.empIdnumber);
                   $(".empDeptid").val(info.empDeptid);
                   $(".empNation").val(info.empNation);
                   $(".empBirth").val(date(info.empBirth));
                   $(".empPoliticalstatus").val(info.empPoliticalstatus);
                   $(".empPartytime").val(date(info.empPartytime));
                   $(".empLeaguetime").val(date(info.empLeaguetime));
                   $(".empHiredate").val(date(info.empHiredate));
                   $(".empHukoutype").val(info.empHukoutype);
                   $(".empHukoulocation").val(info.empHukoulocation);
                   $(".empTpye").val(info.empTpye);
                   $(".empTitle").val(info.empTitle);
                   $(".empPosition").val(info.empPosition);
                   $(".empMobilephone").val(info.empMobilephone);
                   $(".empPhone").val(info.empPhone);
                   $(".empQq").val(info.empQq);
                   $(".empHomeaddr").val(info.empHomeaddr);
                   $(".empAddr").val(info.empAddr);
                   $(".empEducationallevel").val(info.empEducationallevel);
                   $(".empDegree").val(info.empDegree);
                   $(".empGraduationtime").val(date(info.empGraduationtime));
                   $(".empGraduationschool").val(info.empGraduationschool);
                   $(".empMaster").val(info.empMaster);
                   $(".empComputerlevel").val(info.empComputerlevel);
                   $(".empLanguage1").val(info.empLanguage1);
                   $(".empLanguage2").val(info.empLanguage2);
                   $(".empLanguage3").val(info.empLanguage3);
                   $(".empSpecialties").val(info.empSpecialties);
                   $(".empSocialsecurity").val(info.empSocialsecurity);
                   $(".empStatus").val(info.empStatus);
                   $(".empLeavedate").val(date(info.empLeavedate));
                   $(".empSecurity").val(info.empSecurity);
                   $(".empSecuritynumber").val(info.empSecuritynumber);
                   $(".empSalary").val(info.empSalary);
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
        })
    </script>
</head>

<body>
<style type="text/css">
    .block_r{
        float: right;
    }
    .content{
        vertical-align:top;
    }
</style>
<div class="all">
    <form action="/updateEmployee.do" method="post" id="employeeForm" enctype="multipart/form-data">
        <div class="center">
            <div class="domain">
                <fieldset class="myField" style="margin:auto;width: 60%">
                    <legend>人员基本信息:</legend>
                    <div class="c_f1_top_l">
                        <table>
                            <tr>
                                <td>姓名:<input type="text" class="iType empName" id="empName" name="empName"></input></td>
                                <td><input type="text" class="iType empId" id="empId" name="empId" style="display: none;"></input><</td>
                            </tr>
                            <tr>
                                <td>
                                    性别:<select  class="iType2 empGender" name="empGender">
                                    <option value="男" selected="selected">男</option>
                                    <option value ="女">女</option>
                                </select>
                                </td>
                                <td>籍贯:<select class="iType2 empNative" name="empNative">
                                    <option value="北京" selected="selected">北京</option>
                                    <option value ="天津">天津</option>
                                    <option value ="山东">山东</option>
                                    <option value ="山西">山西</option>
                                    <option value ="河北">河北</option>
                                    <option value ="河南">河南</option>
                                    <option value ="辽宁">辽宁</option>
                                    <option value ="黑龙江">黑龙江</option>
                                    <option value ="吉林">吉林</option>
                                    <option value ="内蒙古">内蒙古</option>
                                    <option value ="新疆">新疆</option>
                                    <option value ="西藏">西藏</option>
                                    <option value ="湖北">湖北</option>
                                    <option value ="湖南">湖南</option>
                                    <option value ="安徽">安徽</option>
                                    <option value ="江西">江西</option>
                                    <option value ="江苏">江苏</option>
                                    <option value ="上海">上海</option>
                                    <option value ="浙江">浙江</option>
                                    <option value ="重庆">重庆</option>
                                    <option value ="广西">广西</option>
                                    <option value ="贵州">贵州</option>
                                    <option value ="宁夏">宁夏</option>
                                    <option value ="青海">青海</option>
                                    <option value ="陕西">陕西</option>
                                    <option value ="广东省">广东省</option>
                                    <option value ="福建">福建</option>
                                    <option value ="云南">云南</option>
                                </select></td>
                            </tr>
                            <tr>
                                <td>民族:<select class="iType2 empNation" name="empNation">
                                    <option>汉</option>
                                    <option>少数民族</option>
                                </select></td>
                                <td>所在部门:<select class="iType2" name="empDeptid">
                                    <option value="1" selected="selected">人事部</option>
                                    <option value="2">财务部</option>
                                    <option value="3">经营部</option>
                                </select></td>
                            </tr>
                            <tr>
                                <td>在职状态:<select class="iType2 empStatus" name="empStatus">
                                    <option value="在职" selected="selected">在职</option>
                                    <option value ="离职">离职</option>
                                </select>
                                </td>

                            </tr>
                            <tr>
                                <td>编号:<input type="text" class="iType empNumber" name="empNumber"></input></td>
                                <td>
                                    员工类型:<select class="iType2 empTpye" name="empTpye">
                                    <option value="正式员工">正式员工</option>
                                    <option value ="临时员工">临时员工</option>
                                    <option value="合同工">合同工</option>
                                    <option value="兼职工">兼职工</option>
                                </select>
                                </td>
                            </tr>
                            <tr>
                                <td>身份证号码:<input type="text" class="iType empIdnumber" name="empIdnumber"></input></td>
                                <td>出生日期:<input type="text" class="iType empBirth" name="empBirth"></input></td>
                            </tr>
                            <tr>

                                <td>
                                    户口类型:<select class="iType2 empHukoutype" name="empHukoutype">
                                    <option value="城镇户口">城镇户口</option>
                                    <option value ="农村户口">农村户口</option>
                                </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    政治面貌:<select class="iType2 empPoliticalstatus" name="empPoliticalstatus">
                                    <option value="群众" selected="selected">群众</option>
                                    <option value="共青团员">共青团员</option>
                                    <option value="中共党员">中共党员</option>
                                </select>
                                </td>
                                <td>
                                    &nbsp;&nbsp;入团时间:<input type="text" class="iType empLeaguetime" name="empLeaguetime"></input>
                                </td>
                            </tr>
                            <tr>
                                <td>入党时间:<input type="text" class="iType empPartytime" name="empPartytime"></input></td>
                                <td>毕业时间:<input type="text" class="iType empGraduationtime" name="empGraduationtime"></input></td>
                            </tr>
                            <tr>
                                <td>专业:<input type="text" class="iType empMaster" name="empMaster"></input></td>
                                <td>
                                    学位:<select  class="iType2 empDegree" name="empDegree">
                                    <option value="学士">学士</option>
                                    <option value =" 双学士">双学士</option>
                                    <option value="硕士">硕士</option>
                                    <option value="博士">博士</option>
                                    <option value =" MBA">MBA</option>
                                    <option value="博士后">博士后</option>
                                </select>
                                </td>
                            </tr>
                            <tr>
                                <td>学历:<select class="iType2 empEducationallevel" name="empEducationallevel">
                                    <option value="高中">高中</option>
                                    <option value="技校">技校</option>
                                    <option value="大专">大专</option>
                                    <option value="本科">本科</option>
                                    <option value="研究生">研究生</option>
                                </select></td>
                                <td>毕业学校:<input type="text" class="iType empGraduationschool" name="empGraduationschool"></input></td>
                            </tr>
                            <tr>
                                <td>户口所在地:<input type="text" class="iType empHukoulocation" id="longWidth" name="empHukoulocation"/></td>
                            </tr>
                        </table>
                    </div>
                    <div class="block_r" style="float:right;width: 100px;height: 100px;margin-right: 1%">
                        <div id="image" style="width:100px;height:100px; background:#CCCCCC; ">
                            <img height="100px" width="100px" border="5px" id="photo"/>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="myField" style="margin:auto;width: 60%">
                    <legend>联系信息:</legend>
                    <div class="c_f1_top_l">
                        <table>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;手机号码:<input type="text" width="100%" class="iType empMobilephone" name="empMobilephone"></input></td>
                                <td>QQ号码:<input type="text" width="100%"class="iType empQq" name="empQq"></input></td>
                            </tr>
                            <tr>
                                <td>联系地址:<input type="text" width="100%" class="iType empAddr" name="empAddr"></input></td>
                                <td>家庭住址:<input type="text" width="100%" class="iType empHomeaddr" name="empHomeaddr"></input></td>
                            </tr>
                            <tr>
                                <td>电话:<input type="text" width="100%" class="iType empPhone" name="empPhone"></input></td>
                                <td>签合同时薪水:<input type="text" width="100%" class="iType empSalary" name="empSalary"></input></td>
                            </tr>

                        </table>
                    </div>

                </fieldset>
                <fieldset class="myField" style="margin:auto;width: 60%">
                    <legend>人员拓展信息:</legend>
                    <table>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;社保号:&nbsp;<input type="text" class="empSecuritynumber" name="empSecuritynumber"></td>
                        </tr>
                    </table>
                </fieldset>

            </div>
        </div>
        <div class="bottom">
            <fieldset class="myField" style="margin:auto;width: 60%">
                <legend>其他信息:</legend>
                <div class="f4">
                    <table>
                        <tr>
                            <td>职务:<select class="iType2" name="empTitle">
                                <option selected="selected" value="1000">助理</option>
                                <option selected="selected" value="1001">普通员工</option>
                                <option selected="selected" value="1002">主任</option>
                            </select></td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职称:<input type="text" class="iType empPosition" name="empPosition"></td>
                        </tr>
                        <tr>
                            <td>入职时间:<input type="text" class="iType empHiredate" name="empHiredate"></td>

                        </tr>
                        <tr>
                            <td>计算机水平:<input type="text" class="iType empComputerlevel" name="empComputerlevel"></td>
                            <td>语种1:<input type="text" class="iType empLanguage1" name="empLanguage1"></td>
                        </tr>
                        <tr>
                            <td>语种2:<input type="text" class="iType empLanguage2" name="empLanguage2"></td>
                            <td>语种3:<input type="text" class="iType empLanguage3" name="empLanguage3"></td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td class="content">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;特长:&nbsp;&nbsp;</td>
                            <td><textarea cols="80%" rows="4" class="empSpecialties" name="empSpecialties"></textarea></td>
                        </tr>
                        <tr style="height: 20px;"></tr>
                        <tr>
                            <td class="content">职务情况:&nbsp;</td>
                            <td><textarea cols="80%" rows="4" name="empStatus"></textarea></td>
                        </tr>
                        <tr style="height: 20px;"></tr>
                        <tr>
                            <td class="content">社保缴纳:&nbsp;</td>
                            <td><textarea cols="80%" rows="4" class="empSocialsecurity" name="empSocialsecurity"></textarea></td>
                        </tr>
                    </table>
                </div>
            </fieldset>
        </div>
        <input type="submit" value="保存" class="l-button" id="submit" style="width:50px;color:red;"></input>
    </form>
</div>

<div style="height: 25px;display: block"></div>
</body>
</html>