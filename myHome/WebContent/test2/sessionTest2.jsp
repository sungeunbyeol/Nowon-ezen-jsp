<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- sessionTest2.jsp -->
<html>
<head>
	<title>ȸ������������</title>
</head>
<body>
<%
		String id = (String)session.getAttribute("id");
		if (id == null){%>
		<script type="text/javascript">
			alert("�α����� ���� �� �ּ���!!")
			location.href="sessionTest1.jsp"
		</script>	
<%		return;
		}%>
	<h1>ȸ�� ���� ������</h1>
	<h2>ȸ���� �� �� �ֵ��� �մϴ�. �α����� �ȵǾ�����, ����� ���������� �ȵ˴ϴ�.</h2>
	<a href="sessionTest3.jsp">�α׾ƿ�</a>
</body>
</html>