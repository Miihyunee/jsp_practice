<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Session</title>
</head>
<body>
	<%
	session.removeAttribute("id"); // 개별 삭제
	session.removeAttribute("passwd");
	session.setAttribute("age", 30); // 세션 업데이트
	//session.invalidate(); // 전체 삭제(세션 무효화
	%>
	세션이 초기화되었습니다.
	<a href="view_session.jsp">세션 확인</a>
</body>
</html>