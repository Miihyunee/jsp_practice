<%@ page language="java" contentType="text/html; charset=
UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.1.js">
	
</script>
<script>
	$(function() {
		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "/jsp03/board_servlet/delete.do";
				document.form1.submit();
			}
		});
		$("#btnUpdate").click(function() {
			let writer = $("#writer").val();
			let subjet = $("#subject").val();
			let contents = $("#contents").val();
			let passwd = $("#passwd").val();
			if (writer == "") {
				alert("이름을입력하세요.");
				$("#writer").focus();
				return;
			}
			if (subjet == "") {
				alert("제목을입력하세요.");
				$("#subjet").focus();
				return;
			}
			if (contents == "") {
				alert("내용을입력하세요.");
				$("#contents").focus();
				return;
			}
			if (passwd == "") {
				alert("비번을입력하세요.");
				$("#passwd").focus();
				return;
			}
			let filename = document.form1.file1.value;
			let start = filename.lastIndexOf(".") + 1;
			if (start != -1) {
				let ext = filename.substring(start, filename.length);
				if (ext == "jsp" || ext == "exe") {
					alert("업로드할수없는파일입니다.");
					return;
				}
			}
			document.form1.action = "/jsp03/board_servlet/update.do";
			document.form1.submit();
		});
	});
</script>
</head>
<body>
	<form name="form1" method="post" enctype="multipart/form-data">
		<table border="1" width="700px">
			<tr>
				<td align="center">이름</td>
				<td><input name="writer" id="writer" value="${dto.writer}"></td>
			</tr>
			<tr>
				<td align="center">제목</td>
				<td><input name="subject" id="subject" size="60"
					value="${dto.subject}"></td>
			</tr>
			<tr>
				<td align="center">본문</td>
				<td><textarea rows="5" cols="60" name="contents" id="contents">${dto.contents}</textarea></td>
			</tr>
			<tr>
				<td align="center">첨부파일</td>
				<td><c:if test="${dto.filesize>0}">${dto.filename}(${dto.filesize}bytes)
<input type="checkbox" name="delete_file">첨부파일삭제<br>
					</c:if> <input type="file" name="file1"></td>
			</tr>
			<tr>
				<td align="center">비밀번호</td>
				<td><input type="password" name="passwd" id="passwd"> <c:if
						test="${param.pwd_error=='y'}">
						<span style="color: red">비밀번호가틀렸습니다.</ span> 
					</c:if></td>
			</tr>
			<tr>
				<tdc olspan="2" align="center"> <input type="hidden"
					name="num" value="${dto.num}"> <input type="button"
					value="수정" id="btnUpdate"> <input type="button" value="삭제"
					id="btnDelete">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>