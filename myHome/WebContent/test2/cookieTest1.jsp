<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- cookieTest1.jsp -->
<html>
<head>
	<title>쿠키테스트1</title>
</head>
<body>
	<%
		Cookie ck = new Cookie("id", "admin");
		ck.setMaxAge(24*60*60);
		response.addCookie(ck);
	%>
	<h2>쿠키전송 끝!!</h2>
</body>
</html>