<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-13
  Time: 오전 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>#</title>
</head>
<body>
<h2> request 예제 - 요청 Mehtod</h2>
<form method="post" action="requestTest1.jsp" style="width: 50%;">
    <dl>
        <dd>
            <label for="name">이름</label>
            <input type="text" name="name" placeholder="Your Name" id="name" autofocus required>
        </dd>
        <br>
        <dd>
            <label for="age">나이</label>
            <input type="number" id="age" name="age" min="20" max="99" required>
        </dd>
        <br>
        <dd>
            <fieldset>
                <legend>성별</legend>
                <input id="genderMen" name="gender" type="radio" value="m" checked>
                <label for="genderMen">남</label>
                <input id="genderWoMen" name="gender" type="radio" value="f">
                <label for="genderWomen">여</label>
                <input id="monster" name="gender" type="radio" value="t">
                <label for="monster">괴물</label>
            </fieldset>
        </dd>
        <br>
        <dd>
            <label for="hobby">취미</label>
            <select id="hobby" name="hobby" required>
                <option value="잠자기">잠자기
                <option value="영화보기">영화보기
                <option value="뛰기">뛰기
                <option value="점프하기">점프하기
            </select>

        </dd>
        <dd>
            <input type="submit" value="전송">
        </dd>

    </dl>
</form>

사용중인 프로토콜 = <%=request.getProtocol()%>
<br>
web Browser Host name = <%=request.getRemoteHost()%>
<br>
context path =  <%=request.getContextPath()%>
<br>
모든 헤더의 이름 들 =
<br>
<%
    Enumeration c = request.getHeaderNames();
    while (c.hasMoreElements()) {
        String d = (String) c.nextElement();
        if (c.hasMoreElements()) {
%><%=d%>&nbsp;,&nbsp<%
} else {
%><%=d%>
<%
        }
    }
%>

</body>
</html>
