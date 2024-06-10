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
	//톰캣 하위버전 필수 - 하위호환성
	//request.setCharacterEncoding("utf-8");
	String str = request.getParameter("str");
	str = str.replace("<", "&lt;");
	str = str.replace(">", "&gt;");
	str = str.replace("\n", "<br>");
	str = str.replace("　", "&nbsp;&nbsp;");
	%>
	opinion :
	<br>
	<%=str%>
</body>
</html>