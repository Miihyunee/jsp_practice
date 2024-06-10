<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Data</title>
</head>
<body>
	<%
	int price = Integer.valueOf(request.getParameter("price"));
	//int price = Integer.parseInt(request.getParameter("price"));
	int amount = Integer.valueOf(request.getParameter("amount"));
	int money = price * amount;
	%>
	price :
	<%=price%><br> amount :
	<%=amount%><br> money :
	<%=money%>
</body>
</html>