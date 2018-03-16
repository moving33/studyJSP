<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-16
  Time: 오전 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h2>JDBC DRIVER TEST</h2>

<%
    Connection conn = null;

    try{
        String jdbcUrl = "jdbc:mysql://192.168.88.128:3306/jsptest";
        String id = "moving33";
        String pass ="1234";

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl,id,pass);
        out.println("mySql Db.. connecting success!!...");

    }catch (ClassNotFoundException e){
        out.println("classNotFoundException 발생");
        e.printStackTrace();
    }catch (Exception e){
        e.printStackTrace();
    }
%>