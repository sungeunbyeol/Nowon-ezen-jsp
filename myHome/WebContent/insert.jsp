<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- insert.jsp -->
<jsp:useBean id="stdao" class="my.student.StudentDAO" />
<!-- my.student.StudentDAO stdao = new my.student.StudentDAO(); -->
<%
		//1. �Ѿ�� ������ �ޱ�
		request.setCharacterEncoding("EUC-KR");//�ѱۼ���(post����϶��� ����)
%>
<jsp:useBean id="stdto" class="my.student.StudentDTO" />
<jsp:setProperty property="*" name="stdto" />
<!-- stdto.setId(request.getParameter("id")); -->
<%		
		if (stdto.getId()==null || stdto.getName()==null || stdto.getCname()==null || 
			stdto.getId().trim().equals("") || stdto.getName().trim().equals("") || stdto.getCname().trim().equals("")){%>
		<script type="text/javascript">
			alert("���̵�, �л���, �б޸��� ��� �Է��� �ּž� �մϴ�.!!")
			history.back()
		</script>		
<%		return;//_jspService()�޼ҵ带 ����������... 
		} 
		int res = stdao.insertStudent(stdto.getId(), stdto.getName(), stdto.getCname());
		
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
<%	}%>









