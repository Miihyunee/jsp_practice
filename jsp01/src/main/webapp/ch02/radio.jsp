<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Data</title>
</head>
<body>
	<%
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	%>
	name : <%=name%><br>
	gender : <%=gender%>
</body>
</html>