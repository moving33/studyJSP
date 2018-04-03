<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-28
  Time: 오후 4:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<html>
<head>
    <title>RegForm</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <%--<script src="js/jquery.validate.min.js"></script>
    <script src="js/additional-methods.min.js"></script>--%>
    <script src="js/jquery-ui.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="js/js.js"></script>
    <script>
        //daum 우편번호 서비스
        function daumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullAddr = ''; // 최종 주소 변수
                    var extraAddr = ''; // 조합형 주소 변수

                    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        fullAddr = data.roadAddress;

                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        fullAddr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                    if (data.userSelectedType === 'R') {
                        //법정동명이 있을 경우 추가한다.
                        if (data.bname !== '') {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if (data.buildingName !== '') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                    document.getElementById('address1').value = fullAddr;

                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById('address2').focus();
                }
            }).open();

        }
    </script>
</head>
<body>

<div class="container">
    <div class="form-group">
        <form id="testForm" onsubmit="return insertId()">
            <label for="id"><strong>ID</strong></label>
            <div class="row" style="margin-left: 0px">
                <input id="id" placeholder="Your ID" type="text" class="form-control col-4"
                       style="margin-right: 5px" autofocus maxlength="10" required pattern="^[a-zA-Z0-9]*$"
                       oninvalid="this.setCustomValidity('아이디를 형식에 맞게 입력해주세요(영어,숫자만가능)')"
                       oninput="setCustomValidity('')">
                <input type="button" onclick="return idCheck()" value="중복확인" class="btn btn-sm btn-primary col-sm-1">
            </div>
            <label for="pass"><strong>PASSWORD</strong></label>
            <input id="pass" type="password" required class="form-control col-4">
            <label for="name"><strong>NAME</strong></label>
            <input id="name" class="form-control col-4" type="text" placeholder="Your name" required>
            <label for="email"><strong>E-MAIL</strong></label>
            <input id="email" class="form-control col-4" type="email" placeholder="Your e-mail" required>
            <label for="phone1">PHONE</label>
            <div class="row" style="margin-left: 0px">
                <select class="form-control col-sm-1" id="phone1" style="margin-right: 7px">
                    <option>010</option>
                    <option>02</option>
                    <option>031</option>
                </select>
                <input type="tel" required class="form-control col-sm-1" style="margin-right: 7px" id="phone2">
                <input type="tel" required class="form-control col-sm-1" style="margin-right: 5px" id="phone3">
            </div>
            <br>

            <!-- 우편번호 -->
            <div class="row" style="margin-left: 0px">
                <input type="text" id="postcode" placeholder="우편번호" class="form-control col-sm-2"
                       style="margin-right: 5px" required>
                <input type="button" onclick="daumPostcode()" value="우편번호찾기" class="btn btn-sm btn-primary col-sm-2">
            </div>
            <input type="text" id="address1" placeholder="주소" class="form-control col-9" style="margin-top: 5px"
                   required>
            <input type="text" id="address2" placeholder="상세주소" class="form-control col-3" style="margin-top: 5px"
                   required>
            <hr style="width: 75%; -webkit-margin-start: 0px;">
            <button class="btn btn-sm border-dark" type="submit">가입하기</button>
            <button class="btn btn-sm border-dark">취소</button>
        </form>
    </div>
</div>
</body>
</html>
