<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body>
	<%
	String context = request.getContextPath();
	response.sendRedirect(context + "/gb_servlet/list.do");
	%>
</body>
</html>