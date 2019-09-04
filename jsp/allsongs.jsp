<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 15513
  Date: 2019/8/27
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>全部歌曲</title>
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
        <input type="text" id="search-text-input" />
        <a id="add" href="${pageContext.request.contextPath}/search" target="_blank">
            <img src="images/search.gif" />
        </a>
    </div>
</div>
<div id="music-div">
    <div id="content-div">
        <form>
            <table>
                <thead>全部歌曲</thead>
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
                    <td></td>
                    <td></td>
                </tr>
                <c:forEach items="${musicInfoList}" var="musicInfo" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td><a href="musicpanel?mid=${musicInfo.getMid()}" target="_blank">${musicInfo.getMname()}</a></td>
                        <td>${musicInfo.getMsinger()}</td>
                        <td>${musicInfo.getMstyle()}</td>
                        <td>${musicInfo.getUname()}</td>
                        <td>${musicInfo.formatDate(musicInfo.getMupTime())}</td>
                        <td>${musicInfo.getMlikeNum()}</td>
                        <td>${musicInfo.getMdislikeNum()}</td>
                        <td>${musicInfo.getMplayNum()}</td>
                        <td>${musicInfo.getMdgrade()}</td>
                        <td>${musicInfo.getMdownNum()}</td>
                        <td><a href="like?from=allsongs&mid=${musicInfo.getMid()}">赞</a></td>
                        <td><a href="dislike?from=homepage&mid=${musicInfo.getMid()}">踩</a></td>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </div>
    <div id="page-div">
        页数：
        <c:forEach begin="1" end="${pageInfo.getPages()}" varStatus="status">
            <a href="allsongs?page=${status.count}">${status.count}</a>
        </c:forEach>
    </div>

</div>
</body>
</html>
