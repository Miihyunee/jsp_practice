<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<script src="/jsp03/include/jquery-3.7.1.min.js"></script>
<script>
	$(function() {
		$("#btnSave").click(function() {
			let wrtier = $("#writer").val();
			let subject = $("#subject").val();
			let contents = $("#contents").val();
			let passwd = $("#passwd").val();
			if (writer == "") {
				alert("이름을 입력하세요.");
				$("#writer").focus();
				return;
			}
			if (contents == "") {
				alert("내용을 입력하세요.");
				$("#contents").focus();
				return;
			}
			if (passwd == "") {
				alert("비번을 입력하세요.");
				$("#passwd").focus();
				return;
			}
			let filename = document.form1.file1.value;
			// 파일 확장자 검사( '.' 뒤부터의 내용)
			let start = filename.lastIndexOf(".") + 1;
			if (start != -1) { // 없으면(파일 확장자가 없는 경우)
				let ext = filename.substring(start, filename.length);
				if (ext == "jsp" || ext == "exe") {
					alert("업로드 할 수 없는 파일입니다.");
					return;
				}
			}
			document.form1.submit();
		});
	});
</script>
</head>
<body>
	<h2>글쓰기</h2>
	<form name="form1" method="post"
		action="/jsp03/board_servlet/insert.do" enctype="multipart/form-data">
		<table border="1" width="700px">
			<tr>
				<th align="center" style="background-color: lightpink">이름</th>
				<td><input name="writer" id="writer"></td>
			</tr>
			<tr>
				<th align="center" style="background-color: lightpink">제목</th>
				<td><input name="subject" id="subject" size="60"></td>
			</tr>
			<tr>
				<th align="center" style="background-color: lightpink">본문</th>
				<td><textarea rows="5" cols="60" name="contents" id="contents"></textarea>
			</tr>
			<tr>
				<th align="center" style="background-color: lightpink">첨부파일</th>
				<td><input type="file" name="file1"></td>
			</tr>
			<tr>
				<th align="center" style="background-color: lightpink">비밀번호</th>
				<td><input type="password" name="passwd" id="passwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="확인"
					id="btnSave"></td>
			</tr>
		</table>
	</form>
</body>
</html>