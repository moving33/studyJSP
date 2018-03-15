<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-13
  Time: 오전 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String a = request.getRequestedSessionId();
    Cookie[] b = request.getCookies();

%>

<meta name="viewport" content="width=device-width, initial-scale = 1.0"/>
<html>
<head>
    <title>은노기의 JSP 2.3 Programing 공부 </title>
</head>
<style>
    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    td, th {
        border: 2px solid slateblue;
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #dddddd;
    }
</style>
<body>
<table>
    <!-- ch03 -->
    <tr>
        <th>
            ch03 JSP의 구성요소
        </th>
        <th>
            ch04 JSP의 내장객체와 영역
        </th>
        <th>
            ch05 JSP의 액션태그
        </th>
        <th>
            ch07 Ajax(Asynchronous Javascript+ XML)
        </th>
        <th>
            ch08  Java Bean , Logic with JSP
        </th>
    </tr>
    <tr>
        <td>
            <a href="ch03/declarationTest1.jsp">선언문 예제</a>
        </td>
        <!-- ch04 -->
        <td>
            <a href="ch04/responseRedirect.jsp">리다이렉트 예제</a>
        </td>
        <!-- ch05 -->
        <td>
            <a href="ch05/includeTestForm.jsp">include Action Tag Ex</a>
        </td>
        <!-- ch07 -->
        <td>
            <a href="ch07/jQTest.jsp">jQuery Test!</a>
        </td>
        <!-- ch08 -->
        <td>
            <a href="ch08/beanTestForm.jsp">Java Bean Test</a>
        </td>
    </tr>
    <tr>
        <td>
            <a href="ch03/scriptletTest2.jsp">스크립틀릿 예제</a>
        </td>
        <!-- ch04 -->
        <td>
            <a href="ch04/sessionTestForm.jsp">세션 로그인 예제</a>
        </td>
        <!-- ch05 -->
        <td>
            <a href="ch05/main.jsp"><b>Include 태그를 통한 Module화(그리드를 사용)</b></a>
        </td>
        <!-- ch07 -->
        <td>
            <a href="ch07/jQTest3.jsp">jQuery Test3 (mouse Event)</a>
        </td>
        <!-- ch08 -->
        <td>
            <a href="ch08/regForm.jsp">기본 회원 가입 양식</a>
        </td>
    </tr>
    <tr>
        <td>
            <a href="ch03/ifTestForm.jsp">if 문 예제</a>
        </td>
        <!-- ch04 -->
        <td>
            <a href="ch04/applicationTest.jsp">어플리케이션 Test예제</a>
        </td>
        <!-- ch05 -->
        <td>
            <a href="ch05/forwardForm.jsp"><b>Forward Tag의 사용</b></a>
        </td>
        <!-- ch07 -->
        <td>
            <a href="ch07/jQTest4.jsp">jQuery Ajax - load Method</a>
        </td>
    </tr>
    <tr>
        <td>
            <a href="ch04/requestTestForm1.jsp">request 객체</a>
        </td>
        <td>
        </td>
        <td>
        </td>
        <!-- ch07 -->
        <td>
            <a href="ch07/jQTest5.jsp">jQuery Ajax - load 응답처리 </a>
        </td>
    </tr>
    <!-- 5번째 예제 -->
    <tr>
        <td>
        </td>
        <td>
        </td>
        <td>
        </td>
        <!-- ch07 -->
        <td>
            <a href="ch07/jQTest8.jsp">jQuery Ajax - .ajax의 사용 </a>
        </td>
    </tr>
    <!-- 6번째 예제 -->
    <tr>
        <td>
        </td>
        <td>
        </td>
        <td>
        </td>
        <!-- ch07 -->
        <td>
            <a href="ch07/question/1.jsp">1번문제 </a>
        </td>
    </tr>



</table>
<br>
<b>현재 페이지 Session의 ID: </b>
<%=a%>
<br>
<br>
<b>현재 페이지의 사용되는 쿠키의 Name들 : </b>
<%
    for (int i = 0; i < b.length; i++) {
%><%=b[i].getName()%>&nbsp;

<%
    }
%>
</body>
</html>

