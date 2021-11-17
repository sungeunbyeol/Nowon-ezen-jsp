<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.book.*"%>
<!-- find.jsp -->
<jsp:useBean id="dao" class="my.book.BookDAO" />
<%
		String search = request.getParameter("search");
		String searchString = request.getParameter("searchString");
		if (search == null || searchString == null || 
				search.trim().equals("") || searchString.trim().equals("")){
			response.sendRedirect("book.jsp");
			return;
		}
%>
<html>
<head>
	<title>����ã��</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>�� �� ã ��<h2>
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
		ArrayList<BookDTO> list = dao.findBook(search, searchString);
		if (list==null || list.size()==0){%> 
			<tr> 
				<td colspan="5">ã���ô� ������ �����ϴ�.</td>
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
<%		}%>
			<tr>
				<td colspan="5">ã���ô� ������ �� <%=list.size()%>�� �ֽ��ϴ�.</td>
			</tr>
<%	}%>
		</table>
	</div>
</body>
</html>