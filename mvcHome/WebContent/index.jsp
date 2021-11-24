<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="login.*"%>
<!-- index.jsp -->
<html>
<head>
	<title>mvc홈페이지</title>
</head>
<body>
	<h1 align="center">MVC로 만들어 보는 홈페이지</h1>
<%
		LoginOkBean loginOk = (LoginOkBean)session.getAttribute("loginOk");
		if (loginOk != null){
			String id = loginOk.getId();
			String name = loginOk.getName();
			out.println("<h2 align='center'>" + name +"[" + id + "]님 로그인 중 ......</h2>");
		}
%>
	<ul>	
		<li><h3><a href="main.do">main</a></h3></li>
		<li><h3><a href="member.do">회원관리</a></h3></li>
		<li><h3>
			<% 	if (loginOk != null){ %>
						<a href="logout.log">로그아웃</a>
			<%	}else { %>
						<a href="login.do">로그인</a>
			<%	} %>				
		</h3></li>
		<li><h3><a href="shop.do">쇼핑몰</a></h3></li>
		<li><h3><a href="board.do">게시판</a></h3></li>
	</ul>
</body>
</html>


