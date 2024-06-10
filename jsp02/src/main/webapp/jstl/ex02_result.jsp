<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex02_Result</title>
</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ page import="java.util.List"%>
	<%@ page import="java.util.ArrayList"%>
	<%
	if (request.getParameter("items") != null) {
		List<String> items = (List<String>) request.getAttribute("items");
		for (String str : items) {
			out.println(str + "<br>");
		}
	} else {
		out.println("출력할 값이 없습니다.");
	}
	%>
	<hr>
	<c:forEach var="fruit" items="${items}">
		${fruit}<br>
	</c:forEach>
</body>
</html>