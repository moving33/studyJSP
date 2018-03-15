<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-15
  Time: 오후 1:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="testBean" class="ch08.bean.TestBean">
    <jsp:setProperty name="testBean" property="id"></jsp:setProperty>
</jsp:useBean>
입력된 ID = <jsp:getProperty name="testBean" property="id" />
