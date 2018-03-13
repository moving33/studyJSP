<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-13
  Time: 오후 5:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form method="post" action="includeTest.jsp">
    <dl>
        <dd>
            <label for="name">이름</label>
            <input id="name" name="name" type="text" placeholder="Your Name" required>
        </dd>
        <dd>
            <label for="pagename">포함할페이지</label>
            <input id="pagename" name="pagename" type="text" value="includedTest.jsp" required>
        </dd>
        <dd>
            <input type="submit" value="전송">
        </dd>
    </dl>
    </form>