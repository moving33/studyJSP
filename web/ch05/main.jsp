<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-13
  Time: 오후 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<meta name="viewport" content="width=device-width, initial-scale = 1.0"/>
<!-- 모듈화 작업 -->
<jsp:forward page="templateTest.jsp">
    <jsp:param name="CONTENTPAGE" value="content.jsp"/>
</jsp:forward>
