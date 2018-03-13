<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-13
  Time: 오후 2:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.setMaxInactiveInterval(10);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    if (session.getAttribute("id") == null) { //세션이 설정되어 있지 않은 경우
%>
<form method="post" action="sessionTest.jsp">
    <div id="unauth">
        <dl>
            <dd>
                <label for="id">아이디</label>
                <input id="id" name="id" type="text" placeholder="Your ID" autofocus required>
            </dd>
            <dd>
                <label for="pass">패스워드</label>
                <input id="pass" name="pass" type="password" required>
            </dd>
            <dd>
                <input type="submit" value="로그인">
            </dd>
        </dl>
    </div>
</form>
<%=session.getId()%> , <%=session.getMaxInactiveInterval()%>
<%
} else {
%>
<form method="post" action="logout.jsp">
    <div id="auth">
        <dl>
            <dd>
                <%=session.getAttribute("id")%> 님이 입장하셨습니다...
            </dd>
            <dd>
                <input type="submit" value="로그아웃">
            </dd>
        </dl>
    </div>
</form>
<%
    }
%>

</body>
</html>
