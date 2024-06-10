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
	int year = Integer.parseInt(request.getParameter("year"));
	int age = 2024 - year;
	%>
	이름: <%=name%><br>
	연도: <%=year%><br>
	나이: <%=age%><br>
</body>
</html>