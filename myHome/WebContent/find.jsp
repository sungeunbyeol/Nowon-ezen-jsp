<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.student.*"%>
<!-- find.jsp -->
<jsp:useBean id="stdao" class="my.student.StudentDAO" />
<html>
<head>
	<title>�л�ã��</title>
</head>
<body>
<%
		String name = request.getParameter("name");
		if (name==null || name.trim().equals("")){
			response.sendRedirect("student.jsp");
			return;
		}
%>
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
<!-- 			���⼭���� DB���� �ڷḦ ������ ȭ�鿡 ��½��� �ָ� �ȴ�. -->	
<%		ArrayList<StudentDTO> find = stdao.findStudent(name);
			if (find==null || find.size()==0){%>
			<tr>
				<td colspan="3"><%=name%> �л��� �����ϴ�.</td>
			</tr>			
<%		}else {
				for(StudentDTO dto : find){%>
			<tr>
				<td><%=dto.getId()%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getCname()%></td>
			</tr>			
<%			}%>
			<tr>
				<td colspan="3">ã���ô� <%=name%> �л��� �� <%=find.size()%>�� �ֽ��ϴ�.</td>
			</tr>
<%	}%>
		</table>
	</div>
</body>
</html>		