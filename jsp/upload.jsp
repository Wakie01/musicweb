<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: 15513
  Date: 2019/8/28
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传歌曲</title>
</head>
<body>
<div id="head">
    <div>
        <p style="display: inline">Welcome <a href="${pageContext.request.contextPath}/user/userinfo">${username}</a></p>
        <a href="${pageContext.request.contextPath}/user/logout">注销</a>
    </div>
    <div>
        <a href="homepage">首页</a>
        <a href="allsongs">全部歌曲</a>
    </div>

</div>
<div>
    ${uploadResult}
    <% request.getSession().removeAttribute("uploadResult"); %>
    <div>
        <form action="uploadFile" method="post" enctype="multipart/form-data">
            <table>
                <thead>上传歌曲</thead>
                <tr>
                    <td>歌曲名：</td>
                    <td><input type="text" name="mname" /></td>
                </tr>
                <tr>
                    <td>歌手</td>
                    <td><input type="text" name="msinger" /></td>
                </tr>
                <tr>
                    <td>歌曲风格：</td>
                    <td>
                        <select id="song-style" name="mstyle">
                            <option value="伤感">伤感</option>
                            <option value="安静">安静</option>
                            <option value="轻松">轻松</option>
                            <option value="激情">激情</option>
                            <option value="甜蜜">甜蜜</option>
                            <option value="开心">开心</option>
                            <option value="想念">想念</option>
                            <option value="疗伤">疗伤</option>
                            <option value="励志">励志</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>下载需要等级</td>
                    <td>
                        <select name="mdgrade">
                            <option value="1">1级</option>
                            <option value="2">2级</option>
                            <option value="3">3级</option>
                            <option value="4">4级</option>
                            <option value="5">5级</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>文件：</td>
                    <td><input type="file" id="music-file" name="mfile" /></td>
                </tr>
                <tr>
                    <td><input type="reset" value="重置" /></td>
                    <td><input type="submit" value="上传" /></td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
