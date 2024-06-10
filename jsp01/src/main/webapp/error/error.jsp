<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<body>
	<!-- 에러 처리가 되어 있지 않은 상태이므로 에러 관련 정보 및 코드가 화면에 출력됨 -->
	<%
	int a = Integer.parseInt(request.getParameter("num"));
	%>
	a: <%=a%>
</body>
</html>