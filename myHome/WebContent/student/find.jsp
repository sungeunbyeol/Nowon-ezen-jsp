<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!-- find.jsp -->
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
<%
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection
					("jdbc:oracle:thin:@localhost:1521:xe", "bigdata3", "bigdata3");
			
			String sql = "select count(*) from student where name=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			if (count==0){%>
			<tr>
				<td colspan="3"><%=name%> �л��� �����ϴ�.</td>
			</tr>			
<%		}else {
				sql = "select * from student where name=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, name);
				rs = ps.executeQuery();
				while(rs.next()){
					String id = rs.getString(1);
					//String name = rs.getString(2);
					String cname = rs.getString(3);%>
			<tr>
				<td><%=id%></td>
				<td><%=name%></td>
				<td><%=cname%></td>
			</tr>			
<%			}%>
			<tr>
				<td colspan="3">ã���ô� <%=name%> �л��� �� <%=count%>�� �ֽ��ϴ�.</td>
			</tr>
<%		}
			rs.close();
			ps.close();
			con.close();
%>
		</table>
	</div>
</body>
</html>