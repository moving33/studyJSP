<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2018-03-26
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>간단한 표현언어 (EL) 예제</title>
</head>
<body>
<h3>간단한 표현언어 (EL) 예제</h3>
<p>연산자를 사용한 예아 내장객체의 사용한 예:</p>
<table border="1">
    <tr>
        <th>표현식</th>
        <th>값</th>
    </tr>
    <tr>
        <td>
            \${2+5} <%--\를 붙히는 이유는 보여주기위해--%>
        </td>
        <td>
            ${2+5}
        </td>
    </tr>
    <tr>
        <td>
            \${4/5}
        </td>
        <td>
            ${4/5}
        </td>
    </tr>
    <tr>
        <td>
            \${7 mod 3}
        </td>
        <td>
            ${7 mod 3}
        </td>
    </tr>
    <tr>
        <td>
            \${7 % 3}
        </td>
        <td>
            ${7 % 3}
        </td>
    </tr>
    <tr>
        <td>
            \${7 gt 5}
        </td>
        <td>
            ${7 gt 5}
        </td>
    </tr>
    <tr>
        <td>
            \${7 le 5}
        </td>
        <td>
            ${7 le 5}
        </td>
    </tr>
    <tr>
        <td>
            \${header["host"]}
        </td>
        <td>
            ${header["host"]}
        </td>
    </tr>
</table>

</body>
</html>
