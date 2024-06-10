<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
<script>
	function product_edit(product_code) {
		location.href = "/jsp03/product_servlet/detail.do?product_code="
				+ product_code;
	}
</script>
</head>
<body>
	<h2>상품 목록</h2>
	<!-- <a href="/jsp03/product/form.jsp">상품 추가</a> -->
	<input type="button" value="상품추가"
		onclick="location.href='/jsp03/product/form.jsp'">
	<table border="1">
		<tr>
			<th>상품코드</th>
			<th>상품명</th>
			<th>가격</th>
			<th>수량</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach var="row" items="${items}">
			<tr>
				<%-- <td>${row.product_code}</td>
				<td>${row.product_name}</td>
				<td>${row.price}</td>
				<td>${row.amount}</td> --%>
				<td>${row.PRODUCT_CODE}</td>
				<td>${row.PRODUCT_NAME}</td>
				<td>${row.PRICE}</td>
				<td>${row.AMOUNT}</td>
				<td>
				<%-- <input type="button" value="편집" onclick="product_edit('${row.product_code}')"></td> --%>
				<input type="button" value="편집" onclick="product_edit('${row.PRODUCT_CODE}')"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>