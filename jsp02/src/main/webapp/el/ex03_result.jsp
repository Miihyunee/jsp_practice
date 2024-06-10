<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex03_Result</title>
</head>
<body>
이름 : <%=session.getAttribute("name") %><br>
나이 : <%=session.getAttribute("age") %><br>
직업 : <%=session.getAttribute("job") %><br>
<hr>
이름 : ${sessionScope.name }<br>
나이 : ${sessionScope.age}<br>
직업 : ${sessionScope.job }<br>
</body>
</html>