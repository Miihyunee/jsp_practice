<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Emp</title>
</head>
<body>
	<%@ page import="emp.*"%>
	<%
	int empno = Integer.parseInt(request.getParameter("empno"));
	EmpSalaryDAO dao = new EmpSalaryDAO();
	dao.update_sal(empno);
	%>
	처리되었습니다.
	<br>
	<a href="list.jsp">사원목록으로 이동</a>
</body>
</html>