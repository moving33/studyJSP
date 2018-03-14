<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-14
  Time: 오후 4:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    String result = "";
    if(name.equals("관리자")){
        result = "관리자님 오셨습니까!";
    }else{
        result = "사용자님 오셨습니까!";
    }
%>
<%=result%>
