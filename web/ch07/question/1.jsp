<%--
  Created by IntelliJ IDEA.
  User: alfo2-8
  Date: 2018-03-14
  Time: 오후 4:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        #result {
            width: 200px;
            height: 200px;
            border: 5px double darkblue;
        }

        #result2 {
            width: 200px;
            height: 200px;
            border: 5px double slateblue;
        }
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#bt1").click(function () {
                var n = $('#id').val();
                var p = $('#pass').val();
                $("#result").html("아이디는 " + n + "<br>비밀번호는 :" + p);
            });

            $("#bt2").click(function () {
                alert("aa");
                $("#result2").load("test1.jsp");
            });

            $("#bt3").click(function () {
                var n = $('#id').val();
                alert(n);
                var query = {
                    name: n
                }
                $.ajax({
                    type: "POST",
                    url: "test2.jsp",
                    data: query,
                    success: function (data) {
                        $("#result").html(data);
                    }
                })
            });

        });
    </script>

</head>
<body>
<h3>아이디와 비밀번호 입력</h3>
<button id="bt2">2번문제</button>
<button id="bt3">3번문제</button>
<form>
    <label for="id">아이디</label>
    <input type="text" id="id" name="id" required>
    <br>
    <label for="pass">패스워드</label>
    <input type="password" id="pass" name="pass" required>
    <br>
    <input type="button" id="bt1" value="클릭">
</form>

<div id="result" style="float: left;"></div>
<div id="result2" style="float: left; margin-left: 50px">여기에 .jsp가 로드됨.2번문제</div>
</body>
</html>

