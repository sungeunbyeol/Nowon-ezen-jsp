<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<!-- delete.jsp -->
<jsp:useBean id="stdao" class="my.student.StudentDAO" />
<%
		//1. �Ѿ�� ������ �ޱ�
		String id = request.getParameter("id");
		if (id==null || id.trim().equals("")){
			response.sendRedirect("student.jsp");	//�����ܿ��� ������ �̵��� �����ִ� ��ɾ�
			return;
		}
		int res = stdao.deleteStudent(id);
		String msg = null, url = null; 
		if (res>0){
			msg = "�л���������!! �л������������ �̵��մϴ�.";
			url = "list.jsp";
		}else {
			msg = "�л���������!! �л������������� �̵��մϴ�.";
			url = "student.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>













