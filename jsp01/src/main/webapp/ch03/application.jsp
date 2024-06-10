<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<body>
	<%
	String info = application.getServerInfo();
	application.log("WAS : " + info);
	System.out.println("WAS : " + info);
	//getRealPath : 실제 서비스되는 경로
	String path = application.getRealPath("/");
	application.log("서비스 경로 : " + path);
	application.setAttribute("message", "hello");
	%>
	<a href="application_result.jsp">서버 변수 확인</a>
</body>
</html>