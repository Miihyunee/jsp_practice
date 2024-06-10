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
	String[] fruits = request.getParameterValues("fruits");
	if (fruits != null) {
		for (int i = 0; i < fruits.length; i++) {
			out.println(fruits[i] + "<br>");
		}
	} else {
		out.println("선택된 값이 없습니다.");
	}
	%>
</body>
</html>