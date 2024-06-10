<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello JSP</title>
</head>
<body>
	<%
	String str = "hello jsp";
	%>
	<%
	String str2 = "안녕하세요";
	%>
	<%
	String str3 = "hello jsp";
	%>
	<h2>
		message:
		<%=str%></h2>
	<h2>
		message:
		<%=str2%></h2>
	<h2>
		message:
		<%=str%></h2>
</body>
</html>