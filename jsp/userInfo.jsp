<%--
  Created by IntelliJ IDEA.
  User: 15513
  Date: 2019/8/23
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看用户信息</title>
</head>
<body>
<div>
    <a href="${pageContext.request.contextPath}/homepage">返回主页</a>
</div>
<div>
    <form method="post" id="uInfoForm">
        <table>
            <thead>用户信息</thead>
            <tr>
                <td>账号：</td>
                <td>${uacot}</td>
            </tr>
            <tr>
                <td>用户名：</td>
                <td>${userInfo.getUname()}</td>

            </tr>
            <tr>
                <td>总共上传歌曲数：</td>
                <td>${userInfo.getTupload()}首</td>
            </tr>
            <tr>
                <td>等级：</td>
                <td>${userInfo.getUgrade()}级</td>
            </tr>
            <tr>
                <td>上传总空间：</td>
                <td>${userInfo.getUroom()}MB</td>
            </tr>
            <tr>
                <td>尚有上传总空间：</td>
                <td>${userInfo.getUrmspace()}</td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
