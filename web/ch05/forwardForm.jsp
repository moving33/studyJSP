<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-13
  Time: 오후 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<meta name="viewport" content="width=device-width, initial-scale = 1.0"/>
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    request.setAttribute("id","kingdora@kings.com");
    request.setAttribute("name","킹도라");
%>

forwardForm.page 입니다 <br>
화면에 결코 표시 되지 않습니다 <br>

<jsp:forward page="forwardTo.jsp"></jsp:forward>
