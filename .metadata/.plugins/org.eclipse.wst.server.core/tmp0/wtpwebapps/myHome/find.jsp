<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.student.*" %>    
<!-- find.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");
		if (name==null || name.trim().equals("")) {
			response.sendRedirect("student.jsp");
			return;
		}
%>
<jsp:useBean id="stdao" class="my.student.StudentDAO" />
<html>
<head>
	<title>�л�ã��</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2><%=name%> �� �� ã ��</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<th>���̵�</th>
				<th>�л���</th>
				<th>�б޸�</th>
			</tr>
<%	ArrayList<StudentDTO> find = stdao.findStudent(name);	
		if (find == null || find.size() == 0){%>
		<tr>
			<td colspan="3"><%=name%>�л��� �����ϴ�.</td>
		</tr>
<%	} else {
			for(StudentDTO dto : find){%>
		<tr>
			<td><%=dto.getId()%></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getCname()%></td>
		</tr>		
<%		}%><!-- end for -->
		<tr>
			<td colspan="3"><%=name%>�л��� �� <%=find.size()%>�� �ֽ��ϴ�.</td>
		</tr>
<%	} %><!-- end if -->		
		</table>
	</div>
</body>
</html>












