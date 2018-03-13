<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-13
  Time: 오후 2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");

    if(pass.equals("1234")) session.setAttribute("id",id);
    response.sendRedirect("sessionTestForm.jsp");
%>