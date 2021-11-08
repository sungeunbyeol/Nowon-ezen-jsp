<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- sessionTest3.jsp -->
<%
		//session.removeAttribute("id");
	 	//session.removeAttribute("pwd");
	 	session.invalidate();//session의 모든값을 초기화
%>
<script type="text/javascript">
	alert("로그아웃되었습니다.!!")
	location.href="sessionTest1.jsp"
</script>