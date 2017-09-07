<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<link href="${pageContext.request.contextPath}/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css">
  <script src="${pageContext.request.contextPath}/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/lib/jquery-validation/jquery.validate.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerButton.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script> 
  <script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
  <script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerMenu.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/lib/json2.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/demos/grid/EmployeeData.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/demos/grid/DepartmentData.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerFilter.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/demos/filter/ligerGrid.showFilter.js" type="text/javascript"></script>
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
.block_r{
	float: right;
}
.content{
	vertical-align:top;
}

   	 </style>

</head>

<body>
	<div class="all">
		<form action="/insertEmployee.do" method="post" id="employeeForm" enctype="multipart/form-data">
        <div class="center">
        	<div class="domain">
					<fieldset class="myField" style="margin:auto;width: 60%">
					<legend>人员基本信息:</legend>
						<div class="c_f1_top_l">
							<table class="insert">
								<tr>
									<td>姓名:</td>
									<td align="left" style="width: 250px">
										<input type="text" class="iType EMP_Name {required:true,messages:{required:'必填项'}}" id="EMP_Name" name="empName"></input>
									</td>
								</tr>
								<tr>
									<td style="height: 100%;display: block;"></td>
								</tr>
								<tr>
									<td>性别:</td>
									<td class="info" align="left">
										<select class="iType2" name="empGender">
											<option value="男" selected="selected">男</option>
											<option value ="女">女</option>
										</select>
									</td>
									<td>籍贯:</td>
									<td align="left"><select class="iType2" name="empNative">
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
									<td>民族:</td>
									<td align="left"><select class="iType2" name="empNation">
										<option>汉</option>
										<option>少数民族</option>
									</select></td>
									<td>所在部门:</td>
									<td align="left">
										<select class="iType2" name="empDeptid">
											<option value="1" selected="selected">人事部</option>
											<option value="2">财务部</option>
											<option value="3">经营部</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>在职状态:</td>
									<td align="left"><select class="iType2" name="empStatus">
													<option value="在职" selected="selected">在职</option>
													<option value ="离职">离职</option>
												</select>
									</td>
									<td>所在岗位:</td>
									<td align="left">
										<select  class="iType2" name="empWorkposition">
										<option value="员工" selected="selected">员工</option>
										<option value ="主管">主管</option>
										<option value="经理">经理</option>
										<option value="总监">总监</option>
										<option value="副总经理">副总经理</option>
										<option value="总经理">总经理</option>
										<option value="主任">主任</option>
										<option value="档案专员">档案专员</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>编号:</td>
									<td align="left">
										<input type="text" class="iType {required:true,digits:true,messages:{required:'必填项',digits:'只能输入数字'}}" name="empNumber"></input></td>
									<td>员工类型:</td>
									<td align="left">
										<select class="iType2" name="empTpye">
										<option value="正式员工">正式员工</option>
										<option value ="临时员工">临时员工</option>
										<option value="合同工">合同工</option>
										<option value="兼职工">兼职工</option>
									</select>
									</td>
								</tr>
								<tr>
									<td>身份证号码:</td>
									<td align="left">
										<input type="text"
											   class="iType {required:true,digits:true,rangelength:[18,18],messages:{required:'必填项',digits:'只能输入数字',rangelength:$.format('输入{0}位数字')}}"
											   name="empIdnumber"></input></td>
									<td>出生日期:</td>
									<td align="left"><input type="text" class="iType date" name="empBirth"></input></td>
								</tr>
								<tr>
									<td>户口类型:</td>
									<td align="left">
										<select class="iType2" name="empHukoutype">
										<option value="城镇户口">城镇户口</option>
										<option value ="农村户口">农村户口</option>
										</select>
									</td>
									<td>户口所在地:</td>
									<td align="left">
										<input type="text" class="iType {required:true,messages:{required:'必填项'}}" id="longWidth" name="empHukoulocation"/>
									</td>
								</tr>
								<tr>
									<td>政治面貌:</td>
									<td align="left">
										<select class="iType2" name="empPoliticalstatus">
										<option value="群众" selected="selected">群众</option>
										<option value="共青团员">共青团员</option>
										<option value="中共党员">中共党员</option>
										</select>
									</td>
									<td>&nbsp;&nbsp;入团时间:</td>
									<td align="left">
										<input type="text" class="iType date" name="empLeaguetime"></input>
									</td>
								</tr>
								<tr>
									<td>入党时间:</td>
									<td align="left"><input type="text" class="iType date" name="empPartytime"></input></td>
									<td>毕业时间:</td>
									<td align="left"><input type="text" class="iType date" name="empGraduationtime"></input></td>
								</tr>
								<tr>
									<td>专业:</td>
									<td align="left"><input type="text" class="iType {required:true,messages:{required:'必填项'}}" name="empMaster"></input></td>
									<td>学位:</td>
									<td align="left">
										<select  class="iType2" name="empDegree">
										<option value="学士" selected="selected">学士</option>
										<option value =" 双学士">双学士</option>
										<option value="硕士">硕士</option>
										<option value="博士">博士</option>
										<option value ="MBA">MBA</option>
										<option value="博士后">博士后</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>学历:</td>
									<td align="left"><select class="iType2" name="empEducationallevel">
										<option value="高中">高中</option>
										<option value="技校">技校</option>
										<option value="大专">大专</option>
										<option value="本科">本科</option>
										<option value="研究生">研究生</option>
									</select></td>
									<td>毕业学校:</td>
									<td align="left"><input type="text" class="iType {required:true,messages:{required:'必填项'}}" name="empGraduationschool"></input></td>
								</tr>
							</table>
                            </div>
						<div class="block_r" style="float:right;width: 100px;height: 100px;margin-right: 1%">
										<div id="image" style="width:100px;height:100px; background:#CCCCCC; ">
											<img src="${pageContext.request.contextPath}/images/default.png" height="100px" width="100px" border="5px"/>
										</div>
								<br/>
											<input type="button" class="l-button" style="width: 100px" value="更换照片" onclick="document.getElementById('file').click()"/>
							<br/>
							<input type="file" id="file" name="file" style="display: none"/>
						</div>
					</fieldset>
                    <fieldset class="myField" style="margin:auto;width: 60%">
					<legend>联系信息:</legend>
						<div class="c_f1_top_l">
						<table class="insert">
							<tr>
								<td>&nbsp;&nbsp;&nbsp;手机号码:</td>
								<td align="left">
									<input type="text" width="100%" class="iType {required:true,messages:{required:'必填项'}}" name="empMobilephone"></input>
								</td>
								<td>QQ号码:</td>
								<td align="left"><input type="text" width="100%"class="iType" name="empQq"></input></td>
							</tr>
							<tr>
								<td>联系地址:</td>
								<td align="left"><input type="text" width="100%" class="iType" name="empAddr"></input></td>
								<td>家庭住址:</td>
								<td align="left">
									<input type="text" width="100%" class="iType {required:true,messages:{required:'必填项'}}" name="empHomeaddr"></input>
								</td>
							</tr>
							<tr>
								<td>电话:</td>
								<td align="left"><input type="text" width="100%" class="iType" name="empPhone"></input></td>
								<td>签合同时薪水:</td>
								<td align="left"><input type="text" width="100%" class="iType" name="empSalary"></input></td>
							</tr>

						</table>
						</div>

					</fieldset>
                    <fieldset class="myField" style="margin:auto;width: 60%">
					<legend>人员拓展信息:</legend>
						<table class="insert">
							<tr>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;社保号:</td>
								<td align="left"><input type="text" name="empSecuritynumber"></td>
							</tr>
						</table>
					</fieldset>

                </div>
            </div>
        <div class="bottom">
        	<fieldset class="myField" style="margin:auto;width: 60%">
					<legend>其他信息:</legend>
                    <div class="f4">
						<table class="insert">
							<tr>
								<td>职务:</td>
								<td align="left">
									<select class="iType2" name="empTitle">
										<option selected="selected" value="1000">助理</option>
										<option selected="selected" value="1001">普通员工</option>
										<option selected="selected" value="1002">主任</option>
									</select>
								</td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职称:</td>
								<td align="left"><input type="text" class="iType" name="empPosition"></td>
							</tr>
							<tr>
								<td>入职时间:</td>
								<td align="left"><input type="text" class="iType date" name="empHiredate"></td>
							</tr>
							<tr>
								<td>计算机水平:</td>
								<td align="left"><input type="text" class="iType" name="empComputerlevel"></td>
								<td>语种1:</td>
								<td align="left">
									<select name="empLanguage1" class="iType2">
										<option value="" selected="selected"></option>
										<option value="英语">英语</option>
										<option value="日语">日语</option>
										<option value="英语">德语</option>
										<option value="英语">法语</option>
										<option value="其他">其他</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>语种2:</td>
								<td align="left">
									<select name="empLanguage2" class="iType2">
										<option value="" selected="selected"></option>
										<option value="英语">英语</option>
										<option value="日语">日语</option>
										<option value="英语">德语</option>
										<option value="英语">法语</option>
										<option value="其他">其他</option>
									</select>
								</td>
								<td>语种3:</td>
								<td align="left">
									<select name="empLanguage3" class="iType2">
										<option value="" selected="selected"></option>
										<option value="英语">英语</option>
										<option value="日语">日语</option>
										<option value="英语">德语</option>
										<option value="英语">法语</option>
										<option value="其他">其他</option>
									</select>
								</td>
							</tr>
						</table>
							<table>
								<tr>
									<td class="content">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;特长:&nbsp;&nbsp;</td>
									<td align="left"><textarea cols="80%" rows="4" name="empSpecialties"></textarea></td>
								</tr>
								<tr style="height: 20px;"></tr>
								<tr>
									<td class="content">职务情况:&nbsp;</td>
									<td align="left"><textarea cols="80%" rows="4" name="empStatus"></textarea></td>
								</tr>
								<tr style="height: 20px;"></tr>
								<tr>
									<td class="content">社保缴纳:&nbsp;</td>
									<td align="left"><textarea cols="80%" rows="4" name="empSocialsecurity"></textarea></td>
								</tr>
							</table>
                       </div>
					</fieldset>
		</div>
			<input type="submit" value="保存" class="l-button" id="submit" style="width:50px;color:red;"></input>
		</form>
    </div>

	<div style="height: 25px;display: block"></div>

	<script type="text/javascript">

        document.getElementById('file').onchange = function() {
            var imgFile = this.files[0];
            var fr = new FileReader();
            fr.onload = function() {
                document.getElementById('image').getElementsByTagName('img')[0].src = fr.result;
            };
            fr.readAsDataURL(imgFile);
        };
        $(document).ready(function () {
            $(".insert").ligerForm();

            $("#employeeForm").validate({
				debug:true,
			});


            $(".date").ligerDateEditor();
        })


	</script>
</body>
</html>