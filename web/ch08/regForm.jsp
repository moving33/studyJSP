<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-15
  Time: 오후 1:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form method="post" action="regPro.jsp">
    <dl>
        <dd>
            <label for="id">아이디</label>
            <input type="text" name="id" id="id" autofocus required>

        </dd>
        <dd>
            <label for="pass">비번</label>
            <input type="password" name="pass" id="pass" required>

        </dd>
        <dd>
            <label for="name">이름</label>
            <input type="text" name="name" id="name"  required>

        </dd>
        <dd>
            <input type="submit" value="입력완료">
        </dd>
    </dl>
</form>