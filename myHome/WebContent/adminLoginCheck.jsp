<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- adminLoginCheck.jsp -->
<%@ include file="loginCheck.jsp"%>
<%
		if (!mbId.equals("admin")){%>
		<script type="text/javascript">
			alert("�����ڸ� �� �� �ִ� ������ �Դϴ�!!")
			history.back()
		</script>
<%
			return;
		}
%>