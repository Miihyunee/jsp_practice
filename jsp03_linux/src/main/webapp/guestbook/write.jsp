<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 작성</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	function check() {
		let form1 = $("#form1");
		let name = $("#name");
		let email = $("#email");
		let passwd = $("#passwd");
		let contetns = $("#contents");
		if (name.val() == "") {
			alert("이름을 입력하세요.");
			name.focus();
			return;
		}
		if (email.val() == "") {
			alert("이메일을 입력하세요.");
			email.focus();
			return;
		}
		if (passwd.val() == "") {
			alert("비밀번호를 입력하세요.");
			passwd.focus();
			return;
		}
		if (contetns.val() == "") {
			alert("내용을 입력하세요.");
			contetns.focus();
			return;
		}
		document.form1.action = "/jsp03/gb_servlet/insert.do";
		document.form1.submit();
	}
</script>
</head>
<body>
	<h2>방명록 작성</h2>
	<form name="form1" id="form1" method="post">
		<table border="1" style="width: 500px">
			<tr>
				<td style="text-align: center; background-color: lightpink">이름</td>
				<td><input type="text" name="name" id="name" size="40"></td>
			</tr>
			<tr>
				<td style="text-align: center; background-color: lightpink">이메일</td>
				<td><input type="text" name="email" id="email" size="40"></td>
			</tr>
			<tr>
				<td style="text-align: center; background-color: lightpink">비밀번호</td>
				<td><input type="password" name="passwd" id="passwd" size="40"></td>
			</tr>
			<tr align="center">
				<td colspan="2"><textarea rows="5" cols="55" name="contents"
						id="contents"></textarea></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="button" value="확인"
					onclick="check()"> <input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>