<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- sessionTest2.jsp -->
<%
		String id = (String)session.getAttribute("id");
		String pwd = (String)session.getAttribute("pwd");
		if (id == null || id.trim().equals("") || pwd == null || pwd.trim().equals("")){%>
		<script type="text/javascript">
			alert("�α����� ���� �� �ּ���!!")
			location.href="sessionTest1.jsp"
		</script>		
<%		return;
		}
%>
<h2>ȸ �� �� �� �� �� ��</h2>
<h3>ȸ���鸸 �� �� �־�� �մϴ�. ȸ���� �ƴϸ� �� �� ������ ������ �մϴ�.</h3>
<a href="sessionTest3.jsp">�α׾ƿ�</a>