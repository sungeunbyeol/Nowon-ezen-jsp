<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.dto.*"%>
<!-- content.jsp -->
<%@ tablib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tablib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title>�Խñۻ󼼺���</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div align="center">
	<b>�۳��� ����</b><br><br>
	<table border="1" width="500">
		<tr>
			<th bgcolor="yellow" width="20%">�۹�ȣ</th>
			<td align="center" width="30%">${getboard.num}</td>
			<th bgcolor="yellow" width="20%">��ȸ��</th>
			<td align="center" width="30%">${getboard.readcount}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�ۼ���</th>
			<td align="center" width="30%">${getboard.writer}</td>
			<th bgcolor="yellow" width="20%">�ۼ���</th>
			<td align="center" width="30%">${getboard.reg_date}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">������</th>
			<td width="80%" colspan="3">${getboard.subject}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�۳���</th>
			<td width="80%" colspan="3">${getboard.content}</td>
		</tr>
		<tr>
			<td colspan="4" bgcolor="yellow" align="right">
				<input type="button" value="��۾���" 
				onclick="window.location='writeForm.board?num=${getboard.num}&re_step=${getboard.re_step}&re_level=${getboard.re_level}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="�ۼ���" onclick="window.location='updateForm.board?num=${getboard.num}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="�ۻ���" onclick="window.location='deleteForm.board?num=${getboard.num}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="�۸��" onclick="window.location='list.board'">
			</td>
		</tr>
	</table>
</div>
</body>
</html>
















