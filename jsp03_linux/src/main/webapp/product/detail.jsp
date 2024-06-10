<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Detail</title>
<script>
	function del(product_code) {
		if (confirm("삭제하시겠습니까?")) {
			location.href = "/jsp03/product_servlet/delete.do?product_code=" + product_code;
			//document.form1.action = "/jsp03/product_servlet/delete.do?product_code=" + product_code;
			//document.form1.submit();
		}
	}
</script>
</head>
<body>
	<h2>상품정보</h2>
	<form method="post"
		action="/jsp03/product_servlet/update.do?product_code=${map.PRODUCT_CODE}">
		<table border="1">
			<tr>
				<th>품명</th>
				<td><input name="product_name" value="${map.PRODUCT_NAME}"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="number" name="price" value="${map.PRICE}"></td>
			</tr>
			<tr>
				<th>수량</th>
				<td><input type="number" name="amount" value="${map.AMOUNT}">
				</td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="수정"> <input
					type="button" value="삭제" onclick="del('${map.PRODUCT_CODE}')">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>