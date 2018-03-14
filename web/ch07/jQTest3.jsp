<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-14
  Time: 오후 1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>jQuery의 이벤트 처리</title>

    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
        $(document).ready(function(){
            $("p").mouseenter(function(){
                $("p").css("background-color", "yellow");
                $("p").text("!!!!");
            });
            $("p").mouseleave(function(){
                $("p").css("background-color", "lightgray");
                $("p").text("??????");
            });
        });
    </script>
</head>
<body>

<p>Move the mouse pointer over this paragraph.</p>

</body>
</html>
