<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- result.jsp -->
<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		//�α����� ����, id�� admin�̰� pwd�� 1234�϶� �α��� �ȴ� ��� ��������
		String msg = null, url = null;
		if (id.equals("admin")){
			if (pwd.equals("1234")){
				session.setAttribute("id", id);
				session.setAttribute("pwd", pwd);
				msg = "�α��� �Ǿ����ϴ�. ȸ�������������� �̵��մϴ�.";
				url = "sessionTest2.jsp";
			}else {
				msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���!!";
				url = "sessionTest1.jsp";
			}
		}else {
			msg = "���̵� �����ϴ�. �ٽ� �Է��� �ּ���!!";
			url = "sessionTest1.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>