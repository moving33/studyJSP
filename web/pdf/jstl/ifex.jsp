<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-27
  Time: 오후 2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${3>1}">
    이내용은 화면에 나타납니다.
</c:if>
<form method="post" >
    <label for="w">당신은?</label>
    <input type="text" name="type" id="w">
    <label for="s">당신의 점수는?</label>
    <input type="number" name="score" id="s">
    <br>
    당신이 좋아하는 영화들을 적으시오
    <input type="text" name="movie1"><input type="text" name="movie2"><input type="text" name="movie3">
    <input type="submit" value="클릭" class="button">
</form>

<br>
<c:if test="${param.type != null}">
    <c:if test="${param.type eq 'guest'}">
        손님의 방문을 환영해부려
    </c:if>
    <c:if test="${param.type == 'member'}">
        오셨습니까 ! 기다리고 있었습니다.
    </c:if>
</c:if>
<br>
<c:choose>
    <c:when test="${param.score >= 90}">합격을 축하드립니다.</c:when>
    <c:otherwise>당신은 탈락입니다. </c:otherwise>
</c:choose>
<hr>
<br>
<c:if test="${param.movie != null}">
당신이 선택한 영화들은?
<ul>
    <c:forEach var="movie" items="${param.movie}">
        <li>${movie}</li>
    </c:forEach>
</ul>
</c:if>
</body>
</html>
