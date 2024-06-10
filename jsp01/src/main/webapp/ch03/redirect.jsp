<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<body>
	<%
	//String name = "김철수"; // 유효하지 않음
	// url에 사용할 수 있는 형식으로 변환해주는 작업
	String name = URLEncoder.encode("김철수", "utf-8");
	response.sendRedirect("redirect_result.jsp?name=" + name + "&age=20");
	%>
</body>
</html>