<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<body>
	<%@ page import="java.util.Map"%>
	<%
	Map map = (Map) request.getAttribute("point");
	String name = (String) map.get("name");
	int kor = (int) map.get("kor");
	int eng = (int) map.get("eng");
	int mat = (int) map.get("mat");
	int total = (int) map.get("total");
	double average = (double) map.get("average");
	%>
	이름 : <%=name %><br>
	국어 : <%=kor %><br>
	수학 : <%=eng %><br>
	영어 : <%=mat %><br>
	총점 : <%=total %><br>
	평균 : <%=String.format("%.1f", average)%><br>
</body>
</html>