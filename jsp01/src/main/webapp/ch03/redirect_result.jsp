<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<body>
	<h2>결과 페이지</h2>
	<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	%>
	이름 : <%=name %><br>
	나이 : <%=age %><br>
</body>
</html>