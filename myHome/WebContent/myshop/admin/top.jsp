<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->
<%@ include file="../../adminLoginCheck.jsp" %>
<html>
<head>
	<title>���θ�(������)</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div align="center">
		<font size="7">���θ�(������)</font><br>
		<font size="4">
			<a href="<%=request.getContextPath()%>/myshop/display/mall.jsp">���θ�Ȩ</a> | 
			<a href="<%=request.getContextPath()%>/index.jsp">����Ȩ</a>
		</font><br>
		<table border="1" width="800" height="650">
			<tr height="50">
				<td align="center" width="20%"><a href="cate_input.jsp">ī�װ����</a></td>
				<td align="center" width="20%"><a href="cate_list.jsp">ī�װ����</a></td>
				<td align="center" width="20%"><a href="prod_input.jsp">��ǰ���</a></td>
				<td align="center" width="20%"><a href="prod_list.jsp">��ǰ���</a></td>
				<td align="center" width="20%"><a href="../display/mall.jsp">���θ�Ȩ</a></td>
			</tr>
			<tr>
				<td colspan="5">