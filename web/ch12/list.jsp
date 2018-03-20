<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="ch12.board.BoardDataBean" %>
<%@ page import="java.util.List" %>
<%@ page import="ch12.board.BoardDBBean" %><%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-20
  Time: 오후 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="js/write.js"></script>
<link rel="stylesheet" href="style.css">
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    String id = "";

    int pageSize = 3; //한 페이지의 표시할 글의 수
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    String pageNum = request.getParameter("pageNum"); //화면에 표시할 페이지 번호
    if (pageNum == null) {//페이지 번호가 없으면 1페이지의 내용이 화면에 표시
        pageNum = "1";

    }

    int count = 0; // 전체 글의 수
    int currentPage = Integer.parseInt(pageNum); //현재 페이지 숫자로 파싱

    List<BoardDataBean> articleList = null; //글목록을 저장
    BoardDBBean dbPro = BoardDBBean.getInstance();
    count = dbPro.getArticleCount(); //전체 글 수 얻어냄


    if (count == (currentPage - 1) * pageSize) { //글삭제시 반영을위해 !
        currentPage -= 1;
    }

    int startRow = (currentPage - 1) * pageSize + 1; //현재 페이지에서의 시작글 번호 .

    try {
        if (count > 0) {//테이블에 저장된 글이 있으면 , 테이블에서 글 목록을 가져옴
            articleList = dbPro.getArticle(startRow, pageSize);
        }
        if (articleList.isEmpty()) { //테이블에 저장된 글이 없으면 전체 글수 :0
            count = 0;
        }
    } catch (Exception e) {
    }
%>
<%
    if (count == 0) {//게시판에 글이 없는 경우
%>
<div class="alert alert-success text-center">
    <strong>게시판에 저장된 글이 없습니다 ㅠ,ㅠ</strong>
</div>
<%
} else {
%>
<div class="container" style="margin:15px">
    <div class="huge-top">
        <button class="btn btn-normal pull-right" id="insert" style="margin-left: 20px">쓰기</button>
    </div>
    <table class="table table-board" style="margin: 15px">
        <colgroup>
            <col width="7%"><!--글번호 -->
            <col width="*"><!--제목 -->
            <col width="7%"><!--작성자 -->
            <col width="25%"><!--작성일 -->
            <col width="7%"><!--조회수 -->
        </colgroup>
        <thead>
        <th style="text-align: center">글 번호</th>
        <th style="text-align: center">제목</th>
        <th style="text-align: center">작성자</th>
        <th style="text-align: center">작성일</th>
        <th style="text-align: center">조회수</th>
        </thead>
        <%
            //글목록을 반복 처리
            for (int i = 0; i < articleList.size(); i++) {
                BoardDataBean article = articleList.get(i);
        %>
        <tr>
            <td><%=article.getNum()%>
            </td>
            <td>&nbsp;&nbsp;&nbsp;
                <a href="#collapseContent" data-toggle="collapse" aria-expanded="false"
                   aria-controls="content"><%=article.getSubject()%>
                </a>
                <div class="collapse" id="collapseContent">
                  <div id="collapse_1" ><%=article.getContent()%></div>
                </div>
            </td>

            <td><%=article.getWriter()%>
            </td>
            <td style="text-align: center;"><%=article.getReg_date()%>
            </td>
            <td style="text-align: center;"><%=article.getReadcount()%>
            </td>
        </tr>
        <%
            }
        %>

    </table>
</div>
<%
    }
%>