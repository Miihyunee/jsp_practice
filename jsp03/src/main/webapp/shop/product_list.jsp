<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<script src="/jsp03/include/jquery-3.7.1.min.js"></script>
<script>
	$(function() {
		$("#btn_add").click(function() {
			location.href = "/jsp03/shop/product_write.jsp";
		});
	});
</script>
</head>
<body>
	<%@ include file="../include/admin_menu.jsp"%>
	<h2>상품 목록</h2>
	<c:if test="${sessionScope.admin_userid != null}">
		<button type="button" id="btn_add">상품등록</button>
	</c:if>
	<table border="1" width="500px">
		<tr align="center" style="background-color: lightpink">
			<th>상품코드</th>
<!-- 			<th>&nbsp;</th> -->
			<th>상품이미지</th>
			<th>상품명</th>
			<th>가격</th>
		</tr>
		<c:forEach var="row" items="${list}">
			<tr align="center">
				<td>${row.product_code}</td>
				<td><img src="/jsp03/images/${row.filename}" width="100px"
					height="100px"></td>
				<td><a
					href="/jsp03/product_servlet/detail.do?product_code=${row.product_code}">${row.product_name}</a>
					<c:if test="${sessionScope.admin_userid != null}">
						<br>
						<a
							href="/jsp03/product_servlet/edit.do?product_code=${row.product_code}">
							[편집]</a>
					</c:if></td>
				<td><fmt:formatNumber value="${row.price}" pattern="#,###" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>