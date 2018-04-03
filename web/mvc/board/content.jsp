<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-04-03
  Time: 오후 2:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>viewArticle</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style.css">

    <script>
        //수정 script
        function updateArticle(article_num, page_num) {
            var passwd = $("#passwd").val();
            if (passwd == "" || passwd == null) {
                alert("비밀번호를 입력해주세요");
                return false;
            }
            var content = $("#content").val();
            var subject = $("#subject").val();
            var num = article_num;
            var pageNum = page_num;

            $.post(
                "/board/updateForm.do", {
                    content: content,
                    subject: subject,
                    num: num,
                    passwd: passwd,
                    pageNum: pageNum
                }, function (data) {
                    if (data == 1) {
                        alert("수정 성공");
                        document.location.href = "/board/list.do";
                    } else {
                        alert("비밀번호가 틀립니다.");
                        return false;
                    }
                }
            )
        }

        //삭제 script

        function deleteArticle(article_num, page_num) {
            var passwd = $("#passwd").val();
            if (passwd == "" || passwd == null) {
                alert("비밀번호를 입력해주세요");
                return false;
            }
            var select = confirm("정말 삭제 하시겠습니까?");
            if (select) {
                var pageNum = page_num;
                var num = article_num;
                $.post(
                    "/board/deletePro.do",{
                        pageNum : pageNum,
                        num : num,
                        pass : passwd
                    },function (data) {
                        if (data == 1) {
                            alert("수정 성공");
                            document.location.href = "/board/list.do?pageNum="+pageNum;
                        } else {
                            alert("비밀번호가 틀립니다.");
                            return false;
                        }
                    }
                )
            } else {
            }
        }


    </script>

</head>
<body>

<div class="container" style="margin:15px">
    <div class="huge-top" style="text-align: left; margin-left: 15%; margin-bottom: 10px;">
        <button class="btn btn-normal pull-right" id="insert_re" style="margin-left: 20px"
                onclick="document.location.href='/board/writeForm.do?num=${article.num}&ref=${article.ref}&ref_step=${article.ref_step}&re_level=${article.re_level}&re=1'">
            덧글 쓰기
        </button>
        <button class="btn btn-normal pull-right" id="modify" style="margin-left: 3px"
                onclick="return updateArticle(${article.num},${pageNum})">수정
        </button>
        <button class="btn btn-normal pull-right" id="delete" style="margin-left: 3px"
                onclick="return deleteArticle(${article.num},${pageNum})">삭제
        </button>
        <button class="btn btn-normal pull-right" style="margin-left: 3px" id="goBack" onclick="history.back()">뒤로
            가기
        </button>
    </div>

    <div class="text-center" id="writeNew">
        <div id="writeForm">
            <table id="write-form" class="bbs-table">
                <tr>
                    <td style="text-align: center">제목</td>

                    <td><input type="text" name="subject" id="subject" style="width: 90%;"
                               value="${article.subject}"/></td>
                </tr>
                <tr>
                    <td style="text-align: center">작성자</td>
                    <td>${article.writer}</td>
                </tr>
                <tr>
                    <td style="text-align: center">조회수</td>
                    <td>${article.readcount}</td>
                </tr>
                <td colspan="2">
                    <textarea name="content" id="content" rows="17" cols="100">${article.content}</textarea>
                </td>
                </tr>
                <tr>
                    <td>비밀 번호</td>
                    <td><input type="password" name="passwd" id="passwd" required/></td>
                </tr>
            </table>
        </div>
    </div>
</div>

</body>
</html>
