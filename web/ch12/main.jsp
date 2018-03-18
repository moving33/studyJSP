<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-18
  Time: 오후 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<meta name="viewport" content="width=device-width, initial-scale = 1.0"/>

<html>
<head>
    <title>Title</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="style.css">
</head>
<body>
<div>
    <!-- Login , Query , other Nav -->
    <header class="headerTest">
        <nav>
            <div class="row" style="border: 1px solid black;">
                <!-- Query , Main Logo -->
                <div class="col-sm-7">
                </div>
                <%--other
                <div class="col-sm-2"></div>-- 나중에 기회되면 시도 --%>

                <!-- Login -->
                <div class="col-sm-5">
                    <jsp:include page="loginForm.jsp"/>
                </div>
            </div>
        </nav>
    </header>
    <article class="articleTest">
        <div class="articleTest_content">
            <jsp:include page="main_board.jsp"></jsp:include>
        </div>
    </article>

</div>
</body>
</html>
