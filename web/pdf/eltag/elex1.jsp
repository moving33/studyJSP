<%@ page import="pdf.actionTag.Customer" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Scanner" %><%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-26
  Time: 오후 2:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    //beans 사용
    Customer customer = new Customer();
    customer.setName("손오공");
    customer.setEmail("abc@abc.net");
    customer.setPhone("010-1234-1234");
    request.setAttribute("customer",customer);

    //hashMap 사용
    HashMap<String, String> map = new HashMap<String, String>();
    map.put("name","ramborgini");// key,value
    map.put("marker","Jaguer");// key,value
    request.setAttribute("car",map);
%>

<html>
<head>
    <title>EL Example</title>
</head>
<body>
<ul>
    <li>이름:${customer.name}  </li>
    <li>메일:${customer.email}  </li>
    <li>전화:${customer.phone}  </li>
</ul>
<br>
<hr>
<ul>
    <li>자동차 : ${car.name}   </li>
    <li>제조사 : ${car.marker}  </li>
</ul>
</body>
</html>
