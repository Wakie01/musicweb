<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pojo.User" %>
<%--
  Created by IntelliJ IDEA.
  User: 15513
  Date: 2019/8/25
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
<div id="head-div">
    <div>
        <p style="display: inline">Welcome&nbsp;<a href="${pageContext.request.contextPath}/user/userinfo">${username}</a> </p>
        <c:choose>
            <c:when test="${empty username}">
                <a href="${pageContext.request.contextPath}/user/toRegister">注册</a>
                <a href="${pageContext.request.contextPath}/user/toLogin">登录</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/user/logout">注销</a>
            </c:otherwise>
        </c:choose>
    </div>
    <div id="head-main-content">
        <a href="${pageContext.request.contextPath}/homepage">主页</a>
        <a href="${pageContext.request.contextPath}/allsongs">全部歌曲</a>
        <a href="${pageContext.request.contextPath}/uploadRequest">上传歌曲</a>
        <p style="display: inline">查找</p>
        <select id="search-option">
            <option value="all">全部</option>
            <option value="song">歌曲</option>
            <option value="singer">歌手</option>
            <option value="style">歌曲风格</option>
        </select>
        <input type="text" id="stex" />
        <a id="add" target="_blank">
            <img src="images/search.gif" onclick="fun()"/>
        </a>
        <script type="text/javascript">
            function fun() {
                var add=document.getElementById("add");
                var stex=$('#stex').val();
                var sopt=$('#search-option').val();
                add.href="http://localhost:8080/musicExp_war_exploded/search?sopt="+sopt+"&stex="+stex;
            }
        </script>
    </div>
</div>
<div id="music-div">
    <div id="content-div">
        <form>
            <table>
                <tr>
                    <td><a href="${pageContext.request.contextPath}/homepage">播放最多</a></td>
                    <td><a href="${pageContext.request.contextPath}/topnew">最新上传</a></td>
                    <td><a href="${pageContext.request.contextPath}/toplike">点赞最多</a></td>
                    <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                </tr>
                <tr>
                    <td>序号</td>
                    <td>歌曲</td>
                    <td>歌手</td>
                    <td>歌曲风格</td>
                    <td>上传人</td>
                    <td>上传时间</td>
                    <td>赞数</td>
                    <td>踩数</td>
                    <td>播放数量</td>
                    <td>下载需要等级</td>
                    <td>下载数量</td>
                    <td></td><td></td>
                </tr>
                <c:forEach items="${musicInfoList}" var="musicInfo" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td><a href="${pageContext.request.contextPath}/musicpanel?mid=${musicInfo.getMid()}" target="_blank">${musicInfo.getMname()}</a></td>
                        <td>${musicInfo.getMsinger()}</td>
                        <td>${musicInfo.getMstyle()}</td>
                        <td>${musicInfo.getUname()}</td>
                        <td>${musicInfo.formatDate(musicInfo.getMupTime())}</td>
                        <td>${musicInfo.getMlikeNum()}</td>
                        <td>${musicInfo.getMdislikeNum()}</td>
                        <td>${musicInfo.getMplayNum()}</td>
                        <td>${musicInfo.getMdgrade()}</td>
                        <td>${musicInfo.getMdownNum()}</td>
                        <td><a href="${pageContext.request.contextPath}/like?from=homepage&mid=${musicInfo.getMid()}">赞</a></td>
                        <td><a href="${pageContext.request.contextPath}/dislike?from=homepage&mid=${musicInfo.getMid()}">踩</a></td>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </div>
</div>
</body>
</html>
