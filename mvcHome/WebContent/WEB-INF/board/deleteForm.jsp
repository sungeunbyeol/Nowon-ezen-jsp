<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- deleteForm.jsp -->
<%@ tablib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tablib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>�ۻ���</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div align="center">
	<b>�ۻ���</b>
	<br><br>
	<form name="f" action="deletePro.board" method="post">
		<input type="hidden" name="num" value="${param.num}"/>
		<table border="1" width="400">
			<tr bgcolor="yellow">
				<th>��й�ȣ�� �Է��� �ּ���</th>			
			</tr>
			<tr>
				<td align="center">��й�ȣ : <input type="password" name="passwd"></td>
			</tr>
			<tr bgcolor="yellow">
				<td>
					<input type="submit" value="�ۻ���">
					<input type="button" value="�۸��" onclick="window.location='list.board'">
				</td>	
			</tr>
		</table>
	</form>
</div>
</body>
</html>