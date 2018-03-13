<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-13
  Time: 오후 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<meta name="viewport" content="width=device-width, initial-scale = 1.0"/>
<%
    String id = (String)request.getAttribute("id");
    String name = (String)request.getAttribute("name");
%>

fowardTo.jsp Page 입니다.
<br>
ID  = <%=id%> , name = <%=name%>