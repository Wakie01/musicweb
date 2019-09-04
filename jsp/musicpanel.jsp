<%--
  Created by IntelliJ IDEA.
  User: 15513
  Date: 2019/8/27
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${musicInfo.getMname()}</title>
</head>
<body>
${msg}
<% request.getSession().removeAttribute("msg"); %>
<div>
    <table>
        <tr>
            <td>${musicInfo.getMname()}</td>
            <td>${musicInfo.getMsinger()}</td>
            <td><a href="listen" target="_self">试听</a></td>
            <td><a href="downloadRequest">下载</a></td>
        </tr>
    </table>
</div>
</body>
</html>
