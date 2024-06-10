<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="common.MyCookie"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Counter</title>
</head>
<body>
	<%
	String count = MyCookie.getCookie(request.getCookies(), "count");
	int int_count = 0;
	Date date = new Date();
	long now_time = date.getTime();
	String str_visit = MyCookie.getCookie(request.getCookies(), "visit_time");
	long visit_time = 0;
	if (str_visit != null && !str_visit.equals("")) {
		visit_time = Long.parseLong(str_visit);
	}
	if (count == null || count.equals("")) {
		// 처음 방문했을 때 쿠키 추가
		response.addCookie(new Cookie("count", "1"));
		// 최근 방문시간
		response.addCookie(new Cookie("visit_time", Long.toString(now_time)));
		int_count = 1;
	} else { // 두번째 이후 방문
		long period = now_time - visit_time; // 현재 시각 - 직전 방문 시각
		//out.println("now: " + now_time + "<br>");
		//out.println("previous: " + visit_time + "<br>");
		//out.println("diffrerence: " + period + "<br>");
		int_count = Integer.parseInt(count);
		if (period > 3 * 1000) { // 시간 제한(3초 이상 지났을 때 카운트)
			int_count++;
			// 방문횟수, 시간 업데이트
			response.addCookie(new Cookie("count", Integer.toString(int_count)));
			response.addCookie(new Cookie("visit_time", Long.toString(now_time)));
		}
	}
	%>
	<%=int_count%>번째 방문입니다.
</body>
</html>