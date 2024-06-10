<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function() {
		list('1');
	})
	function list(cur_page) {
		let param = {
			"cur_page" : cur_page
		};
		$.ajax({
			url : "/jsp03/page_servlet/list.do",
			data : param,
			success : function(txt) {
				$("#result").html(txt);
			}
		});
	}
</script>
</head>
<body>
	<h2>페이지 나누기</h2>
	<div id="result"></div>
</body>
</html>