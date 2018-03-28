<%@ page import="java.util.ArrayList" %>
<%@ page import="pdf.actionTag.Customer" %><%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-26
  Time: 오후 2:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<String> singer = new ArrayList<String>();
    singer.add("박완규");
    singer.add("김경호");
    request.setAttribute("singer",singer);

    Customer[] customer = new Customer[2];
    customer[0] = new Customer();
    customer[0].setName("김");
    customer[0].setPhone("010");
    customer[0].setEmail("abc@abc.com");
    customer[1] = new Customer();
    customer[1].setName("정");
    customer[1].setPhone("011-42423");
    customer[1].setEmail("xyz@xyz.com");

    request.setAttribute("customer",customer);
%>
<html>
<head>
    <title>EL ex</title>
</head>
<body>
<ul>
    <li>${singer[0]},${singer[1]}</li>
</ul>
<br>
<ul>
    <li>name: ${customer[0].name}</li>
    <li>email: ${customer[0].email}</li>
    <li>phone:${customer[0].phone}</li>
</ul>
<br>
<ul>
    <li>name: ${customer[1].name}</li>
    <li>email: ${customer[1].email}</li>
    <li>phone:${customer[1].phone}</li>
</ul>
</body>
</html>
