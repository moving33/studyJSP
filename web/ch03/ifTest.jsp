<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-13
  Time: 오전 3:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<meta name="viewport" content="width=device-width, initial-scale = 1.0"/>
<%--폼으로 넘어온 데이터를 한글이 깨지지 않게 처리 --%>
<%
    request.setCharacterEncoding("utf-8");
%>
<html>
<head>
    <title>ifTest 결과처리</title>
</head>
<body>
<h2>
    if -else 좋아하는 색 선택
</h2>
<%
    String name = request.getParameter("name");
    String color = request.getParameter("color");
    String selectColor = "";
    if (color.equals("blue")) {
        selectColor = "파랑색";
    }
    if (color.equals("red")) {
        selectColor = "빨강";
    }
    if (color.equals("green")) {
        selectColor = "초록";
    }
%>
<%=name%> 님이 선택한 색은 <%=selectColor%> 입니다.
<br>
    선택한 색 : <br>
<div style="background-color:<%=color%>; width: 150px;height: 150px;">
</div>
</body>
</html>
