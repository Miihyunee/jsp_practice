<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Form</title>
</head>
<body>
	<h2>상품정보</h2>
	<form method="post" action="/jsp03/product_servlet/insert.do">
	품명 : <input name="product_name"><br>
	가격 : <input type="number" name="price"><br>
	수량 : <input type="number" name="amount"><br>
	<input type="submit" value="확인">	
	</form>
</body>
</html>