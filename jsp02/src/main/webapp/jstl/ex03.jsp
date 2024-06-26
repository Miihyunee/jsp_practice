<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex03</title>
</head>
<body>
	<%
	int[] nums = { 10, 70, 80, 50, 40, 30, 20 };
	%>
	<c:set var="numbers" value="<%=nums%>" />
	<c:forEach var="num" items="${numbers}">
	${num },
	</c:forEach>
	<br>
	<c:set var="season" value="winter" />
	<c:choose>
		<c:when test="${season == 'spring' }">
			<img src="../images/spring.jpg">
		</c:when>
		<c:when test="${season == 'summer' }">
			<img src="../images/summer.jpg">
		</c:when>
		<c:when test="${season == 'autumn' }">
			<img src="../images/autumn.jpg">
		</c:when>
		<c:when test="${season == 'winter' }">
			<img src="../images/winter.jpg">
		</c:when>
		<c:otherwise>otherwise</c:otherwise>
	</c:choose>
</body>
</html>