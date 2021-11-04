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
	<title>학생찾기</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2><%=name%> 학 생 찾 기</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<th>아이디</th>
				<th>학생명</th>
				<th>학급명</th>
			</tr>
<%	ArrayList<StudentDTO> find = stdao.findStudent(name);	
		if (find == null || find.size() == 0){%>
		<tr>
			<td colspan="3"><%=name%>학생은 없습니다.</td>
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
			<td colspan="3"><%=name%>학생은 총 <%=find.size()%>명 있습니다.</td>
		</tr>
<%	} %><!-- end if -->		
		</table>
	</div>
</body>
</html>












