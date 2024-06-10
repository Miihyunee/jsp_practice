<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Cookie</title>
</head>
<body>
	<%
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			out.println("key : " + cookies[i].getName() + ", ");
			out.println("value : " + cookies[i].getValue() + "<br>");
		}
	}
	String name = request.getParameter("name");
	%>
	<a href="delete_cookie.jsp?name=<%=name%>">쿠키 삭제</a>
	<br>
	<a href="update_cookie.jsp">쿠키 수정</a>
</body>
</html>