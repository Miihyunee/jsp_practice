<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<body>
	<h2>계산 결과</h2>
	<%
	int dan = Integer.parseInt(request.getParameter("dan"));
	for (int i = 1; i <= 9; i++) {
		out.println(dan + "x" + i + "=" + dan * i + "<br>");
	}
	%>
</body>
</html>