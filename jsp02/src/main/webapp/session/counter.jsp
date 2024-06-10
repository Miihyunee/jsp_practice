<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Counter</title>
</head>
<body>
	<%
	Integer count = (Integer) session.getAttribute("counter");
	int num = 1;
	if (count == null) { // 최초 실행했을 때
		count = 1;
	} else { // 2번째 이후 방문
		num = count.intValue(); // 클래스에서 숫자로 바꿀 때
		num++;
		count = num;
	}
	session.setAttribute("counter", count);
	%>
	<%=count.intValue()%>번째 방문입니다.
</body>
</html>