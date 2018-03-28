<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-26
  Time: 오후 2:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true"%>
<%
    request.setAttribute("name","J");

%>
<html>
<head>
    <title>표현언어의 기본객체</title>
</head>
<body>
<label>
    표현언어의 기본객체 : pageContext,pageScope,requestScope,sessionScope,applicationScope,param,prarmValues,header,headerValues,cookie,initParam
</label>
<p>
    요쳥 URI : ${pageContext.request.requestURI}
    request의 name 속성 : ${requestScope.name}
    code 파라미터 : ${param.code}
</p>
</body>
</html>
