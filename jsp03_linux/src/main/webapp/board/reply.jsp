<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reply</title>
<script src="/jsp03/include/jquery-3.7.1.min.js"></script>
<script>
	$(function() {
		$("#btnSave").click(function() {
			let writer = $("#writer").val();
			let subject = $("#subject").val();
			let contents = $("#contents").val();
			let passwd = $("#passwd").val();
			if (writer == "") {
				alert("이름을 입력하세요.");
				$("#writer").focus();
				return;
			}
			if (subject == "") {
				alert("제목을 입력하세요.");
				$("#subject").focus();
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
			document.form1.submit();
		});
	});
</script>
</head>
<body>
	<h2>답변 글쓰기</h2>
	<form name="form1" method="post"
		action="/jsp03/board_servlet/insert_reply.do">
		<table border="1" width="700px">
			<tr>
				<td align="center">이름</td>
				<td><input name="writer" id="writer"></td>
			</tr>
			<tr>
				<td align="center">제목</td>
				<td><input name="subject" id="subject" size="60"
					value="${dto.subject }"></td>
			</tr>
			<tr>
				<td align="center">본문</td>
				<td><textarea rows="5" cols="60" name="contents" id="contents">${dto.contents}</textarea>
				</td>
			</tr>
			<tr>
				<td align="center">비밀번호</td>
				<td><input type="password" name="passwd" id="passwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="hidden" name="num"
					value="${dto.num}"> 
					<input type="button" value="확인" id="btnSave">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>