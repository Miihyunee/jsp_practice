<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Memo</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function() { //페이지 로드 완료 후 자동 실행되는 함수
		list();
		$("#btnSave").click(function() { //등록
			insert();
		});
		$("#btnSearch").click(function() { //조회
			list();
		});
	});

	function list() {
		let params = {
			"search_options" : $("#search_option").val(),
			"search" : $("#search").val()
		};

		$.ajax({
			url : "/jsp03/memo_servlet/list.do",
			data : params,
			success : function(txt) {
				$("#result").html(txt);
			}
		});
	}
	function insert() { // 등록
		let writer = $("#writer").val();
		let memo = $("#memo").val();
		let params = {
			"writer" : writer,
			"memo" : memo
		};
		$.ajax({
			url : "/jsp03/memo_servlet/insert.do",
			data : params,
			success : function() { // 성공(종료)
				list();
				$("#writer").val("");
				$("#memo").val("");
			}
		});
	}
</script>
</head>
<body>
	이름 :
	<input id="writer" size="10">
	<br> 메모 :
	<input id="memo" size="40">
	<input type="button" id="btnSave" value="확인">
	<br>
	<select id="search_option">
		<option value="writer">이름</option>
		<option value="memo">메모</option>
		<option value="writer_memo">이름+메모</option>
	</select>
	<input type="text" id="search" value="${search}">
	<input type="button" id="btnSearch" value="조회">
	<div id="result"></div>
</body>
</html>