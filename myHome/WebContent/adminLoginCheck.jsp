<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- adminLoginCheck.jsp -->
<%@ include file="loginCheck.jsp"%>
<%
		if (!mbId.equals("admin")){%>
		<script type="text/javascript">
			alert("관리자만 볼 수 있는 페이지 입니다!!")
			history.back()
		</script>
<%
			return;
		}
%>