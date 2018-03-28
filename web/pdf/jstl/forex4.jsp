<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-27
  Time: 오후 4:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    java.util.HashMap<String,Object> mapData = new java.util.HashMap<>();
    mapData.put("name","이름이다아아");
    mapData.put("today",new java.util.Date());
%>
<c:set var="intArray" value="<%=new int[]{1,2,3,4,5}%>"/>
<c:set var="map" value="<%=mapData%>"></c:set>
<html>
<head>
    <title>forEach Tag</title>
</head>
<body>
<h4>1부터 100까지 홀수의 합</h4>
<c:forEach var="i" begin="1" end="100" step="2">
    <c:set var="sum" value="${sum+i}"></c:set>
</c:forEach>
결과:${sum}
<h4>구구단 : 7단</h4>
<ul>
    <c:forEach var="i" begin="1" end="9">
        <li>7*${i}=${7*i}</li>
    </c:forEach>
</ul>

<br>

<h4>int 형 배열</h4>

<c:forEach var="i" items="${intArray}" begin="2" end="4">
    [${i}]
</c:forEach>

<br>

<h4>HashMap </h4>
<c:forEach var="i" items="${map}">
    ${i.key} = ${i.value}<br>
</c:forEach>

<br>

<h3>JSTL core - forToken</h3>
<c:forTokens items="고양이,강아지,돼지,나무꾼" delims="," var="s">
    동물이름 : ${s}
    <br>
</c:forTokens>
</body>
</html>
