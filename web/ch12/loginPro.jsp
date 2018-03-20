<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-19
  Time: 오후 1:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="ch11.logon.LogonDBBean"%>
<%
    request.setCharacterEncoding("utf-8");
%>

<%
    //사용자가 입력한 아이디와 비밀번호
    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");
    LogonDBBean manager = LogonDBBean.getInstance();
    int check = manager.userCheck(id,passwd);

    if(check == 1){
        session.setAttribute("id",id);
    }
    out.print(check); //data로 반환되는 데이터
%>
