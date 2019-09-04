<%--
  Created by IntelliJ IDEA.
  User: 15513
  Date: 2019/8/22
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
${msg}
<% request.getSession().removeAttribute("msg"); %>
<form action="${pageContext.request.contextPath}/user/register" method="post">
    <table>
        <thead>账号注册</thead>
        <tr>
            <td>账号：</td>
            <td><input type="text" name="uacot" id="uacotInput"></td>
            <script type="text/javascript" language="JavaScript">
                var uai=document.getElementById("uacotInput");
                window.onload=function () {
                    uai.value="请输入11位电话号码";
                }
                uai.onfocus=function () {
                    uai.value="";
                }
                uai.onblur=function () {
                    var phone =uai.value;
                    if(!(/^1[3456789]\d{9}$/.test(phone))){
                        alert("手机号码有误，请重填");
                        uai.value="";
                    }
                }
            </script>
        </tr>
        <tr>
            <td>用户名：</td>
            <td><input type="text" name="uname" /></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="password" name="upass" /></td>
        </tr>
        <tr>
            <td><input type="submit" value="注册" /></td>
        </tr>
    </table>
</form>
</body>
</html>
