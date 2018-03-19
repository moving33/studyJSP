<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-18
  Time: 오후 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<meta name="viewport" content="width=device-width, initial-scale = 1.0"/>
<link rel="stylesheet" href="style.css">
<script src="js/login.js"></script>
<%
    String id = "";
    try {
        id = (String) session.getAttribute("id");
%>
<%
    if (id == null || id.equals("")) {//인증되지 x 사용자
%>
<div id="status" class="loginForm">
    <form action="loginPro.jsp" id="login">
        <div class="row">
            <div class="col-sm-5">
                <label for="id">아이디</label>
            </div>
            <div class="col-sm-7">
                <input id="id" name="id" type="email" placeholder="" required>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-5">
                <label for="passwd">비밀번호 </label>
            </div>
            <div class="col-sm-7">
                <input id="passwd" name="passwd" type="password" required>
            </div>
        </div>
        <div class="buttonDiv">
            <button class="btn btn-primary" type="submit">로그인</button>
            <button class="btn btn-primary" id="signBtn">회원가입</button>
        </div>
    </form>
</div>
<%
} else { //인증된 사용자
%>
<div id="status">
    <ul>
        <li><strong><%=id%>
        </strong> 님이 로그인 하셨습니다.
        </li>
        <li>
            <button id="logout">로그아웃</button>
    </ul>
</div>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>