<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-13
  Time: 오전 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<meta name="viewport" content="width=device-width, initial-scale = 1.0"/>
<html>
<head>
    <title>if문 ex</title>
</head>
<body>
<h2>
    if - else 문 예제 - 좋아하는 색 선택
</h2>
<form method="post" action="ifTest.jsp">
    <dl>
        <dd>
            <label for="name">이름</label>
            <input id="name" name="name" type="text" placeholder="your Name" autofocus required>
        </dd>
        <dd>
            <label for="color">색선택</label>
            <select id="color" name="color" required>
                <option value="blue" selected>파랑색</option>
                <option value="green">초록색</option>
                <option value="red">빨간색</option>
            </select>
        </dd>
        <dd>
            <input type="submit" value="확인">
        </dd>
    </dl>
</form>

</body>
</html>
