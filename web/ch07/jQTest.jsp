<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-14
  Time: 오전 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>jQuery Test Page</title>
    <style>
        div#displayArea{
            width: 200px;
            height: 200px;
            border: 5px double darkblue;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $("button").click(function () {
                $("#displayArea").text("wowwowowow!!");
            });
        });
    </script>
</head>

<body>
<div id="displayArea">이곳의 내용이 변경</div>
<button>표시</button>

</body>
</html>




