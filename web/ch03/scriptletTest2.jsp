<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-13
  Time: 오전 2:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<meta name="viewport" content="width=device-width, initial-scale = 1.0"/>
<html>
<head>
    <title>스크립틀릿 예제</title>
</head>
<body>
<h2>Scriptlet Ex - Use Logic</h2>
<%
    int var1 = (int)(Math.random()*10)+1;
    if (var1 > 5) {
%>
변수 var1의 값은 5보다 크다.
<br>
var 1 = <%=var1%>
<%
} else {%>
변수 var1의 값은 5보다 작다.
<%
    }
%>
</body>
</html>
