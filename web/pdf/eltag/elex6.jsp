<%@ page import="java.util.Date" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-26
  Time: 오후 5:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true"%>
<jsp:useBean id="elfunc" class="pdf.eltag.DateUtil"></jsp:useBean>
<%
    java.util.Date today = new java.util.Date();
    String a = elfunc.getDate(today);
    System.out.println(a);
    HashMap<String,String> tm = new HashMap<>();
    tm.put("today",a);
    request.setAttribute("today",tm);
%>

<html>
<head>
    <title>EL 함수호출</title>
</head>
<body>

오늘은 <b>${today.today}</b> 입니다.

</body>
</html>
