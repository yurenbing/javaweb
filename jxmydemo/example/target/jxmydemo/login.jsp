<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    <script src="lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <link href="lib/ligerUI/skins/Aqua/css/ligerui-dialog.css" rel="stylesheet" type="text/css" />
    <link href="lib/ligerUI/skins/Gray/css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="css/login.css" rel="stylesheet" type="text/css" />
    <script src="lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnLogin").attr("disabled",true);
            $("#login_name").blur(function () {
                if ($("#login_name").val()==""){
                    $("#login_name").focus();
                    $("#loginNameInfo").html("<font color='red'>请输入用户名</font>");
                    $("#btnLogin").attr("disabled",true);
                }else {
                    $.ajax({
                        type:"get",
                        datatype:"text",
                        url:"loginName.do",
                        data:{
                            "login_name":$("#login_name").val()
                        },
                        success:function(data){
                            if(data=="null"){
                               $("#loginNameInfo").html("<font color='red'>用户不存在</font>");
                                $("#btnLogin").attr("disabled",true);
                            }else {
                                $("#loginNameInfo").html("");
                                checkPassword();
                            }
                        }
                    });
                }
            });
        });
        function checkPassword() {
            $("#btnLogin").attr("disabled",false);
            $("#login_password").blur(function () {
                if($("#login_password").val()==""){
                    $("#loginPasswordInfo").html("<font color='red'>请输入密码</font>");
                    $("#loginPasswordInfo").focus();
                }else {
                    $("#loginPasswordInfo").html("");
                }
            });
        };
        function login() {
            $.ajax({
                type:"get",
                datatype:"text",
                url:"/loginCheck.do",
                data:
                    $("#loginForm").serialize(),
                success:function (data) {
                    if (data=="null"){
                        $("#loginPasswordInfo").html("<font color='red'>密码错误，请重新输入</font>");
                    }else if (data=="main"){
                        window.location.replace("login.do?login_name="+$("#login_name").val());
                    }
                }
            });
        };

    </script>
</head>
<body style="padding:10px"> 
    <div id="login">
        <div id="loginlogo"></div>
        <div id="loginpanel">
            <div class="panel-h"></div>
            <div class="panel-c">
                <div class="panel-c-l">
                   <form id="loginForm" action="/loginCheck.do" method="post" enctype="multipart/form-data">
                    <table cellpadding="0" cellspacing="0">
                        <tbody>
                         <tr>
                            <td align="left" colspan="2"> 
                             <h3>请使用系统账号登录</h3>
                            </td>
                            </tr> 
                            <tr>
                                <td align="right">用户名：</td>
                                <td align="left"><input name="loginName" id="login_name" class="login-text"/></td>
                                <td><font color="red">*</font></td>
                                <td><span id="loginNameInfo"></span></td>
                            </tr>
                            <tr>
                                <td align="right">密&nbsp;码：</td>
                                <td align="left"><input type="password" name="loginPassword" id="login_password" class="login-text" /></td>
                                <td><font color="red">*</font></td>
                                <td><span id="loginPasswordInfo"></span></td>
                            </tr>
                            <tr>
                            <td align="center" colspan="2">
                                <input type="button" id="btnLogin" value="登陆" class="login-btn" onclick="login()"/>
                            </td>
                            </tr> 
                        </tbody>
                    </table>
                   </form>
                </div>
                <div class="panel-c-r">
                <p>请从左侧输入登录账号和密码登录</p>
                <p>如果遇到系统问题，请联系网络管理员。</p>
                <p>如果没有账号，请联系网站管理员。 </p>
                <p>......</p>
                </div>
            </div>
            <div class="panel-f"></div>
        </div>
         <div id="logincopyright">Copyright © 2017 江西六丰信息科技有限公司 </div>
    </div>
</body>
</html>

