<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Make Cookie</title>
</head>
<body>
<%
// 쿠키의 값은 String만 가능
Cookie cookie = new Cookie("id", "김철수");
cookie.setMaxAge(10); // 쿠키의 유효시간 설정
response.addCookie(cookie);

Cookie cookie2 = new Cookie("pwd", "1234");
response.addCookie(cookie2);
%>
쿠키가 생성되었습니다.
<br>
<a href="view_cookie.jsp?name=김철수">쿠키 확인</a>
</body>
</html>