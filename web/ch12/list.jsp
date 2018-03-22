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
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    String id = "";

    int pageSize = 5; //한 페이지의 표시할 글의 수
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    String pageNum = request.getParameter("pageNum"); //화면에 표시할 페이지 번호
    if (pageNum == null) {//페이지 번호가 없으면 1페이지의 내용이 화면에 표시
        pageNum = "1";

    }

    int count = 0; // 전체 글의 수
    int currentPage = Integer.parseInt(pageNum); //현재 페이지 숫자로 파싱
    System.out.println(currentPage + ": 파싱한 페이지 번호");

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
                <!-- 들여쓰기, 답글 처리 -->
                <%
                    int wid = 0;
                    if (article.getRe_level() > 0) {
                        wid = 5 * (article.getRe_level());
                %>
                <img src="/image/KakaoTalk_20180320_113844011.gif" width="<%=wid%>" height="16">
                <img src="/image/KakaoTalk_20180320_113843804.gif">
                <%
                    }
                %>
                <a name="selectArticleNum" href="#"
                   onclick="selectArticle(<%=article.getNum()%>,<%=pageNum%>)"><%=article.getSubject()%>
                </a>
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

<%-- 페이지 이동 처리 --%>

<div class="pagePro" style="text-align: center; margin: auto; display: table;">
    <%-- pagination 사용 --%>
    <ul class="pagination">
        <%
            if (count > 0) {//글이 있어야 작동
                int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); //전체 페이지 블락개수를 정하는
                int startPage = 1;
                int pageBlock = 3; // 페이지들의 블록 단위 지정.
                System.out.println(currentPage + ":현재 페이지");
                //페이지 블록의 시작 블록의 NUMBER를 구한다.
                if (currentPage % pageBlock != 0){
                    startPage = (int)(currentPage / pageBlock) * pageBlock + 1; //시작되는 페이지
                    System.out.println(startPage+" :시작 페이지");
                } else {
                    startPage = ((int) (currentPage / pageBlock) - 1) * pageSize + 1;
                }


                int endPage = startPage + pageBlock - 1;  // 블록단위를 지정하기 위해서

                if (endPage > pageCount) { // 끝페이지가 전체 페이지 수보다 클경우는 존재 하지 x pageCount에 맞춘다.
                    endPage = pageCount;
                }
                if (startPage > pageBlock) {//스타트 페이지가 페이지 블락보다 크다는 얘기는 뒤에 페이지가 있다는걸 의미하므로 뒤쪽 블락을 보려는 키 생성하기%>
        <li class="page-item">
            <button class="page-link" onclick="p(this)" name="<%=startPage-pageBlock%>" id="juP">Previous</button>
        </li>

    <%
        }
        //pageBlock 숫자 logic
        for (int i = startPage; i <= endPage; i++) {
            if (currentPage == i) {//현재페이지 css표시
    %>
    <li class="page-item active"></li>
    <button name="<%=i%>" onclick="p(this)" class="page-link"><%=i%>
    </button>
    </li>
    <%
    } else {%>
    <li class="page-item">
        <button name="<%=i%>" onclick="p(this)" class="page-link"><%=i%>
        </button>
    </li>
    <%
            }
        }
        if (endPage < pageCount) {//뒤에 페이지가 더 있다는 이야기 %>
    <li class="page-item">
        <button id="juN" name="<%=startPage+pageBlock%>" onclick="p(this)" class="page-link">Next</button>
    </li>
    <%
            }
        }
    %>
    </ul>
</div>