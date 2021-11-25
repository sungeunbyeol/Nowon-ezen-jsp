<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="login.*"%>
<!-- index.jsp -->
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>mvc홈페이지</title>
</head>
<body>
	<h1 align="center">MVC로 만들어 보는 홈페이지</h1>
	<c:if test="${loginOk != null }">
	<c:set var="id" value="${loginOk.id }"/>
	<c:set var="name" value="${loginOk.name }"/>
	<c:out value="${name} [ ${id}] 님 로그인중...."></c:out>

</c:if>
	<ul>	
		<li><h3><a href="main.do">main</a></h3></li>
		<li><h3><a href="member.do">회원관리</a></h3></li>
		<li><h3>
			<c:if test="${loginOk !=null }">
						<a href="logout.log">로그아웃</a>
			</c:if>
			<c:if test="${loginOk ==null }">
						<a href="login.do">로그인</a>
			</c:if>			
		</h3></li>
		<li><h3><a href="shop.do">쇼핑몰</a></h3></li>
		<li><h3><a href="board.do">게시판</a></h3></li>
	</ul>
</body>
</html>


