<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-13
  Time: 오후 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");
    String hobby = request.getParameter("hobby");

    if (gender.equals("m")){
        gender = "남자";
    }if (gender.equals("f")){
        gender="여자";
    }else{
        gender= "몬스터";
    }
%>
<%=name%> 님의 정보는 다음과 같습니다.
<p>
    나이 : <%=age%><br>
    성별 : <%=gender%><br>
    취미 : <%=hobby%><br>
</p>
</body>
</html>
