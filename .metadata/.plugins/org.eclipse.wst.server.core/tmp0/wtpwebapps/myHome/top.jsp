<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->
<html>
<head>
	<title>JSP�� ����� Ȩ������</title>
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
					<a href="login.jsp">�α���</a> | 
					<a href="javascript:checkMember()">ȸ������</a> | ȸ������ | ���θ� | �Խ��� | 
					<a href="company.jsp">ȸ��Ұ�</a>
				</td>
			</tr>
			<tr>
				<td width="20%">tree/view</td>
				<td width="80%">