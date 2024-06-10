<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex04</title>
</head>
<body>
	<%@ page import="java.util.Map"%>
	<%@ page import="java.util.HashMap"%>
	<%
	Map<String, String> map = new HashMap<String, String>();
	map.put("kim", "김철수");
	map.put("park", "박희정");
	map.put("song", "송영미");
	map.put("hyun", "현정수");
	request.setAttribute("map", map);
	%>
	<jsp:forward page="ex04_result.jsp" />
</body>
</html>