<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-04-02
  Time: 오전 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>요청 파라미터로 명령어를 전달하는 예제</title>
</head>
<body>
<strong>처리결과 : </strong>
<c:set var="message" value="${requestScope.message}"></c:set>
<c:out value="${message}"></c:out>

</body>
</html>
