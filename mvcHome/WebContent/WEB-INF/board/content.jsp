<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.dto.*"%>
<!-- content.jsp -->
<html>
<head>
	<title>�Խñۻ󼼺���</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<%		
		BoardDBBean dto = (BoardDBBean)request.getAttribute("getBoard");
%>
<body>
<div align="center">
	<b>�۳��� ����</b><br><br>
	<table border="1" width="500">
		<tr>
			<th bgcolor="yellow" width="20%">�۹�ȣ</th>
			<td align="center" width="30%"><%=dto.getNum()%></td>
			<th bgcolor="yellow" width="20%">��ȸ��</th>
			<td align="center" width="30%"><%=dto.getReadcount()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�ۼ���</th>
			<td align="center" width="30%"><%=dto.getWriter()%></td>
			<th bgcolor="yellow" width="20%">�ۼ���</th>
			<td align="center" width="30%"><%=dto.getReg_date()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">������</th>
			<td width="80%" colspan="3"><%=dto.getSubject()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�۳���</th>
			<td width="80%" colspan="3"><%=dto.getContent()%></td>
		</tr>
		<tr>
			<td colspan="4" bgcolor="yellow" align="right">
				<input type="button" value="��۾���" 
				onclick="window.location='writeForm.board?num=<%=dto.getNum()%>&re_step=<%=dto.getRe_step()%>&re_level=<%=dto.getRe_level()%>'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="�ۼ���" onclick="window.location='updateForm.board?num=<%=dto.getNum()%>'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="�ۻ���" onclick="window.location='deleteForm.board?num=<%=dto.getNum()%>'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="�۸��" onclick="window.location='list.board'">
			</td>
		</tr>
	</table>
</div>
</body>
</html>
















