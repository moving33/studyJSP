<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-20
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="js/write.js"></script>
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    //제목글의 경우 갖는 값
    int num = 0, ref = 1, re_step = 0, re_level = 0;
    int pageNum = 1;

    try {//댓글을 경우 갖는 값
        if (request.getParameter("num") != null) {//댓글
            //제목글의 글번호, 그룹화 번호, 그룹화 내의 순서, 들여쓰기 정도가
            //list.jsp 에서 넘어옴

            num = Integer.parseInt(request.getParameter("num"));
            ref = Integer.parseInt(request.getParameter("ref"));
            re_step = Integer.parseInt(request.getParameter("re_step"));
            re_level = Integer.parseInt(request.getParameter("re_level"));
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
            //todo
        }
%>
<input type="hidden" id="num" value="<%=num%>">
<input type="hidden" id="ref" value="<%=ref%>">
<input type="hidden" id="re_step" value="<%=re_step%>">
<input type="hidden" id="re_level" value="<%=re_level%>">
<div class="alert alert-success text-center">
    <strong>당신의 생각을 표현하세요 !</strong>
</div>
<div class="text-center" id="writeNew">
    <h3>새 글쓰기</h3>
    <div id="writeForm">
        <input type="hidden" name="boardCd" value="free"/>
        <table id="write-form" class="bbs-table">
            <tr>
                <td style="text-align: center">제목</td>
                <%
                    if (num != 0) {//댓글
                %><img src="/image/KakaoTalk_20180320_113843804.gif">
                <%
                    }
                %>
                <td><input type="text" name="subject" id="subject" style="width: 90%;" required /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <textarea name="content" id="content" rows="17" cols="100"></textarea>
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
        <div style="padding-bottom: 15px;">
            <button id="regist" value="<%=pageNum%>" class="btn" >등록</button>
            <button id="cancle" value="<%=pageNum%>" class="btn">취소</button>
            <button id="viewList" value="<%=pageNum%>" class="btn">목록</button>
        </div>
    </div>
</div>
<%
    } catch (Exception e) {
    }
%>
