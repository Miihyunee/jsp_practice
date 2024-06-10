<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello JSP</title>
</head>
<body>
	<br>
	<%
	String[] fruits = { "apple", "peach", "grapes", "orange" };
	//String[] fruits = null;
	%>
	<ul>
		<%
		for (String fruit : fruits) {
		%>
		<li><%=fruit%></li>
		<%
		}
		%>
	</ul>
</body>
</html>