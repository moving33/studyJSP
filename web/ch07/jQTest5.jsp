<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-14
  Time: 오후 3:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>jQury Ajax 메소드 - load() 응답처리</title>
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
                $("#result").load("xhrTest.txt", function (res, stu, xhr) {
                    if (stu == "success") {
                        alert("로드성공");
                    }
                    if (stu == "error") {
                        alert("에러: " + xhr.status + "번 에러입니다.");
                    }
                });
            });
            //버튼 2
            $("#b2").click(function () {
               $.get("test5.txt",function (data, status) {
                   alert("Data : "+data +"\nStatus : "+ status);
               }) ;
            });
        });
    </script>
</head>
<body>

<button id="b1">결과</button>
<button id="b2">결과2(get)</button>
<div id="result"></div>


</body>
</html>
