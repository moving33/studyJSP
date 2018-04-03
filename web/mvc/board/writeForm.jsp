<%--
  Created by IntelliJ nameEA.
  User: J
  Date: 2018-04-03
  Time: 오전 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>글쓰기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="/mvc/board/script.js"></script>

</head>
<body>
<%--글 정렬 필요 param--%>
<c:out value="${ref}"></c:out>
<c:out value="${ref_step}"></c:out>
<c:out value="${re_level}"></c:out>
<c:choose>
<c:when test="${re == 0}">
<div class="alert alert-success text-center">
    <strong>당신의 생각을 적어주세요 !</strong>
</div>
<div class="text-center" name="writeNew" style="margin: auto">
    <h3>새 글쓰기</h3>

    </c:when>
    <c:otherwise>
    <div class="alert alert-success text-center">
        <strong>타인을 향한 지나친 비판이나 욕설은 제제 대상입니다 !</strong>
    </div>
    <div class="text-center" name="writeNew">
        <h3>댓글 쓰기</h3>
        </c:otherwise>
        </c:choose>
        <div name="writeForm">
            <form method="post" action="/board/writePro.do">
                <input type="hidden" name="num" value="${num}">
                <input type="hidden" name="ref" value="${ref}">
                <input type="hidden" name="step" value="${ref_step}">
                <input type="hidden" name="level" value="${re_level}">
                <table name="write-form" style="margin: auto">
                    <td style="text-align: center">제목</td>
                    <%--답글일경우--%>
                    <c:if test="${re_level != 0}">
                        <td>
                            <input type="text" name="subject" style="width: 90%" required
                                   value="[ 답 글 ]">
                        </td>
                    </c:if>
                    <td>
                        <input type="text" name="subject" style="width: 90%" required>
                    </td>
                    <%-- content --%>
                    <tr>
                        <td colspan="2">
                            <textarea name="content" name="content" rows="17" cols="100"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">작성자</td>
                        <td><input type="text" name="writer" name="writer" required/></td>

                    </tr>
                    <tr>
                        <td style="text-align: center">비밀 번호</td>
                        <td><input type="password" name="passwd" required/></td>
                    </tr>
                </table>
                <br>
                <div style="padding-bottom: 15px; margin-right: 35%;">
                    <button name="regist" class="btn" type="submit">등록</button>
                    <button name="cancle" class="btn">취소</button>
                    <button name="viewList" class="btn" onclick="backToList()">목록</button>
                </div>
            </form>
        </div>
        <%--글쓰기폼 //end --%>
    </div>

</body>
</html>
