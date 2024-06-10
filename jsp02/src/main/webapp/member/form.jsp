<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member</title>
</head>
<body>
	<form action=" /jsp02/member_servlet/join.do" method="post">
		아이디 <input name="userid"><br>
		비번 <input type="password" name="passwd"><br>
		이름 <input name="name"><br>
		주소 <input name="address"><br>
		전화 <input name="tel"><br>
		<input type="submit" value="확인">
	</form>
</body>
</html>