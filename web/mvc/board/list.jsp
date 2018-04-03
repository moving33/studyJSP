<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-04-02
  Time: 오후 1:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>LIST</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style.css">
    <%--검색 스크립트--%>
    <script>
        function searchArticle() {
            var searchValue = $("#searchValue").val().trim();
            var option = $("#searchOption").val();
            if (option == "Choose...") {
                alert("검색 옵션을 선택하세요");
                return false;
            }
            document.location.href="/board/searchPro.do?query="+searchValue+"&option="+option;
        }

    </script>
</head>
<body>
<div class="container" style="margin:15px">
    <div class="huge-top">
        <button class="btn btn-primary" id="insert" style="margin-left: 20px"
                onclick="location.href='/board/writeForm.do'">쓰기
        </button>
        <button class="btn btn-primary" onclick="location.href='/board/list.do'">목록
        </button>
    </div>
    <%--검색이 아닌--%>
    <c:if test="${search == null}">
        <c:if test="${count == 0}">
            <div class="alert alert-success text-center">
                <strong>게시판에 저장된 글이 없습니다 ㅠ,ㅠ</strong>
            </div>
        </c:if>
        <c:if test="${count > 0}">
            <table class="table table-bordered" style="margin: 15px">
                <colgroup>
                    <col width="7%">
                    <col width="*">
                    <col width="10%">
                    <col width="22%">
                    <col width="7%">
                    <col width="7%">
                </colgroup>
                <thead style="text-align: center">
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
                <th>IP주소</th>
                </thead>
                <c:forEach var="voList" items="${voList}">
                    <tr>
                            <%--글번호--%>
                        <td>
                            <c:out value="${number}"></c:out>
                            <c:set var="number" value="${number-1}"></c:set>
                        </td>
                            <%--제목--%>
                        <td>
                            <c:if test="${voList.ref_step > 0}">
                                <img src="/image/KakaoTalk_20180320_113844011.gif" width="${15 * voList.re_level}"
                                     height="16">
                                <img src="/image/KakaoTalk_20180320_113843804.gif">
                            </c:if>
                            <a href="/board/content.do?num=${voList.num}&pageNum=${currentPage}">
                                    ${voList.subject}
                            </a>
                            <c:if test="${voList.readcount >= 20}">
                                <img src="/image/KakaoTalk_20180320_113843909.gif" border="0" height="16">
                            </c:if>
                        </td>
                            <%--작성자--%>
                        <td class="text-center">
                                ${voList.writer}
                        </td>
                            <%-- 작성일 --%>
                        <td class="text-center">
                                ${voList.reg_date}
                        </td>
                            <%--조회수--%>
                        <td class="text-center">
                                ${voList.readcount}
                        </td>
                        <td class="text-center">
                                ${voList.ip}
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <%--페이징처리--%>
        <div style="margin-left: 20px;">
            <div class="row bg-light">
                <div class="col-6">
                    <div class="row">
                        <div class="col-auto" style="margin-top: 3px">
                            <div class="input-group">
                                <div class="input-group-prepend" style="margin-top: 5px;">
                                    <label class="input-group-text" for="searchOption">Options</label>
                                </div>
                                <select class="custom-select" id="searchOption" style="margin-top: 5px;">
                                    <option selected>Choose...</option>
                                    <option value="writer">작성자</option>
                                    <option value="subject">제목</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-auto" style="padding: 0px">
                            <nav class="navbar navbar-light">
                                <div class="form-inline">
                                    <input class="form-control mr-sm-2" type="search" placeholder="Search"
                                           aria-label="Search" id="searchValue">
                                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit"
                                            onclick="return searchArticle()">Search
                                    </button>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="col-6" style="margin-top: 9px;">
                    <ul class="pagination">
                        <c:if test="${count>0}">
                            <c:set var="imsi" value="${count % pageSize == 0 ? 0 : 1}"></c:set>
                            <fmt:parseNumber var="pageCount" value="${count / pageSize +imsi}"
                                             integerOnly="true"></fmt:parseNumber>
                            <c:set var="pageBlock" value="${3}"></c:set>
                            <%--int 파싱--%>
                            <fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}"
                                             integerOnly="true"></fmt:parseNumber>
                            <c:set var="startPage" value="${result * pageBlock+1}"></c:set>
                            <c:set var="endPage" value="${startPage+pageBlock-1}"></c:set>
                            <c:set var="endPage" value="${startPage+pageBlock-1}"></c:set>
                            <c:if test="${endPage > pageCount}">
                                <c:set var="endPage" value="${pageCount}"></c:set>
                            </c:if>
                            <c:if test="${startPage > pageBlock}">
                                <li class="page-item">
                                    <button class="page-link"
                                            onclick="location.href='/board/list.do?pageNum=${startPage-pageBlock}'">
                                        Previous
                                    </button>
                                </li>
                            </c:if>
                            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                <c:choose>
                                    <c:when test="${currentPage == i}">
                                        <li class="page-item active"></li>
                                        <button onclick="location.href='/board/list.do?pageNum=${i}'"
                                                class="page-link">${i}
                                        </button>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"></li>
                                        <button onclick="location.href='/board/list.do?pageNum=${i}'"
                                                class="page-link">${i}
                                        </button>
                                        </li>
                                    </c:otherwise>
                                </c:choose>

                            </c:forEach>
                            <c:if test="${endPage < pageCount}">
                                <li class="page-item">
                                    <button onclick="location.href='/board/list.do?pageNum=${startPage+pageBlock}'"
                                            class="page-link">Next
                                    </button>
                                </li>
                            </c:if>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </c:if>
    <%--검색--%>
    <c:if test="${search == 0}">
        <script>
            alert("검색 결과가 없습니다.");
            document.location.href = "/board/list.do?pageNum=${currentPage}";
        </script>
    </c:if>
    <c:if test="${search == 1}">
        <table class="table table-bordered" style="margin: 15px">
            <colgroup>
                <col width="7%">
                <col width="*">
                <col width="10%">
                <col width="22%">
                <col width="7%">
                <col width="7%">
            </colgroup>
            <thead style="text-align: center">
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
            <th>IP주소</th>
            </thead>
            <c:forEach var="voList" items="${voList}">
                <tr>
                        <%--글번호--%>
                    <td>
                        <c:out value="${voList.num}"></c:out>
                    </td>
                        <%--제목--%>
                    <td>
                        <c:if test="${voList.ref_step > 0}">
                            <img src="/image/KakaoTalk_20180320_113844011.gif" width="${15 * voList.re_level}"
                                 height="16">
                            <img src="/image/KakaoTalk_20180320_113843804.gif">
                        </c:if>
                        <a href="/board/content.do?num=${voList.num}&pageNum=${currentPage}">
                                ${voList.subject}
                        </a>
                        <c:if test="${voList.readcount >= 20}">
                            <img src="/image/KakaoTalk_20180320_113843909.gif" border="0" height="16">
                        </c:if>
                    </td>
                        <%--작성자--%>
                    <td class="text-center">
                            ${voList.writer}
                    </td>
                        <%-- 작성일 --%>
                    <td class="text-center">
                            ${voList.reg_date}
                    </td>
                        <%--조회수--%>
                    <td class="text-center">
                            ${voList.readcount}
                    </td>
                    <td class="text-center">
                            ${voList.ip}
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div style="margin-left: 20px;">
            <div class="row bg-light">
                <div class="col-6">
                    <div class="row">
                        <div class="col-auto" style="margin-top: 3px">
                            <div class="input-group">
                                <div class="input-group-prepend" style="margin-top: 5px;">
                                    <label class="input-group-text" for="searchOption">Options</label>
                                </div>
                                <select class="custom-select" id="searchOption" style="margin-top: 5px;">
                                    <option selected>Choose...</option>
                                    <option value="writer">작성자</option>
                                    <option value="subject">제목</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-auto" style="padding: 0px">
                            <nav class="navbar navbar-light">
                                <div class="form-inline">
                                    <input class="form-control mr-sm-2" type="search" placeholder="Search"
                                           aria-label="Search" id="searchValue">
                                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit"
                                            onclick="return searchArticle()">Search
                                    </button>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="col-6" style="margin-top: 9px;">
                    <ul class="pagination">
                        <c:if test="${count>0}">
                            <c:set var="imsi" value="${count % pageSize == 0 ? 0 : 1}"></c:set>
                            <fmt:parseNumber var="pageCount" value="${count / pageSize +imsi}"
                                             integerOnly="true"></fmt:parseNumber>
                            <c:set var="pageBlock" value="${3}"></c:set>
                            <%--int 파싱--%>
                            <fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}"
                                             integerOnly="true"></fmt:parseNumber>
                            <c:set var="startPage" value="${result * pageBlock+1}"></c:set>
                            <c:set var="endPage" value="${startPage+pageBlock-1}"></c:set>
                            <c:set var="endPage" value="${startPage+pageBlock-1}"></c:set>
                            <c:if test="${endPage > pageCount}">
                                <c:set var="endPage" value="${pageCount}"></c:set>
                            </c:if>
                            <c:if test="${startPage > pageBlock}">
                                <li class="page-item">
                                    <button class="page-link"
                                            onclick="location.href='/board/list.do?pageNum=${startPage-pageBlock}'">
                                        Previous
                                    </button>
                                </li>
                            </c:if>
                            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                <c:choose>
                                    <c:when test="${currentPage == i}">
                                        <li class="page-item active"></li>
                                        <button onclick="location.href='/board/list.do?pageNum=${i}'"
                                                class="page-link">${i}
                                        </button>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"></li>
                                        <button onclick="location.href='/board/list.do?pageNum=${i}'"
                                                class="page-link">${i}
                                        </button>
                                        </li>
                                    </c:otherwise>
                                </c:choose>

                            </c:forEach>
                            <c:if test="${endPage < pageCount}">
                                <li class="page-item">
                                    <button onclick="location.href='/board/list.do?pageNum=${startPage+pageBlock}'"
                                            class="page-link">Next
                                    </button>
                                </li>
                            </c:if>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </c:if>
</div>
<c:out value="${startPage}"></c:out>
<br>
<c:out value="${pageCount}"></c:out>
<br>
<c:out value="${endPage}"></c:out>
<br>
<c:out value="${pageBlock}"></c:out>
</body>
</html>
