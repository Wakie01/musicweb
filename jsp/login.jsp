<%--
  Created by IntelliJ IDEA.
  User: 15513
  Date: 2019/8/25
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
    ${msg}
    <% request.getSession().removeAttribute("msg"); %>
    <form action="${pageContext.request.contextPath}/user/login" method="post">
        <table>
            <thead>登录界面</thead>
            <tr>
                <td>账号：</td>
                <td><input type="text" name="uacot" /></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input type="password" name="upass" /></td>
            </tr>
            <tr>
                <td><input type="submit" value="登录" /></td>
            </tr>
        </table>
    </form>
</body>
</html>
