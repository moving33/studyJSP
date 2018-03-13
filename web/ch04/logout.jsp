<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-13
  Time: 오후 2:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.removeAttribute("id");
    response.sendRedirect("sessionTestForm.jsp");
%>
