<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex06</title>
</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:forEach var="i" begin="2" end="9">
		<h2>Table ${i}</h2>
		<c:forEach var="j" begin="1" end="9">
			${i} x ${j} = ${i * j}<br>
		</c:forEach>
	</c:forEach>
</body>
</html>