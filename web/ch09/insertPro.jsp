<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %><%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-16
  Time: 오후 1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>

<%
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    String name = request.getParameter("name");
    String tel = request.getParameter("tel");
    String addr = request.getParameter("addr");
    Timestamp register = new Timestamp(System.currentTimeMillis());
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        String jdbcURL = "jdbc:mysql://192.168.88.128:3306/jsptest";
        String dbID = "moving33";
        String dbpass = "1234";

        // sha 256 암호화

        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash = digest.digest(pass.getBytes("UTF-8"));
        StringBuffer hexString = new StringBuffer();

        for (int i = 0; i < hash.length; i++) {
            String hex = Integer.toHexString(0xff & hash[i]);
            if (hex.length() == 1) hexString.append('0');
            hexString.append(hex);
        }

        String SHApass = hexString.toString();

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcURL, dbID, dbpass);
        pstmt = conn.prepareStatement("INSERT INTO member VALUES (?,?,?,?,?,?)");
        pstmt.setString(1, id);
        pstmt.setString(2, SHApass);
        pstmt.setString(3, name);
        pstmt.setTimestamp(4, register);
        pstmt.setString(5, addr);
        pstmt.setString(6, tel);
        pstmt.executeUpdate();

        out.println("회원 가입을 축하합니다!");
%>
<a href="/index.jsp">첫화면으로 가기</a>
<%

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e1) {
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e1) {
            }
        }
    }
%>