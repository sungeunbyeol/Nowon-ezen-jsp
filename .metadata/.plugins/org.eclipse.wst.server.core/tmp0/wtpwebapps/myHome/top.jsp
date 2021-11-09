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
<%
		boolean isLogin = false;
		String mbId = (String)session.getAttribute("mbId");
		String mbName = (String)session.getAttribute("mbName");
		if (mbId != null && mbName != null){
			isLogin = true;
		}
%>
<body>
	<div align="center">
		<table border="1" width="800" height="650">
			<tr height="10%">
				<td align="center" colspan="2">
					<a href="<%=request.getContextPath()%>/index.jsp">main</a> | 
<%			if (isLogin){ %>
					<a href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a> |	
<%			}else { %>					
					<a href="<%=request.getContextPath()%>/login/login.jsp">로그인</a> |
<%			} %>					 
					<a href="javascript:checkMember()">회원가입</a> | 
					<a href="<%=request.getContextPath()%>/member/memberAll.jsp">회원보기</a> | 
					<a href="<%=request.getContextPath()%>/member/memberAll.jsp?mode=find">회원찾기</a> | 
					쇼핑몰 | 게시판 | 
					<a href="<%=request.getContextPath()%>/company.jsp">회사소개</a>
				</td>
			</tr>
			<tr>
				<td width="20%" valign="top">
<%			if (isLogin){ %>
					<%=mbName%>님[<%=mbId%>]로그인 중...
<%			}else { %>
					로그인을 해 주세요.
<%			} %>
				<br><br>
				<jsp:include page="/count/count.jsp"/>				
				</td>
				<td width="80%">
				
				
				
				
				
				
				
				
				
				
				
				