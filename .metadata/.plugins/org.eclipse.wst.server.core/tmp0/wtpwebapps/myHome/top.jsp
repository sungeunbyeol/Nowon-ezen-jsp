<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->
<html>
<head>
	<title>JSP로 만드는 홈페이지</title>
	<link rel="stylesheet" type="text/css" href="style.css"> 
	<script type="text/javascript">
		function checkMember(){
			window.open("member/memberSsn.jsp", "member", "width=650, height=500");
		}
	</script>
</head>
<body>
	<div align="center">
		<table border="1" width="800" height="650">
			<tr height="10%">
				<td align="center" colspan="2">
					<a href="index.jsp">main</a> | 
					<a href="login.jsp">로그인</a> | 
					<a href="javascript:checkMember()">회원가입</a> | 회원보기 | 쇼핑몰 | 게시판 | 
					<a href="company.jsp">회사소개</a>
				</td>
			</tr>
			<tr>
				<td width="20%">tree/view</td>
				<td width="80%">