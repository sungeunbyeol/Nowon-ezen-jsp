<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="login.*"%>
<!-- index.jsp -->
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>mvcȨ������</title>
</head>
<body>
	<h1 align="center">MVC�� ����� ���� Ȩ������</h1>
	<c:if test="${loginOk != null }">
	<c:set var="id" value="${loginOk.id }"/>
	<c:set var="name" value="${loginOk.name }"/>
	<c:out value="${name} [ ${id}] �� �α�����...."></c:out>

</c:if>
	<ul>	
		<li><h3><a href="main.do">main</a></h3></li>
		<li><h3><a href="member.do">ȸ������</a></h3></li>
		<li><h3>
			<c:if test="${loginOk !=null }">
						<a href="logout.log">�α׾ƿ�</a>
			</c:if>
			<c:if test="${loginOk ==null }">
						<a href="login.do">�α���</a>
			</c:if>			
		</h3></li>
		<li><h3><a href="shop.do">���θ�</a></h3></li>
		<li><h3><a href="board.do">�Խ���</a></h3></li>
	</ul>
</body>
</html>


