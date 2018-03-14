<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-14
  Time: 오후 1:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>jQuery Ajax 메소드 - load</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#b1").click(function () {
                $("#result").load("test4.jsp");
            });
            $("#b2").click(function () {

            });

        });
    </script>

</head>
<body>
<button id="b1">결과</button>
<button id="b2">삭제</button>
<div id="result" >

</div>
</body>
</html>
