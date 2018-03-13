<%@ page import="javax.naming.Context" %><%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-13
  Time: 오후 3:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>application 내장객체</title>
</head>
<body>
<h2>
    application 내장객체
</h2>
<%
    String info = application.getServerInfo();
    String path = application.getRealPath("/"); //  "/" 는 현재 page를 의미
    application.log("로그 기록 :");
    String c = application.getInitParameter("name");
    String d = config.getInitParameter("name");

%>


     Web 컨테이너의 이름과 버전 = <%=info%>
<br>
    웹 어플리케이션 폴더의 로컬 시스템 경로 : <%=path%>
<br>
    현재 Page의 Context Path = <%=request.getContextPath()%>
    <br>
context param 가져오기 = <%=c%>
<br>
config로 가져오기 = <%=d%>
</body>
</html>
