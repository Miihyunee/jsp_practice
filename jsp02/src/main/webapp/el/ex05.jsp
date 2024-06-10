<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex05</title>
</head>
<body>
	<%@ page import="member.MemberDTO"%>
	<%
	MemberDTO dto = new MemberDTO();
	dto.setUserid("Kim");
	dto.setName("김철수");
	dto.setPasswd("1234");
	request.setAttribute("dto", dto);
	%>
	<jsp:forward page="ex05_result.jsp" />
</body>
</html>