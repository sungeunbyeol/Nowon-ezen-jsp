<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->
<html>
<head>
	<title>JSP�� ����� Ȩ������</title>
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
					<a href="<%=request.getContextPath()%>/login/logout.jsp">�α׾ƿ�</a> |	
<%			}else { %>					
					<a href="<%=request.getContextPath()%>/login/login.jsp">�α���</a> |
<%			} %>					 
					<a href="javascript:checkMember()">ȸ������</a> | 
<%			if (mbId != null && mbId.equals("admin")){ %>					
					<a href="<%=request.getContextPath()%>/member/memberAll.jsp">ȸ������</a> | 
					<a href="<%=request.getContextPath()%>/member/memberAll.jsp?mode=find">ȸ��ã��</a> |
					<a href="<%=request.getContextPath()%>/myshop/admin/main.jsp">���θ�(������)</a> | 
<%			} %>					 
					<a href="<%=request.getContextPath()%>/myshop/display/mall.jsp">���θ�</a> | 
					<a href="<%=request.getContextPath()%>/board/list.jsp">�Խ���</a> | 
					<a href="<%=request.getContextPath()%>/board2/list.jsp">�ڷ�ǰԽ���</a> | 
					<a href="<%=request.getContextPath()%>/company.jsp">ȸ��Ұ�</a>
				</td>
			</tr>
			<tr>
				<td width="20%" valign="top">
<%			if (isLogin){ %>
					<%=mbName%>��[<%=mbId%>]�α��� ��...
<%			}else { %>
					�α����� �� �ּ���.
<%			} %>
				<br><br>
				<jsp:include page="/count/count.jsp"/>				
				</td>
				<td width="80%">
				
				
				
				
				
				
				
				
				
				
				
				<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->
<html>
<head>
	<title>JSP�� ����� Ȩ������</title>
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
					<a href="<%=request.getContextPath()%>/login/logout.jsp">�α׾ƿ�</a> |	
<%			}else { %>					
					<a href="<%=request.getContextPath()%>/login/login.jsp">�α���</a> |
<%			} %>					 
					<a href="javascript:checkMember()">ȸ������</a> | 
<%			if (mbId != null && mbId.equals("admin")){ %>					
					<a href="<%=request.getContextPath()%>/member/memberAll.jsp">ȸ������</a> | 
					<a href="<%=request.getContextPath()%>/member/memberAll.jsp?mode=find">ȸ��ã��</a> |
					<a href="<%=request.getContextPath()%>/myshop/admin/main.jsp">���θ�(������)</a> | 
<%			} %>					 
					<a href="<%=request.getContextPath()%>/myshop/display/mall.jsp">���θ�</a> | 
					<a href="<%=request.getContextPath()%>/board/list.jsp">�Խ���</a> | 
					<a href="<%=request.getContextPath()%>/board2/list.jsp">�ڷ�ǰԽ���</a> | 
					<a href="<%=request.getContextPath()%>/company.jsp">ȸ��Ұ�</a>
				</td>
			</tr>
			<tr>
				<td width="20%" valign="top">
<%			if (isLogin){ %>
					<%=mbName%>��[<%=mbId%>]�α��� ��...
<%			}else { %>
					�α����� �� �ּ���.
<%			} %>
				<br><br>
				<jsp:include page="/count/count.jsp"/>				
				</td>
				<td width="80%">
				
				
				
				
				
				
				
				
				
				
				
				