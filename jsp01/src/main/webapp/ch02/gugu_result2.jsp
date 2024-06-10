<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<body>
	<h2>계산 결과_2</h2>
	<%
	String result = (String) request.getAttribute("result");
	out.println(result);
	%>
</body>
</html>