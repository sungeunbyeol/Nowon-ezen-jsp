<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- sessionTest2.jsp -->
<html>
<head>
	<title>회원전용페이지</title>
</head>
<body>
<%
		String id = (String)session.getAttribute("id");
		if (id == null){%>
		<script type="text/javascript">
			alert("로그인을 먼저 해 주세요!!")
			location.href="sessionTest1.jsp"
		</script>	
<%		return;
		}%>
	<h1>회원 전용 페이지</h1>
	<h2>회원만 볼 수 있도록 합니다. 로그인이 안되었을땐, 절대로 보여져서는 안됩니다.</h2>
	<a href="sessionTest3.jsp">로그아웃</a>
</body>
</html>