<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-13
  Time: 오후 1:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%-- 출력 버퍼의 추가 --%>
<h2>response 객체 예제 - sendRedirect() method의 사용</h2>
현재 page는 <b>responseRedirect.jsp</b> 페이지 입니다.

<%
    response.sendRedirect("responseRedirected.jsp");
    //출력 버퍼 비움
%>

</body>
</html>
