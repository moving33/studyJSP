<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-28
  Time: 오후 4:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>RegForm</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script>
        function daumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
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
                    if(data.userSelectedType === 'R'){
                        //법정동명이 있을 경우 추가한다.
                        if(data.bname !== ''){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if(data.buildingName !== ''){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
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
        <label for="id">ID</label>
        <input id="id" placeholder="Your ID" required type="text" class="form-control col-4">
        <label for="pass"><strong>PASSWORD</strong></label>
        <input id="pass" type="password" required class="form-control col-4">
        <label for="name">name</label>
        <input id="name" class="form-control col-4" type="text" placeholder="Your name" required>
        <label for="email">email</label>
        <input id="email" class="form-control col-4" type="email" placeholder="Your e-mail" required>
        <br>
        <!-- 우편번호 -->
        <div class="row" style="margin-left: 0px">
            <input type="text" id="postcode" placeholder="우편번호" class="form-control col-sm-2" style="margin-right: 5px">
            <input type="button" onclick="daumPostcode()" value="우편번호찾기" class="btn btn-sm btn-primary col-sm-2">
        </div>
        <input type="text" id="address1" placeholder="주소" class="form-control col-9" style="margin-top: 5px">
        <input type="text" id="address2" placeholder="상세주소" class="form-control col-3" style="margin-top: 5px">
    </div>
</div>


</body>
</html>
