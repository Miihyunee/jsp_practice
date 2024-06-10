<%@page import="book.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book</title>
<script>
	function del(idx) {
		if (confirm("삭제할까요?")) {
			location.href = "/jsp02/book_servlet/delete.do?idx="+idx;
		}
	}
</script>
</head>
<body>
	<%@ page import="book.BookDTO"%>
	<%
	BookDTO dto = (BookDTO) request.getAttribute("dto");
	%>
	<h2>도서 정보</h2>
	<form name="form1" method="post" action="/jsp02/book_servlet/update.do">
		<input type="hidden" name="idx" value="<%=dto.getIdx()%>"><br>
		도서명 : <input name="title" value="<%=dto.getTitle()%>"><br>
		저자 : <input name="author" value="<%=dto.getAuthor()%>"><br>
		가격 : <input name="price" value="<%=dto.getPrice()%>"><br>
		수량 : <input name="amount" value="<%=dto.getAmount()%>"><br>
		<input type="submit" value="수정"> <input type="button"
			value="삭제" onclick="del('<%=dto.getIdx()%>')">
	</form>
</body>
</html>