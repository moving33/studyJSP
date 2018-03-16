<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-16
  Time: 오후 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form method="post" action="insertPro.jsp">
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
            <label for="addr">주소</label>
            <input type="text" name="addr" id="addr"  required>

        </dd>
        <dd>
            <label for ="tel">전화번호</label>
            <input type="tel" id="tel" name="tel">
        </dd>
        <dd>
            <input type="submit" value="입력완료">
            <input type="reset" value="다시작성">
        </dd>
    </dl>
</form>

<%
    String test = "e5b8d466a948db9d142e674170b3eea80527e70179d21ae3794c5ce00d3a25f2";
   byte[] a =test.getBytes();

%>
<%=a.toString()%> bit