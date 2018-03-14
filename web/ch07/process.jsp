<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-14
  Time: 오후 4:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String a = request.getParameter("name");
    String b = request.getParameter("age");
    String c = request.getParameter("hobby");
%>
당신의 이름은 <%=a%> 이고 나이는 <%=b%> 취미는 <%=c%> 입니다.