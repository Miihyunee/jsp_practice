<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex04_Result</title>
</head>
<body>
	<%@ page import="java.util.HashMap"%>
	<%
	HashMap<String, String> map = (HashMap<String, String>) request.getAttribute("map");
	String[] names = { "kim", "park", "song", "hyun" };
	for (String name : names) {
		out.println(name + " => " + map.get(name) + "<br>");
	}
	%>
	<%=map.get("kim") %><br>
	<%=map.get("park") %><br>
	<%=map.get("song") %><br>
	<%=map.get("hyun") %><br>
	<hr>
	${map["kim"] }
	<br> ${map["park"] }
	<br> ${map["song"] }
	<br> ${map["hyun"] }
	<br> ${map.kim }
	<br> ${map.park }
	<br> ${map.song }
	<br> ${map.hyun }
	<br>
</body>
</html>