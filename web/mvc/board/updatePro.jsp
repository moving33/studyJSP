<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-04-03
  Time: 오후 5:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result == 1}">1
    <%--<script>
        alert("수정에 성공했습니다.");
        document.location.href="/board/list.do";
    </script>--%>
</c:if>
<c:if test="${result == 0}">0
   <%-- <script>
        alert("비밀번호가 맞지 않습니다");
        document.location.href="/board/content.do?num=${num}&pageNum=${pageNum}";
    </script>--%>
</c:if>
