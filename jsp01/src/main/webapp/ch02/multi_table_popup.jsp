<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<script>
	function winclose() {
		//opener : 부모창
		opener.document.form1.num.value = document.form1.num.value;
		window.close();
	}
</script>
</head>
<body>
	<%
	int num = Integer.parseInt(request.getParameter("num"));
	%>
	<h2>
		Table
		<%=num%></h2>
	<%
	for (int i = 1; i <= 9; i++) {
		out.println(num + "x" + i + "=" + num * i + "<br>");
	}
	%>
</body>
</html>