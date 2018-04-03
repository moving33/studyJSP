<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-29
  Time: 오후 4:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/additional-methods.min.js"></script>
</head>
<script>
    $(document).ready(function () {
        $(function () {
            $.validator.addMethod("patternid", function (value, element) {
                return this.optional(element) || /^[A-Za-z0-9+]*$/.test(value);
            });
            $.validator.addMethod("patternemail", function (value, element) {
                return this.optional(element) || /^[0-9a-zA-Z]+@[0-9a-zA-Z]+\.[a-zA-Z]+$/.test(value);
            });
            $.validator.addMethod("patternpassword", function (value, element) {
                return this.optional(element) || /^(?=.*[a-zA-Z])(?=.*\d)(?=.*\W)(?=.*[!@#$%^&+=]).*$/.test(value);
            });
            $("#form-join").validate({
                debug: false,
                rules: {
                    id: {
                        required: true,
                        rangelength: [6, 20],
                        patternid: true,
                        remote: {
                            url: "/rest/exist/id",
                            type: "POST",
                            contentType: "application/x-www-form-urlencoded",
                            dataType: "json",
                            data: {
                                id: function () {
                                    return $("#id").val();
                                }
                            }
                        }
                    },
                    email: {
                        required: true,
                        patternemail: true
                    },
                    password: {
                        required: true,
                        rangelength: [8, 24],
                        patternpassword: true
                    },
                    password2: {
                        required: true,
                        equalTo: "#password"
                    },
                    nickname: {
                        required: true,
                        rangelength: [2, 12]
                    }
                },
                messages: {
                    id: {
                        required: "<spring:message code='join.required'/>",
                        rangelength: "<spring:message code='join.rangelength' arguments='6,20'/>",
                        patternid: "<spring:message code='join.pattern' arguments='아이디'/>",
                        remote: "<spring:message code='join.exist' arguments='아이디'/>"
                    },
                    email: {
                        required: "<spring:message code='join.required'/>",
                        patternemail: "<spring:message code='join.pattern' arguments='이메일'/>"
                    },
                    password: {
                        required: "<spring:message code='join.required'/>",
                        rangelength: "<spring:message code='join.rangelength' arguments='6,20'/>",
                        patternpassword: "<spring:message code='join.pattern' arguments='비밀번호'/>"
                    },
                    password2: {
                        required: "<spring:message code='join.required'/>",
                        equalTo: "<spring:message code='join.equalTo.password'/>"
                    },
                    nickname: {
                        required: "<spring:message code='join.required'/>",
                        rangelength: "<spring:message code='join.rangelength' arguments='2,12'/>"
                    }
                },
                submitHandler: function (form) {
                    if (confirm("회원가입을 완료하시겠습니까?") == true) {
                        form.submit();
                    }
                },
                invalidHandler: function (event, validator) {
                    if (validator.numberOfInvalids() > 0) {
                        alert(validator.errorList[0].message);
                        validator.errorList[0].element.focus();
                    }
                },
                validClass: "valid",
                errorClass: "invalid",
                highlight: function (element, errorClass, validClass) {
                    $(element).find("label[for=" + element.id + "]").addClass(errorClass).show();
                    $(element).parent().children(".glyphicon-ok").hide();
                },
                unhighlight: function (element, errorClass, validClass) {
                    $(element).find("label[for=" + element.id + "]").removeClass(errorClass).hide();
                },
                success: function (label, element) {
                    $(element).parent().children(".glyphicon-ok").addClass("check-ok").show();
                },
                errorPlacement: function (error, element) {
                    error.appendTo(element.parent());
                }
            });

        });


    });

</script>
<body>
<form modelAttribute="join" id="form-join">
    <ul>
        <li>
            <label path="id">아이디</label>
            <input path="id"/>
        </li>
        <li>
            <form:label path="email">이메일</form:label>
            <form:input path="email"/>
        </li>
        <li>
            <form:label path="password">비밀번호</form:label>
            <form:password path="password"/>
        </li>
        <li>
            <div>비밀번호 확인</div>
            <input type="password" name="password2" id="password2"/>
        </li>
        <li>
            <form:label path="nickname">별명</form:label>
            <form:input path="nickname"/>
        </li>
        <li>
            <button type="submit">submit</button>
        </li>
    </ul>
</form>

</body>
</html>
