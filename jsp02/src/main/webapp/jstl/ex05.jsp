<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex05</title>
</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:forEach var="i" begin="0" end="100" step="5" varStatus="s">
	${s.index} / ${s.count} :
	<c:if test="${i % 2 == 0 }">
			<span style="font-size:${110-i}px; color:blue;">hello</span>
		</c:if>
		<c:if test="${i%2==1 }">
			<span style="font-size:${110-i}px; color:red;">hello</span>
		</c:if>
		<br>
	</c:forEach>
</body>
</html>