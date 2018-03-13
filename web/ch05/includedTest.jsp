<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-13
  Time: 오후 5:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = request.getParameter("name");
%>
포함되는 page includedTest.jsp 입니다.
<p>
    <b>
        <%=name%> 님 도착하셨습니다.
        <br>
        URI =
        <%=application.getRealPath("includedTest.jsp")%>
        <hr>
    </b>
</p>