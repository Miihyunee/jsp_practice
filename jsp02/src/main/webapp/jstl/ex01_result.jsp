<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex01_Result</title>
</head>
<body>
	<%
	if (request.getParameter("num") != null) {
		int num = Integer.parseInt(request.getParameter("num"));
		int sum = 0;
		for (int i = 1; i <= num; i++) {
			sum += i;
		}
		out.println("합계 : " + sum);
	} else {
		out.println("출력할 값이 없습니다.");
		//response.sendRedirect("ex01.jsp");
	}
	%>
	<hr>
	<c:set var="sum" value="0" />
	<c:forEach var="i" begin="1" end="${param.num}">
		<c:set var="sum" value="${sum + i}" />
	</c:forEach>
	합계 : ${sum}
</body>
</html>