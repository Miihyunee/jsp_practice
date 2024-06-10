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
	for (int i = 1; i <= 150; i++) {
		String color = i % 2 == 0 ? "red" : "blue";
	%>
	<p style="font-size:<%=i%>px; color:<%=color%>">hello</p>
	<%
	}
	%>
</body>
</html>