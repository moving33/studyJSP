<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-13
  Time: 오후 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<meta name="viewport" content="width=device-width, initial-scale = 1.0"/>
<%
    String contentPage = request.getParameter("CONTENTPAGE");
%>
<style>
    * {
        box-sizing: border-box;
    }

    body {
        font-family: Arial, Helvetica, sans-serif;
    }

    /* Style the header */
    .header {
        background-color: #f1f1f1;
        padding: 30px;
        text-align: center;
        font-size: 35px;
    }

    /* Create three equal columns that floats next to each other */
    .column {
        float: left;
        width: 33.33%;
        padding: 10px;
        height: 300px; /* Should be removed. Only for demonstration */
        border:1px solid black;
    }

    /* Clear floats after the columns */
    .row:after {
        content: "";
        display: table;
        clear: both;
    }

    /* Style the footer */
    .footer {
        background-color: #f1f1f1;
        padding: 10px;
        text-align: center;
    }
</style>

<div class="header">
    <jsp:include page="top.jsp" flush="false"></jsp:include>
</div>
<div class="row">
    <div class="column">
        <jsp:include page="left.jsp" flush="false"></jsp:include>
    </div>

    <div class="column">
        <jsp:include page="<%=contentPage%>" flush="false"></jsp:include>
    </div>

    <div class="column">
    </div>
</div>

<div class="footer">
    <jsp:include page="bottom.jsp" flush="false"></jsp:include>
</div>

