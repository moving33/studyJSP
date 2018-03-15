<%@ page import="java.sql.Timestamp" %><%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-15
  Time: 오후 1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="regBean" class="ch08.register.RegisterBean" scope="page">
    <jsp:setProperty name="regBean" property="*"></jsp:setProperty>
</jsp:useBean>

<%
    regBean.setReg_date(new Timestamp(System.currentTimeMillis()));
%>
아이디 : <jsp:getProperty name="regBean" property="id" />
<br>
비번 : <jsp:getProperty name="regBean" property="pass" />
<br>
이름  : <jsp:getProperty name="regBean" property="name" />
<br>
가입일 : <jsp:getProperty name="regBean" property="reg_date" />


