<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- sessionTest3.jsp -->
<%
		//session.removeAttribute("id");
	 	//session.removeAttribute("pwd");
	 	session.invalidate();//session�� ��簪�� �ʱ�ȭ
%>
<script type="text/javascript">
	alert("�α׾ƿ��Ǿ����ϴ�.!!")
	location.href="sessionTest1.jsp"
</script>