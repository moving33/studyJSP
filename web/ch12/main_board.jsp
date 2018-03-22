<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-18
  Time: 오후 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<meta name="viewport" content="width=device-width, initial-scale = 1.0"/>
<%
    String selectNum = "";
    String pageNum = "";
    selectNum = request.getParameter("selectNum");
    pageNum = request.getParameter("pageNum");
    String id = "";

    try {
        id = (String) session.getAttribute("id");
%>
<%
    if (id == null || id.equals("")) {
%>
<div class="alert alert-success text-center">
    <strong>로그인 하세요 ! 게시판은 회원만 볼 수 있습니다!</strong>
</div>
<%

} else {
%>
<div>
    <jsp:include page="list.jsp"></jsp:include>
</div>
<div id="contentForm">
</div>


<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>