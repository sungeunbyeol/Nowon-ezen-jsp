<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!-- insert.jsp -->
<%
		//1. �Ѿ�� ������ �ޱ�
		request.setCharacterEncoding("EUC-KR");//�ѱۼ���(post����϶��� ����)
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String cname = request.getParameter("cname");
		
		if (id==null || name==null || cname==null || id.trim().equals("") 
				|| name.trim().equals("") || cname.trim().equals("")){%>
		<script type="text/javascript">
			alert("���̵�, �л���, �б޸��� ��� �Է��� �ּž� �մϴ�.!!")
			history.back()
		</script>		
<%		return;//_jspService()�޼ҵ带 ����������... 
		}
		//2. DB �����ϱ�
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection
						("jdbc:oracle:thin:@localhost:1521:xe", "bigdata3", "bigdata3");
		//3. ������ �����Ͽ� DB�� �� �ֱ�
		String sql = "insert into student values(?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, name);
		ps.setString(3, cname);
		//4. ���� ������ �Ǵ��Ͽ� ������ �̵���Ű��
		int res = ps.executeUpdate();
		if (res>0){%>
		<script type="text/javascript">
			alert("�л���ϼ���!! �л������������ �̵��մϴ�.")
			location.href="list.jsp"
		</script>		
<%	}else {%>
		<script type="text/javascript">
			alert("�л���Ͻ���!! �л������������� �̵��մϴ�.")
			location.href="student.jsp"
		</script>			
<%	}
		//5. DB �ݱ�
		ps.close();
		con.close();
%>









