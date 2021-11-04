<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%@ page import="java.util.*, my.student.*" %>
<jsp:useBean id="stdao" class="my.student.StudentDAO"/>

<html>
<head>
<title>학생목록</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2> 학 생 목 록 페 이 지</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<th>아이디</th>
				<th>학생명</th>
				<th>학급명</th>
			</tr>
			
<% // 여기에 DB의 자료를 가져와서 출력시키기 
		ArrayList<StudentDTO> list = stdao.listStudent();
		if(list == null || list.size()==0){%>
			<tr>
			<td>등록된 학생이 없습니다.</td>
			</tr>

<%} else{
	for(StudentDTO dto:list){%>	
	<tr>
	<td><%=dto.getId() %></td>
	<td><%=dto.getName() %></td>
	<td><%=dto.getCname() %></td>
	
<%	}
	}%>	
		</table>
	</div>
</body>
</html>