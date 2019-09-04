<%--
  Created by IntelliJ IDEA.
  User: 15513
  Date: 2019/8/29
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>查找结果</title>
</head>
<body>
<h2>查找结果</h2>
<c:choose>
    <c:when test="${sopt == 'song'}">
        <h3>歌曲</h3>
        <hr>
        <c:choose>
            <c:when test="${!empty songs}">
                <table>
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
                        <td>下载数量</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <c:forEach items="${songs}" var="musicInfo" varStatus="status">
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
                            <td>${musicInfo.getMdownNum()}</td>
                            <td><a href="${pageContext.request.contextPath}/like?mid=${musicInfo.getMid()}">赞</a></td>
                            <td><a href="${pageContext.request.contextPath}/dislike?mid=${musicInfo.getMid()}">踩</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <p>抱歉，没有找到与${stex}相关的歌曲</p>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:when test="${sopt == 'singer'}">
        <h3>歌手</h3>
        <hr>
        <c:choose>
            <c:when test="${!empty singers}">
                <table>
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
                        <td>下载数量</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <c:forEach items="${singers}" var="musicInfo" varStatus="status">
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
                            <td>${musicInfo.getMdownNum()}</td>
                            <td><a href="${pageContext.request.contextPath}/like?mid=${musicInfo.getMid()}">赞</a></td>
                            <td><a href="${pageContext.request.contextPath}/dislike?mid=${musicInfo.getMid()}">踩</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <p>抱歉，没有找到与${stex}相关的歌手</p>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:when test="${sopt == 'style'}">
        <h3>歌曲风格</h3>
        <hr>
        <c:choose>
            <c:when test="${!empty styles}">
                <table>
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
                        <td>下载数量</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <c:forEach items="${styles}" var="musicInfo" varStatus="status">
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
                            <td>${musicInfo.getMdownNum()}</td>
                            <td><a href="${pageContext.request.contextPath}/like?mid=${musicInfo.getMid()}">赞</a></td>
                            <td><a href="${pageContext.request.contextPath}/dislike?mid=${musicInfo.getMid()}">踩</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <p>抱歉，没有找到与${stex}相关的风格歌曲</p>
            </c:otherwise>
        </c:choose>
        <br>
    </c:when>
    <c:otherwise>
        <h3>歌曲</h3>
        <hr>
        <c:choose>
            <c:when test="${!empty songs}">
                <table>
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
                        <td>下载数量</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <c:forEach items="${songs}" var="musicInfo" varStatus="status">
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
                            <td>${musicInfo.getMdownNum()}</td>
                            <td><a href="${pageContext.request.contextPath}/like?mid=${musicInfo.getMid()}">赞</a></td>
                            <td><a href="${pageContext.request.contextPath}/dislike?mid=${musicInfo.getMid()}">踩</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <p>抱歉，没有找到与${stex}相关的歌曲</p>
            </c:otherwise>
        </c:choose>
        <br>
        <h3>歌手</h3>
        <hr>
        <c:choose>
            <c:when test="${!empty singers}">
                <table>
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
                        <td>下载数量</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <c:forEach items="${singers}" var="musicInfo" varStatus="status">
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
                            <td>${musicInfo.getMdownNum()}</td>
                            <td><a href="${pageContext.request.contextPath}/like?mid=${musicInfo.getMid()}">赞</a></td>
                            <td><a href="${pageContext.request.contextPath}/dislike?mid=${musicInfo.getMid()}">踩</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <p>抱歉，没有找到与${stex}相关的歌手</p>
            </c:otherwise>
        </c:choose>
        <br>
        <h3>歌曲风格</h3>
        <hr>
        <c:choose>
            <c:when test="${!empty styles}">
                <table>
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
                        <td>下载数量</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <c:forEach items="${styles}" var="musicInfo" varStatus="status">
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
                            <td>${musicInfo.getMdownNum()}</td>
                            <td><a href="${pageContext.request.contextPath}/like?mid=${musicInfo.getMid()}">赞</a></td>
                            <td><a href="${pageContext.request.contextPath}/dislike?mid=${musicInfo.getMid()}">踩</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <p>抱歉，没有找到与${stex}相关的歌曲风格</p>
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>
<% request.getSession().removeAttribute("stex"); %>
<% request.getSession().removeAttribute("singers"); %>
<% request.getSession().removeAttribute("songs"); %>
<% request.getSession().removeAttribute("styles"); %>
<% request.getSession().removeAttribute("sopt"); %>
</body>
</html>
