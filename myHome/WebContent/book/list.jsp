<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.book.*"%>
<!-- list.jsp -->
<jsp:useBean id="dao" class="my.book.BookDAO" />
<html>
<head>
	<title>�������</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>�� �� �� �� �� ��</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<th>������</th>
				<th>������</th>
				<th>���ǻ�</th>
				<th>�ǸŰ�</th>
				<th>�԰���</th>
			</tr>
<!-- 			���⼭���� DB���� �ڷḦ ������ ȭ�鿡 ��½��� �ָ� �ȴ�. -->	
<%
		ArrayList<BookDTO> list = dao.listBook();
		if (list==null || list.size()==0){%> 
			<tr>
				<td colspan="5">��ϵ� ������ �����ϴ�.</td>
			</tr>		
<%	}else {
			java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
			for(BookDTO dto : list){
%>
			<tr>
				<td align="center"><%=dto.getBookname()%></td>
				<td align="center"><%=dto.getWriter()%></td>
				<td align="center"><%=dto.getPublisher()%></td>
				<td aligh="right"><%=df.format(dto.getPrice())%>��</td>
				<td align="center"><%=dto.getIndate()%></td>
			</tr>			
<%		}
		}
%>
		</table>
	</div>
</body>
</html>