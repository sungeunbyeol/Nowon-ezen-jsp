<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->
<html>
<head>
	<title>JSP로 만드는 홈페이지</title>
	<link rel="stylesheet" type="text/css" href="style.css"> 
	<script type="text/javascript">
		function checkMember(){
			window.open("<%=request.getContextPath()%>/member/memberSsn.jsp", "member", "width=650, height=400");
		}
	</script>
</head>
<body>
	<div align="center">
		<table border="1" width="800" height="650">
			<tr height="10%">
				<td align="center" colspan="2">
					<a href="<%=request.getContextPath()%>/index.jsp">main</a> | 
					<a href="<%=request.getContextPath()%>/login.jsp">로그인</a> | 
					<a href="javascript:checkMember()">회원가입</a> | 
					<a href="<%=request.getContextPath()%>/member/memberAll.jsp">회원보기</a> | 
					<a href="<%=request.getContextPath()%>/member/memberAll.jsp?mode=find">회원찾기</a> | 
					쇼핑몰 | 게시판 | 
					<a href="<%=request.getContextPath()%>/company.jsp">회사소개</a>
				</td>
			</tr>
			<tr>
				<td width="20%">tree/view</td>
				<td width="80%">
				
				
				
				
				
				
				
				
				
				
				
				