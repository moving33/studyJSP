<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-13
  Time: 오후 5:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    String pagename = request.getParameter("pagename");
%>
<html>
포함되는 페이지 includeTest.jsp 입니다.
<br>
URI =
<%=request.getContextPath().toString()%>
<body>
<br>
<hr>
<jsp:include page="<%=pagename%>" flush="false"/>
includeTest.jsp 의 나머지 내용입니다.

</body>
</html>
