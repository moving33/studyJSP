<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-27
  Time: 오후 4:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>catchTag</title>
</head>
<body>
<c:catch var="ex">
    name 파라미터의 값 = <%=request.getParameter("name")%>
    <br>
    <%
        if(request.getParameter("name").equals("aa")){}
    %>
    <c:if test="${param.name.equals('test')}">
        name 은 ${param.name} 입니다.
    </c:if>
</c:catch>
<br>
<c:if test="${ex != null}">
    예외가 발생해버렸어요
    <br>
    ${ex}
</c:if>

</body>
</html>
