<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-16
  Time: 오후 1:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<table>
    <tr>
        <th>
            ID
        </th>
        <th>
            PASSWORD
        </th>
        <th>
            NAME
        </th>
        <th>
            REG_DATE
        </th>
        <th>
            ADDRESS
        </th>
        <th>
            TEL
        </th>
    </tr>
    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbID = "moving33";
            String dbPass = "1234";
            String dbURL = "jdbc:mysql://192.168.88.128:3306/jsptest";

            conn = DriverManager.getConnection(dbURL, dbID, dbPass);

            pstmt = conn.prepareStatement("SELECT * FROM member");
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String id = rs.getString(1);
                String pass = rs.getString(2);
                String name = rs.getString(3);
                Timestamp reg = rs.getTimestamp(4);
                String addr = rs.getString(5);
                String tel = rs.getString(6);
    %>
    <tr>
        <td><%=id%>
        </td>
        <td><%=pass%>
        </td>
        <td><%=name%>
        </td>
        <td><%=reg%>
        </td>
        <td><%=addr%>
        </td>
        <td><%=tel%>
        </td>
    </tr>
    <%
            }//end while
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e1) {
                }
            }//end if
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e1) {
                }
            }//end if
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e1) {
                }
            }//end if
        }
    %>
</table>