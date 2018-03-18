<%@ page import="java.sql.Connection" %>
<%@ page import="ch12.board.BoardDBBean" %><%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-13
  Time: 오전 2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<meta name="viewport" content="width=device-width, initial-scale = 1.0"/>
<html>
<head>
    <title>선언문 예제 - 변수 선언</title>
</head>
<body>
<h2>선언문 예제 - 변수 선언</h2>
<%
    //문자열과 전역변수 str2의 값을 결합해 선언한 지역변수 str1에 저장
    String str1 = "Game ID - "+str2;
%>
<%!
    String str2 = "The... GOD";
    String id = "The... DEVIL";

    public String getId(){
        return id;
    }
%>
<%--<%
    int a = BoardDBBean.getInstance().test();
    out.print(a);
%>--%>
<hr>
결과 : <%=str1%>
getID의 method 실행결과 : <%=getId()%>
</body>
</html>
