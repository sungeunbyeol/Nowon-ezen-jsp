<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->
<%@ include file="../../adminLoginCheck.jsp" %>
<html>
<head>
	<title>쇼핑몰(관리자)</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div align="center">
		<font size="7">쇼핑몰(관리자)</font><br>
		<font size="4">
			<a href="<%=request.getContextPath()%>/myshop/display/mall.jsp">쇼핑몰홈</a> | 
			<a href="<%=request.getContextPath()%>/index.jsp">메인홈</a>
		</font><br>
		<table border="1" width="800" height="650">
			<tr height="50">
				<td align="center" width="20%"><a href="cate_input.jsp">카테고리등록</a></td>
				<td align="center" width="20%"><a href="cate_list.jsp">카테고리목록</a></td>
				<td align="center" width="20%"><a href="prod_input.jsp">상품등록</a></td>
				<td align="center" width="20%"><a href="prod_list.jsp">상품목록</a></td>
				<td align="center" width="20%"><a href="../display/mall.jsp">쇼핑몰홈</a></td>
			</tr>
			<tr>
				<td colspan="5">