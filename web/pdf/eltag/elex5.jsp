<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-26
  Time: 오후 3:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<html>
<head>
    <title>표현언어의 사용예제</title>
</head>
<body>
<br>
<form action="" method="post">
    <input type="text" name="name" value="${param['name']}">
    <input type="submit" value="확인">

</form>
<p>
    이름은 : ${param.name} 입니다.
</p>
</body>
</html>
