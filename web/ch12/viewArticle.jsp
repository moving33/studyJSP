<%@ page import="ch12.board.BoardDataBean" %>
<%@ page import="ch12.board.BoardDBBean" %><%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-21
  Time: 오전 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
    String selectNum1 = request.getParameter("selectNum");
    String pageNum = request.getParameter("pageNum");
    BoardDBBean dbPro = BoardDBBean.getInstance();
    BoardDataBean article = new BoardDataBean();
    article = dbPro.updateGetArticle(selectNum1);
%>
<%
    /*if(selectNum1 != null) {
        int num = Integer.valueOf(selectNum1);
        article = dbPro.updateGetArticle(num);
    }*/
%>

<input type="hidden" value="<%=article.getNum()%>" id="selectNum">
<input type="hidden" value="<%=article.getRef()%>" id="selectRef">
<input type="hidden" value="<%=article.getRef_step()%>" id="selectRe_step">
<input type="hidden" value="<%=article.getRe_level()%>" id="selectRe_level">
<input type="hidden" value="<%=pageNum%>" id="select_pageNum">
<div class="container" style="margin:15px">
    <div class="huge-top" style="text-align: left; margin-left: 15%; margin-bottom: 10px;">
        <button class="btn btn-normal pull-right" id="insert_re" style="margin-left: 20px" onclick="writeRe()">덧글 쓰기</button>
        <button class="btn btn-normal pull-right" id="modify" style="margin-left: 3px">수정</button>
        <button class="btn btn-normal pull-right" id="delete" style="margin-left: 3px">삭제</button>
        <button class="btn btn-normal pull-right"  style="margin-left: 3px" id="goBack" onclick="goBack(<%=pageNum%>)">뒤로 가기</button>
    </div>
    <div class="text-center" id="writeNew">
        <div id="writeForm">
            <input type="hidden" name="boardCd" value="free"/>
            <table id="write-form" class="bbs-table">
                <tr>
                    <td style="text-align: center">제목</td>

                    <td><input type="text" name="subject" id="subject" style="width: 90%;"
                               value="<%=article.getSubject()%>"
                               disabled/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="content" id="content" rows="17" cols="100"><%=article.getContent()%></textarea>
                    </td>
                </tr>
                <tr>
                    <td>비밀 번호</td>
                    <td><input type="password" name="passwd" id="passwd" required/></td>
                </tr>
                <tr>
                    <td>첨부 파일</td>
                    <td><input type="file" name="attachFile"/></td>
                </tr>
            </table>
        </div>
    </div>
</div>