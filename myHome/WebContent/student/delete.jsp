<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!-- delete.jsp -->
<%
		//1. �Ѿ�� ������ �ޱ�
		String id = request.getParameter("id");
		if (id==null || id.trim().equals("")){
			response.sendRedirect("student.jsp");	//�����ܿ��� ������ �̵��� �����ִ� ��ɾ�
			return;
		}
		//2. DB �����ϱ�
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521:xe", "bigdata3", "bigdata3");
		//3. ������ �����Ͽ� DB�� �� �ֱ�
		String sql = "delete from student where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		//4. ���� ������ �Ǵ��Ͽ� ������ �̵���Ű��
		int res = ps.executeUpdate();
		String msg = null, url = null;
		if (res>0){
			msg = "�л���������!! �л������������ �̵��մϴ�.";
			url = "list.jsp";
		}else {
			msg = "�л���������!! �л������������� �̵��մϴ�.";
			url = "student.jsp";
		}
		//5. DB �ݱ�
		ps.close();
		con.close();
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>













