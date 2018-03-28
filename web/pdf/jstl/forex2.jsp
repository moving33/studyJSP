<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-27
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pdf.jstl.MemberVO" %>
<%@ page import="java.util.ArrayList" %><%
    MemberVO m1 = new MemberVO("첫놈","1@1.net",150);
    MemberVO m2 = new MemberVO("두번놈","1@1.net",200);
    MemberVO m3 = new MemberVO("셋째","1@1.net",100);
    ArrayList<MemberVO> a = new ArrayList<>();
    a.add(m1);
    a.add(m2);
    a.add(m3);
    request.setAttribute("d",a);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1">
    <tr>
        <th>번호</th>
        <th>이름</th>
        <th>이메일</th>
        <th>나이</th>
    </tr>
    <c:forEach var="m" items="${d}" varStatus="num">
        <tr>
            <td>${num.count}</td>
            <td>${m.name}</td>
            <td>${m.email}</td>
            <td>${m.age}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
