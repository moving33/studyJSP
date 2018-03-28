<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-27
  Time: 오후 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="vo" class="pdf.jstl.MemberVO"></jsp:useBean>
<html>
<head>
    <title>JSTL</title>
</head>
<body>
<c:set target="${vo}" property="name" value="Lachiel Adams"></c:set>
<c:set target="${vo}" property="email" value="abc@abc.com"></c:set>
<c:set var="age" value="31"></c:set>
<c:set target="${vo}" property="age" value="${age}"></c:set>
<c:import url="/pdf/eltag/elex5.jsp" var="url"></c:import>
<h3>회원정보</h3>
<ul>
    <li>이름 : ${vo.name}</li>
    <li>이메일 : ${vo.email}</li>
    <li>나이 : ${vo.age}</li>
</ul>
<hr>
browser의 변수값 설정
<br>
USER - AGET :<c:set var="browser" value="${header['User-Agent']}"></c:set>
<!-- 내보내기 -->
<c:out value="${browser}"></c:out>
<br>
<!-- remove 사용 해보기 -->
<c:remove var="browser"></c:remove>
USER - AGET :
<c:out value="${browser}"></c:out>
<br>
jstl import 하기
${url}
</body>
</html>
