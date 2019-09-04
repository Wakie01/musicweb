<%--
  Created by IntelliJ IDEA.
  User: 15513
  Date: 2019/8/28
  Time: 8:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${musicInfo.getMname()}试听</title>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
<div id="audio-div">
    <h2>${musicInfo.getMname()}&nbsp;-&nbsp;${musicInfo.getMsinger()} </h2>
    <audio src="http://localhost:8080/${mlocal}" autoplay="autoplay"
           controls="controls" controlsList="nodownload" id="audio-play">
        你的浏览器不支持audio标签
    </audio>
</div>
<script type="text/javascript">
    $('#audio-play').bind('contextmenu',function() { return false; });
</script>
</body>
</html>
