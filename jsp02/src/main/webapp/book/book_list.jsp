<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="book.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book</title>
<script>
	function view(idx) {
		document.form1.idx.value = idx;
		document.form1.submit();
	}
</script>
</head>
<body>
	<%
	/* BookDAO dao = new BookDAO();
	List<BookDTO> items = dao.list_book(); */
	List<BookDTO> items = (List) request.getAttribute("items");
	%>
	<a href="/jsp02/book/book.html">도서 등록</a>
	<table border="1">
		<tr style="align: center; background-color: lightblue;">
			<th>idx</th>
			<th>title</th>
			<th>author</th>
			<th>price</th>
			<th>amount</th>
		</tr>
		<%
		for (BookDTO dto : items) {
		%>
		<tr>
			<td><%=dto.getIdx()%></td>
			<td><a href="/jsp02/book_servlet/view.do?idx=<%=dto.getIdx()%>"><%=dto.getTitle()%></a></td>
			<td><%=dto.getAuthor()%></td>
			<td><%=dto.getPrice()%></td>
			<td><%=dto.getAmount()%></td>
		</tr>
		<%
		}
		%>
	</table>
	<form name="form1" method="post" action="/jsp02/book_servlet/view.do">
		<input type="hidden" name="idx">
	</form>
</body>
</html>