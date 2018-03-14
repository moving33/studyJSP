<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-14
  Time: 오후 4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>jQuery Ajax Method - $.ajax</title>
    <style type="text/css">
        #result {
            width: 200px;
            height: 200px;
            border: 5px double darkblue;
        }
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#b1").click(function () {
                //요청 페이지에 전송할 데이터.
                var query = {name: "J", age: "20", hobby: "see the movie"};

                $.ajax({
                    type: "POST",  //전송 방식
                    url: "process.jsp", // 요청 페이지
                    data: query, //전송할 데이터
                    success: function (data) { //call back
                        alert(data);
                    }
                });
            });
        });
    </script>
</head>
<body>
<button id="b1">클릭!</button>
</body>
</html>
