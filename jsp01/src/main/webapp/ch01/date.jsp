<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello JSP</title>
</head>
<body>
	<%
	Date now = new Date();
	out.println(now + "<br>");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 a HH:mm:ss");
	String str_date = sdf.format(now);
	%>
	현재 날짜는
	<%=str_date%>입니다.
</body>
</html>