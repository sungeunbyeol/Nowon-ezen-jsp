<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="login.*"%>
<!-- index.jsp -->
<html>
<head>
	<title>mvcȨ������</title>
</head>
<body>
	<h1 align="center">MVC�� ����� ���� Ȩ������</h1>
<%
		LoginOkBean loginOk = (LoginOkBean)session.getAttribute("loginOk");
		if (loginOk != null){
			String id = loginOk.getId();
			String name = loginOk.getName();
			out.println("<h2 align='center'>" + name +"[" + id + "]�� �α��� �� ......</h2>");
		}
%>
	<ul>	
		<li><h3><a href="main.do">main</a></h3></li>
		<li><h3><a href="member.do">ȸ������</a></h3></li>
		<li><h3>
			<% 	if (loginOk != null){ %>
						<a href="logout.log">�α׾ƿ�</a>
			<%	}else { %>
						<a href="login.do">�α���</a>
			<%	} %>				
		</h3></li>
		<li><h3><a href="shop.do">���θ�</a></h3></li>
		<li><h3><a href="board.do">�Խ���</a></h3></li>
	</ul>
</body>
</html>


