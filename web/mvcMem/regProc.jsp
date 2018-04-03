<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-29
  Time: 오후 4:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${result == true}">
    success
</c:if>
<c:if test="${result != true}">
    fail
</c:if>