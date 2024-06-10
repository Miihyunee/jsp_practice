<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<body>
	<form method="post" action="<%=request.getContextPath() %>/ch02_servlet/multi_table.do">
	num : <input name="num">
	<input type="submit" value="OK">
	</form>
</body>
</html>